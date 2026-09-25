#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
image_name=impacto-ubuntu-build:24.04
build_dir="$repo_dir/impacto-build/Ubuntu2404DockerRelease"
downloads_dir="$repo_dir/impacto-build/Ubuntu2404DockerDownloads"
buildtrees_dir="$repo_dir/impacto-build/Ubuntu2404DockerVcpkgBuildtrees"
archives_dir="$repo_dir/impacto-build/Ubuntu2404DockerVcpkgArchives"
install_dir="$repo_dir/install/Ubuntu2404DockerRelease"

mkdir -p "$build_dir" "$downloads_dir" "$buildtrees_dir" "$archives_dir" "$install_dir"

docker build \
  --build-arg "HOST_UID=$(id -u)" \
  --build-arg "HOST_GID=$(id -g)" \
  -t "$image_name" \
  -f "$repo_dir/docker/impacto-ubuntu/Dockerfile" \
  "$repo_dir/docker/impacto-ubuntu"

docker run --rm \
  --mount "type=bind,src=$repo_dir,dst=/workspace/impacto" \
  --mount "type=bind,src=$buildtrees_dir,dst=/opt/vcpkg/buildtrees" \
  --env "IMPACTO_JOBS=${IMPACTO_JOBS:-4}" \
  --env VCPKG_DOWNLOADS=/workspace/impacto/impacto-build/Ubuntu2404DockerDownloads \
  --env VCPKG_DEFAULT_BINARY_CACHE=/workspace/impacto/impacto-build/Ubuntu2404DockerVcpkgArchives \
  --workdir /workspace/impacto \
  "$image_name" \
  bash -euc '
    cmake --preset Release \
      -B /workspace/impacto/impacto-build/Ubuntu2404DockerRelease \
      -DCMAKE_INSTALL_PREFIX=/workspace/impacto/install/Ubuntu2404DockerRelease
    cmake --build /workspace/impacto/impacto-build/Ubuntu2404DockerRelease \
      --target install --parallel "$IMPACTO_JOBS"
  '
