#!/usr/bin/env python3
"""Make a disposable Switch CHLCC stage; never write to either RomFS."""
import argparse
from pathlib import Path, PurePosixPath
import struct

ARCHIVES = ("bg_webp.mpk", "bgm_ninopus.mpk", "chara_webp.mpk",
            "chara2_webp.mpk", "mask.mpk", "se_ninopus.mpk",
            "shader_swi.mpk", "sysse_ninopus.mpk", "system_swi.mpk",
            "voice_ninopus.mpk")


def cls(path):
    names = [x.rstrip().replace("\\", "/")
             for x in path.read_text(encoding="utf-8-sig").splitlines()]
    for name in names:
        rel = PurePosixPath(name)
        if not name or rel.is_absolute() or ".." in rel.parts:
            raise ValueError(f"unsafe CLS name {name!r}")
    return names


def mpk(path):
    with path.open("rb") as stream:
        header = stream.read(64)
        if header[:8] != b"MPK\0\0\0\x02\0":
            raise ValueError(f"not MPK 2.0: {path}")
        table = [stream.read(256) for _ in range(
            struct.unpack_from("<I", header, 8)[0])]
        rows = []
        seen = set()
        for entry in table:
            if len(entry) != 256:
                raise ValueError(f"truncated table: {path}")
            compression, file_id, offset, _, size = struct.unpack_from(
                "<IIQQQ", entry)
            name = entry[32:].split(b"\0", 1)[0].decode("utf-8")
            if file_id in seen or compression not in (0, 1) or not offset:
                raise ValueError(f"bad MPK entry {file_id}: {path}")
            seen.add(file_id)
            stream.seek(offset)
            sig = stream.read(12)
            kind = ("PNG" if sig.startswith(b"\x89PNG") else
                    "WebP" if sig[:4] == b"RIFF" and sig[8:] == b"WEBP" else
                    "MVL" if sig[:4] == b"MVL1" else
                    "Nintendo Opus" if sig[:4] == b"\x01\0\0\x80" else
                    "other")
            rows.append((file_id, name, size, compression, kind))
        return rows


def link(path, target):
    if not target.exists():
        raise FileNotFoundError(target)
    if path.is_symlink():
        if path.resolve() != target.resolve():
            raise FileExistsError(path)
    elif path.exists():
        raise FileExistsError(path)
    else:
        path.symlink_to(target, target_is_directory=target.is_dir())


def write(path, content):
    if path.exists() and path.read_text() != content:
        raise FileExistsError(path)
    path.write_text(content)


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    for arg in ("program1", "program2", "stage"):
        ap.add_argument(arg, type=Path)
    args = ap.parse_args()
    p1, p2 = args.program1.resolve(strict=True), args.program2.resolve(strict=True)
    stage = args.stage.absolute()
    if stage.is_symlink() or any(
            stage == p or p in stage.parents for p in (p1, p2)):
        ap.error("stage must be outside both RomFS trees")
    scripts, movies = cls(p1 / "script.cls"), cls(p1 / "movie.cls")
    for i, name in enumerate(scripts):
        if not (p1 / "script" / f"{name}.scx").is_file():
            raise FileNotFoundError(f"script {i}: {name}")
        if not (p1 / "script" / "mes00" / f"{name}.msb").is_file():
            raise FileNotFoundError(f"MSB {i}: {name}")
    movie_rows = []
    for i, name in enumerate(movies):
        source = next((label for label, root in
                       (("program1", p1), ("program2", p2))
                       if (root / "movie" / "webm" / f"{name}.webm").is_file()),
                      None)
        if source is None:
            raise FileNotFoundError(f"movie {i}: {name}")
        movie_rows.append((i, name, source))
    archives = {name: mpk(p1 / name) for name in ARCHIVES}

    data = stage / "gamedata" / "chlcc-switch"
    (data / "movie").mkdir(parents=True, exist_ok=True)
    for name in (*ARCHIVES, "script", "script.cls", "movie.cls", "cl.png"):
        link(data / name, p1 / name)
    for label, root in (("program1", p1), ("program2", p2)):
        link(data / "movie" / label, root / "movie" / "webm")
    write(data / "movie.mlp", "".join(
        f"movie/{source}/{name}.webm,{i}\n"
        for i, name, source in movie_rows))
    inventory = ["archive\tid\tname\tbytes\tcompression\tformat\n"]
    for archive, rows in archives.items():
        inventory += [f"{archive}\t{i}\t{name}\t{size}\t{comp}\t{kind}\n"
                      for i, name, size, comp, kind in rows]
    inventory += [f"script.cls\t{i}\t{name}.scx\t\t\tSC3\n"
                  for i, name in enumerate(scripts)]
    inventory += [f"movie.cls\t{i}\t{source}/{name}.webm\t\t\tWebM\n"
                  for i, name, source in movie_rows]
    write(data / "inventory.tsv", "".join(inventory))
    repo = Path(__file__).resolve().parent.parent
    install = repo / "install" / "Ubuntu2404DockerRelease"
    write(stage / "basepaths.lua", "\n".join((
        "root.BasePaths = {",
        f'  RootInstallDir = "{install}",',
        f'  RootGamedataDir = "{stage / "gamedata"}",',
        f'  RootProfilesDir = "{repo / "profiles"}",',
        f'  RootPatchesDir = "{repo / "patches"}",',
        f'  RootSavesDir = "{stage / "saves"}",',
        "};", "")))
    print(f"{sum(map(len, archives.values()))} MPK entries, "
          f"{len(scripts)} SCX/MSB pairs, {len(movies)} movies "
          f"({sum(x[2] == 'program1' for x in movie_rows)} from program1)")


if __name__ == "__main__":
    main()
