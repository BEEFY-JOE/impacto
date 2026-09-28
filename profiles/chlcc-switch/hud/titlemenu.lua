root.TitleMenu.PressToStartPos = { X = 113, Y = 897 };
root.TitleMenu.IntroBouncingStarBaseYOffset = 243;
root.TitleMenu.IntroCHLogoFadeAnimationStartY = 609;
root.TitleMenu.IntroLogoStarHighlightPosition = { X = 698, Y = 522 };
root.TitleMenu.IntroDelusionADVPositions = {
    { X = 120,   Y = 603 },
    { X = 156,   Y = 603 },
    { X = 190.5, Y = 603 },
    { X = 225,   Y = 603 },
    { X = 258,   Y = 603 },
    { X = 292.5, Y = 603 },
    { X = 322.5, Y = 603 }
};
root.TitleMenu.IntroLogoPopOutOffset = { X = -9, Y = -9 };
root.TitleMenu.LCCLogoPositions = {
    { X = 356, Y = 530 },
    { X = 533, Y = 540 },
    { X = 753, Y = 515 },
    { X = 927, Y = 482 }
};
root.TitleMenu.DelusionADVPosition = { X = 115, Y = 595 };
root.TitleMenu.DelusionADVPopoutOffset = { X = -3, Y = -4.5 };
root.TitleMenu.SeiraUnderPosition = { X = 1100, Y = 0 };
root.TitleMenu.SeiraPopoutOffset = { X = -72, Y = -72 };
root.TitleMenu.SeiraPosition = { X = 1090, Y = -72 };
root.TitleMenu.CHLogoPosition = { X = 92, Y = 421 };
root.TitleMenu.LCCLogoUnderPosition = { X = 363, Y = 495 };
root.TitleMenu.StarLogoPosition = { X = 698, Y = 522 };
root.TitleMenu.CopyrightTextPosition = { X = 112, Y = 996 };
root.TitleMenu.SpinningCirclePosition = { X = 915.75, Y = -428.25 };
root.TitleMenu.ItemHighlightOffset = { X = 111, Y = 5 };
root.TitleMenu.ItemYBase = 103;
root.TitleMenu.ItemPadding = 60;
root.TitleMenu.MenuEntriesNum = 15;
root.TitleMenu.HasHelpMainEntry = true;
root.TitleMenu.StartMainEntryPresentationOnly = true;
root.TitleMenu.ConfigMainEntryResult = 10;
root.TitleMenu.ConfigMainEntrySelectionReadyFlag = 2050;
root.TitleMenu.RenderBehindConfigOpening = true;
root.TitleMenu.MainGuideSprite = "TitleMenuGuide";
root.TitleMenu.MainGuidePosition = { X = 1335, Y = 977 };
root.TitleMenu.LoadSubmenuHandledByUI = true;
root.TitleMenu.LockedExtraSubmenuHandledByUI = true;
root.TitleMenu.LockedExtraHasTrophy = false;
root.TitleMenu.SecondaryItemX = 480;
root.TitleMenu.ItemLoadQuickY = 125;
root.TitleMenu.ItemLoadY = 164;
root.TitleMenu.SecondaryItemHighlightX = 427;
root.TitleMenu.SecondaryMenuLineX = 353;
root.TitleMenu.SecondaryMenuLoadLineY = 140;
root.TitleMenu.SecondaryMenuLoadQuickLineY = 177;
root.TitleMenu.LockedExtraClearListY = 185;
root.TitleMenu.LockedExtraTipsY = 224;
root.TitleMenu.LockedExtraClearLineY = 199;
root.TitleMenu.LockedExtraTipsLineY = 237;

local mainEntryNormalY = { 187, 225, 263, 300 };
local mainEntryFocusedY = { 0, 37, 75, 112 };
for i = 0, 3 do
    root.Sprites["TitleMenuEntry" .. i].Bounds = {
        X = 1727, Y = mainEntryNormalY[i + 1], Width = 187, Height = 36
    };
    root.Sprites["TitleMenuEntryHighlighted" .. i].Bounds = {
        X = 1727, Y = mainEntryFocusedY[i + 1], Width = 187, Height = 36
    };
end

for i = 0, 1 do
    root.Sprites["TitleMenuEntry" .. (i + 4)].Bounds = {
        X = 2052, Y = 1026 + 33 * i, Width = 325, Height = 31
    };
    root.Sprites["TitleMenuEntryHighlighted" .. (i + 4)].Bounds = {
        X = 1725, Y = 1026 + 33 * i, Width = 325, Height = 31
    };
end

for _, entry in ipairs({
    { Index = 6, RowY = 1092 },
    { Index = 10, RowY = 1224 }
}) do
    root.Sprites["TitleMenuEntry" .. entry.Index].Bounds = {
        X = 2052, Y = entry.RowY, Width = 325, Height = 31
    };
    root.Sprites["TitleMenuEntryHighlighted" .. entry.Index].Bounds = {
        X = 1725, Y = entry.RowY, Width = 325, Height = 31
    };
end

root.Sprites["TitleMenuSecondaryItemHighlight"].Bounds = {
    X = 1373, Y = 1488, Width = 427, Height = 42
};
root.Sprites["TitleMenuItemUpLine"].Bounds = {
    X = 2707, Y = 1267, Width = 78, Height = 43
};
root.Sprites["TitleMenuItemStraightLine"].Bounds = {
    X = 2707, Y = 1331, Width = 78, Height = 5
};

