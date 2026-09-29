#include "helpmenu.h"

#include "../../inputsystem.h"
#include "../../audio/audiosystem.h"
#include "../../mem.h"
#include "../../profile/games/chlcc/helpmenu.h"
#include "../../profile/game.h"
#include "../../profile/scriptvars.h"
#include "../../renderer/renderer.h"
#include "../../ui/ui.h"
#include "../../vm/interface/input.h"

namespace Impacto {
namespace UI {
namespace CHLCC {

using namespace Impacto::Profile::CHLCC::HelpMenu;
using namespace Impacto::Profile::ScriptVars;
using namespace Impacto::Vm::Interface;

HelpMenu::HelpMenu() {
  FadeAnimation.DurationIn = FadeInDuration;
  FadeAnimation.DurationOut = FadeOutDuration;
}

void HelpMenu::Show() {
  State = Showing;
  LastFocusedMenu = UI::FocusedMenu;
  if (LastFocusedMenu) LastFocusedMenu->IsFocused = false;
  UI::FocusedMenu = this;
  FadeAnimation.StartIn();
}

void HelpMenu::Hide() {
  State = Hiding;
  IsFocused = false;
  FadeAnimation.StartOut();
  Audio::PlayInGroup(Audio::ACG_SE, "sysse", 3, false, 0);
}

void HelpMenu::Update(float dt) {
  const int submenuCounter = ScrWork[SW_SYSSUBMENUCT];
  const int submenuCounterMax = ScrWork[SW_SYSSUBMENUCTMAX];
  const bool isHelpSubmenu = ScrWork[SW_SYSSUBMENUNO] == 11;

  if ((State == Shown &&
       (!isHelpSubmenu || submenuCounter < submenuCounterMax)) ||
      (State == Showing && (!isHelpSubmenu || submenuCounter == 0))) {
    Hide();
  } else if (State == Hidden && isHelpSubmenu && submenuCounter > 0) {
    Show();
  }

  if (State != Hidden) FadeAnimation.Update(dt);

  if (State == Showing && isHelpSubmenu &&
      submenuCounter == submenuCounterMax && FadeAnimation.IsIn()) {
    State = Shown;
    IsFocused = true;
  } else if (State == Hiding && submenuCounter == 0 && FadeAnimation.IsOut()) {
    State = Hidden;
    UI::FocusedMenu = LastFocusedMenu;
    if (LastFocusedMenu) LastFocusedMenu->IsFocused = true;
    LastFocusedMenu = nullptr;
  }

  if (State == Shown && isHelpSubmenu) UpdateInput(dt);
}

void HelpMenu::UpdateInput(float dt) {
  if (State == Shown &&
      ((PADinputButtonWentDown | PADinputMouseWentDown) & PAD1B)) {
    SetFlag(SF_SUBMENUEXIT, true);
    PADinputButtonWentDown &= ~PAD1B;
    PADinputMouseWentDown &= ~PAD1B;
  }
}

void HelpMenu::Render() {
  if (State == Hidden) return;

  const float transition = FadeAnimation.Progress;
  const glm::vec2 offset{0.0f, (1.0f - transition) * PageStartYOffset};
  const glm::vec4 tint{glm::vec3{1.0f}, transition};
  Renderer->DrawSprite(PageSprite, offset, tint);

  const float guideStartProgress =
      1.0f - BackGuideSlideDuration /
                 FadeAnimation.GetDuration(FadeAnimation.Direction);
  if (transition >= guideStartProgress) {
    const float guideProgress =
        (transition - guideStartProgress) / (1.0f - guideStartProgress);
    const float guideX = glm::mix(Profile::Game::DesignWidth,
                                  BackGuidePosition.x, guideProgress);
    Renderer->DrawSprite(BackGuideSprite,
                         glm::vec2{guideX, BackGuidePosition.y});
  }
}

}  // namespace CHLCC
}  // namespace UI
}  // namespace Impacto
