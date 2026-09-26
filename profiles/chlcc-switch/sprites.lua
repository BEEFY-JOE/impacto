-- Mappings are from program1 system_swi.mpk names and PNG IHDR dimensions.
-- Atlas sprite bounds inherited from the PS3 profile remain provisional.
local function sheet(name, id, width, height)
    root.SpriteSheets[name] = {
        Path = {Mount = "system", Id = id},
        DesignWidth = width,
        DesignHeight = height,
    };
end

sheet("CG",                  0, 3072, 1536); -- albumchip
sheet("AlbumThumbnailSheet",25, 3072, 1536);
sheet("AlbumThumbnailSheet2",26,3072, 1536);
sheet("Backlog",             1, 3072, 1536);
sheet("ClearList",           3, 3072, 1536);
sheet("Data",               27, 3072, 1536); -- data01_chlcc
sheet("Menu",               11, 3072, 1536);
sheet("Tips",               16, 3072, 1536);
sheet("Font",                6, 4096, 10403);
sheet("Main",               11, 3072, 1536);
sheet("Movie",              12, 3072, 1536);
sheet("Sound",              13, 3072, 1536);
sheet("Options",             4, 3072, 1536);
sheet("Save",               15, 3072, 1536);
sheet("TitleBg1",           17, 1920, 1080);
sheet("TitleBg2",           18, 1920, 1080);
sheet("Title",              19, 3072, 1536);

-- The remaining PS3 sheet concepts have no confirmed one-to-one Switch
-- equivalent. These are temporary valid-image mappings for startup testing.
sheet("Highlights",         19, 3072, 1536);
sheet("DelusionUnderlayer", 28, 1920, 1080);
sheet("DelusionMask",       29, 2400, 1080);
sheet("DelusionText",       31, 1920, 2016);
sheet("Trophy",             32, 2048, 538);
root.SpriteSheets["FontOutline"] = nil;

for i = 0, 7 do
    root.Sprites["WaitIconSpriteAnimationDef" .. (i + 1)].Bounds = {
        X = 0, Y = 146 + 51 * i, Width = 50, Height = 48
    };
end

for i = 0, 2 do
    root.Sprites["SaveIcon" .. i].Bounds = {
        X = 1216, Y = 80 + 32 * i, Width = 190, Height = 30
    };
end
