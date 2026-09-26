-- Experimental profile for LCC Double Pack program1 assets.
include(root.BasePaths.RootProfilesDir .. '/chlcc/game.lua');
include(root.BasePaths.RootProfilesDir .. '/chlcc-switch/scriptvars.lua');

root.WindowName = "CHAOS;HEAD Love Chu☆Chu! (Switch, experimental)";
root.DesignWidth = 1920;
root.DesignHeight = 1080;
root.CharaIsMvl = true;
root.LayFileBigEndian = false;
root.LayFileTexXMultiplier = 1;
root.LayFileTexYMultiplier = 1;
root.PlatformId = 0x100000;

-- These VM settings are shared by the Double Pack's Switch SC3 format.
-- The LCCSwitch opcode table still has CCLCC-specific user opcodes; startup
-- testing must determine where a CHLCC-specific Switch table is needed.
root.Vm.StartScript = 1; -- script.cls: _startup
root.Vm.GameInstructionSet = InstructionSet.LCCSwitch;
root.Vm.UseMsbStrings = true;
root.Vm.UseSeparateMsbArchive = true;
root.Vm.UseReturnIds = true;
root.Vm.StringEncodingType = StringUnitEncoding.Uint32;
root.Vm.StringIdSize = 4;
root.Vm.ScrWorkChaStructSize = 24;
root.Vm.ScrWorkChaOffsetStructSize = 10;
root.Vm.ScrWorkBgStructSize = 24;
root.Vm.ScrWorkBgOffsetStructSize = 10;
root.Vm.ScrWorkCaptureStructSize = 20;
root.Vm.ScrWorkCaptureOffsetStructSize = 10;
root.Vm.ScrWorkCaptureEffectInfoStructSize = 3;
root.Vm.ScrWorkBgEffStructSize = 30;
root.Vm.ScrWorkBgEffOffsetStructSize = 18;
root.Vm.ScrWorkMesStructSize = 7;
root.Vm.MaxLinkedBgBuffers = 2;

include(root.BasePaths.RootProfilesDir .. '/chlcc-switch/vfs.lua');
include(root.BasePaths.RootProfilesDir .. '/chlcc-switch/sprites.lua');
include(root.BasePaths.RootProfilesDir .. '/chlcc-switch/font.lua');
include(root.BasePaths.RootProfilesDir .. '/chlcc-switch/hud/sysmesboxdisplay.lua');
