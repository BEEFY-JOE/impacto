root.OptionsMenu.UseSubmenuCounterLifecycle = true;
root.OptionsMenu.ShowControllerType = false;
root.OptionsMenu.ShowImageSize = false;

root.OptionsMenu.MenuTitleTextRightPos = { X = 824, Y = 785 };
root.OptionsMenu.ButtonPromptPosition = { X = 720, Y = 974 };
root.OptionsMenu.SelectedDotOffset = { X = -12.5, Y = 15 };
root.OptionsMenu.SelectedDotVoicesOffset = { X = -14, Y = 15 };
root.OptionsMenu.VoiceMutedOffset = { X = 34.5, Y = 0 };
root.OptionsMenu.SelectedLabelBaseSpeed = 73.5 / (4 / 60);
root.OptionsMenu.SelectedLabelModalDistancePerEntry = 73.5;

root.OptionsMenu.BasicSettingsPos = { X = 0.5, Y = 67.5 };
root.OptionsMenu.TextSettingsPos = { X = 0.5, Y = 549.5 };
root.OptionsMenu.SoundSettingsPos = { X = 0.5, Y = 67.5 };
root.OptionsMenu.VoiceSettingsPos = { X = -1.5, Y = 69 };

root.OptionsMenu.SliderBarTopRightOffset = { X = -26, Y = 9 };
root.OptionsMenu.SliderBarFillOffset = { X = 7, Y = 5 };
root.OptionsMenu.SettingButtonTopRightOffset = { X = -21, Y = 7 };

root.OptionsMenu.TextPageEntryPositions = {
    { X = 156, Y = 184.5 },
    { X = 156, Y = 258 },
    { X = 156, Y = 331.5 },
    { X = 156, Y = 405 },
    { X = 156, Y = 478.5 },
    { X = 156, Y = 666 },
    { X = 156, Y = 739.5 },
    { X = 156, Y = 813 }
};

root.OptionsMenu.SoundPageEntryPositions = {
    { X = 156, Y = 184.5 },
    { X = 156, Y = 258 },
    { X = 156, Y = 331.5 },
    { X = 156, Y = 405 },
    { X = 156, Y = 478.5 },
    { X = 156, Y = 552 }
};

root.OptionsMenu.VoicePageEntryPositions = {
    { X = 156, Y = 184.5 },
    { X = 156, Y = 253.5 },
    { X = 156, Y = 322.5 },
    { X = 156, Y = 391.5 },
    { X = 156, Y = 460.5 },
    { X = 156, Y = 529.5 },
    { X = 156, Y = 598.5 },
    { X = 156, Y = 667.5 },
    { X = 156, Y = 736.5 },
    { X = 156, Y = 805.5 },
    { X = 156, Y = 874.5 }
};

root.Sprites["BasicSettingsSprite"].Bounds = { X = 680, Y = 0, Width = 750, Height = 315 };
root.Sprites["TextSettingsSprite"].Bounds = { X = 680, Y = 482, Width = 588, Height = 313 };
root.Sprites["SoundSettingsSprite"].Bounds = { X = 164, Y = 903, Width = 547, Height = 536 };
root.Sprites["VoiceSettingsSprite"].Bounds = { X = 0, Y = 0, Width = 677, Height = 867 };
root.Sprites["MenuTitleTextConfig"].Bounds = { X = 720, Y = 903, Width = 893, Height = 181 };
root.Sprites["CircleConfig"].Bounds = { X = 0, Y = 1376, Width = 160, Height = 160 };

root.Sprites["SelectedLabelSprite"].Bounds = { X = 720, Y = 1086, Width = 947, Height = 61 };
root.Sprites["SelectedSprite"].Bounds = { X = 1079, Y = 1149, Width = 348, Height = 61 };
root.Sprites["SelectedDotSprite"].Bounds = { X = 64, Y = 903, Width = 27, Height = 27 };
root.Sprites["VoiceMutedSprite"].Bounds = { X = 0, Y = 902, Width = 61, Height = 60 };
root.Sprites["VoiceMutedSprite"].BaseScale = { X = 1, Y = 1 };
root.Sprites["SliderBarBaseSprite"].Bounds = { X = 721, Y = 1149, Width = 351, Height = 41 };
root.Sprites["SliderBarFillSprite"].Bounds = { X = 728, Y = 1198, Width = 339, Height = 29 };

local valueSprites = {
    "SettingInstantSprite", "SettingFastSprite", "SettingNormalSprite",
    "SettingSlowSprite", "SettingShortSprite", "SettingLongSprite",
    "SettingDoSprite", "SettingDontSprite", "SettingYesSprite",
    "SettingNoSprite", "SettingReadSprite", "SettingAllSprite",
    "SettingOnTriggerSprite", "SettingOnSceneSprite",
    "SettingOnTriggerAndSceneSprite", "SettingTypeASprite", "SettingTypeBSprite"
};
for i, name in ipairs(valueSprites) do
    root.Sprites[name].Bounds = { X = 1439, Y = 45 * (i - 1), Width = 327, Height = 45 };
end

root.Sprites["ButtonPromptConfig"] = {
    Sheet = "Guide",
    Bounds = { X = 0, Y = 97, Width = 1202, Height = 48 }
};