root.Sprites["TitleMenuEntry14"] = {
    Sheet = "Title",
    Bounds = { X = 1727, Y = 338, Width = 187, Height = 36 }
};
root.TitleMenu.MenuEntriesSprites[#root.TitleMenu.MenuEntriesSprites + 1] = "TitleMenuEntry14";

root.Sprites["TitleMenuEntryHighlighted14"] = {
    Sheet = "Title",
    Bounds = { X = 1727, Y = 150, Width = 187, Height = 36 }
};
root.TitleMenu.MenuEntriesHighlightedSprites[#root.TitleMenu.MenuEntriesHighlightedSprites + 1] = "TitleMenuEntryHighlighted14";

root.Sprites["TitleMenuItemHighlight"].Bounds = { X = 0, Y = 0, Width = 0, Height = 0 };

root.Sprites["TitleMenuGuide"] = {
    Sheet = "Guide",
    Bounds = { X = 0, Y = 196, Width = 1018, Height = 47 }
};

root.Sprites["TitleMenuPressToStart"].Bounds = { X = 7, Y = 1386, Width = 450, Height = 34 };

root.Sprites["DelusionADVUnder"].Bounds = { X = 2795, Y = 1162, Width = 240, Height = 37 };

root.Sprites["DelusionADV"].Bounds = { X = 2795, Y = 1096, Width = 240, Height = 37 };

root.Sprites["IntroDelusionADV1"].Bounds = { X = 2795, Y = 1026, Width = 35, Height = 29 };

root.Sprites["IntroDelusionADV2"].Bounds = { X = 2831, Y = 1027, Width = 35, Height = 28 };

root.Sprites["IntroDelusionADV3"].Bounds = { X = 2867, Y = 1027, Width = 34, Height = 28 };

root.Sprites["IntroDelusionADV4"].Bounds = { X = 2903, Y = 1026, Width = 34, Height = 29 };

root.Sprites["IntroDelusionADV5"].Bounds = { X = 2938, Y = 1027, Width = 34, Height = 28 };

root.Sprites["IntroDelusionADV6"].Bounds = { X = 2973, Y = 1027, Width = 32, Height = 28 };

root.Sprites["IntroDelusionADV7"].Bounds = { X = 3007, Y = 1027, Width = 33, Height = 28 };

root.Sprites["SeiraUnder"].Bounds = { X = 836, Y = 0, Width = 890, Height = 1156 };

root.Sprites["Seira"].Bounds = { X = 0, Y = 0, Width = 832, Height = 1156 };

root.Sprites["CHLogo"].Bounds = { X = 2, Y = 1159, Width = 873, Height = 169 };

root.Sprites["LCCLogoUnder"].Bounds = { X = 901, Y = 1160, Width = 681, Height = 179 };

root.Sprites["ChuLeftLogo"].Bounds = { X = 728, Y = 1409, Width = 197, Height = 102 };

root.Sprites["ChuRightLogo"].Bounds = { X = 1042, Y = 1384, Width = 198, Height = 102 };

root.Sprites["LoveLogo"].Bounds = { X = 515, Y = 1399, Width = 203, Height = 133 };

root.Sprites["StarLogo"].Bounds = { X = 932, Y = 1391, Width = 98, Height = 102 };

root.Sprites["ExclMarkLogo"].Bounds = { X = 1252, Y = 1351, Width = 111, Height = 120 };

root.Sprites["CopyrightText"].Bounds = { X = 2053, Y = 1427, Width = 484, Height = 17 };
root.Sprites["CopyrightText"].BaseScale = { X = 4 / 3, Y = 4 / 3 };

root.Sprites["SpinningCircle"].Bounds = { X = 2083, Y = 34, Width = 956, Height = 957 };

root.Sprites["TitleMenuIntroBackground"].Bounds = { X = 0, Y = 0, Width = 1920, Height = 1080 };

root.Sprites["IntroSmallStar"].Bounds = { X = 1729, Y = 875, Width = 69, Height = 68 };

root.Sprites["IntroBigStar"].Bounds = { X = 1733, Y = 592, Width = 269, Height = 256 };

root.Sprites["LogoStarHighlight"].Bounds = { X = 1804, Y = 1391, Width = 98, Height = 102 };

root.TitleMenu.IntroFallingStarsAnimationDistance = 3819;

root.Sprites["IntroBrightGreenHighlight"].Bounds = { X = 2304, Y = 0, Width = 384, Height = 384 };

root.Sprites["IntroSunHighlight"].Bounds = { X = 0, Y = 0, Width = 768, Height = 768 };

root.Sprites["IntroGrayHighlight"].Bounds = { X = 2304, Y = 384, Width = 384, Height = 384 };

root.Sprites["IntroCrescentRainbowHighlight"].Bounds = { X = 0, Y = 768, Width = 768, Height = 768 };

root.Sprites["IntroBlueHighlight"].Bounds = { X = 1920, Y = 384, Width = 384, Height = 384 };

root.Sprites["IntroWhiteHighlight"].Bounds = { X = 1920, Y = 0, Width = 384, Height = 384 };

root.Sprites["IntroBrownHighlight"].Bounds = { X = 1536, Y = 384, Width = 384, Height = 384 };

root.Sprites["IntroDiamondHighlight"].Bounds = { X = 768, Y = 768, Width = 768, Height = 768 };

root.Sprites["IntroDarkGreenHighlight"].Bounds = { X = 1536, Y = 0, Width = 384, Height = 384 };

root.Sprites["IntroCircularRainbowHighlight"].Bounds = { X = 768, Y = 0, Width = 768, Height = 768 };

root.Sprites["TitleMenuBackground"].Bounds = { X = 0, Y = 0, Width = 1920, Height = 1080 };
