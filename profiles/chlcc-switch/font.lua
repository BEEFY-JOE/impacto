-- program1 font1/font2 and binary widths are system IDs 6/7 and 8/9.
root.Fonts["Default"] = {
    Type = FontType.EdgeDetectedSingleVariableWidthSheet,
    Sheet = "Font",
    BinaryPath = { Mount = "system", Id = 7 },
    BitmapEmWidth = 53,
    BitmapEmHeight = 53,
    DifferenceFactor = 0.8,
    IntensityShift = 0.48,
    AlphaShift = 0.36
};
