root.HelpMenu = {
    DrawType = DrawComponentType.SystemMenu,
    Type = HelpMenuType.CHLCC,
    FadeInDuration = 25/60,
    FadeOutDuration = 25/60,
    PageStartYOffset = -400,
    BackGuideSlideDuration = 2/60,
    PageSprite = "HelpPage",
    BackGuideSprite = "HelpBackGuide",
    BackGuidePosition = { X = 1692, Y = 976 },
}

root.Sprites["HelpPage"] = {
    Sheet = "Help",
    Bounds = { X = 0, Y = 0, Width = 1920, Height = 1080 }
};
root.Sprites["HelpBackGuide"] = {
    Sheet = "Guide",
    Bounds = { X = 2, Y = 246, Width = 228, Height = 44 }
};
