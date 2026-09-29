#include "helpmenu.h"

#include "../../../game.h"
#include "../../../games/chlcc/helpmenu.h"
#include "../../../ui/ui.h"
#include "../../profile_internal.h"

namespace Impacto {
namespace Profile {
namespace CHLCC {
namespace HelpMenu {

void Configure() {
  FadeInDuration = EnsureGetMember<float>("FadeInDuration");
  FadeOutDuration = EnsureGetMember<float>("FadeOutDuration");
  PageSprite = EnsureGetMember<Sprite>("PageSprite");
  BackGuideSprite = EnsureGetMember<Sprite>("BackGuideSprite");
  BackGuidePosition = EnsureGetMember<glm::vec2>("BackGuidePosition");

  auto drawType = EnsureGetMember<Game::DrawComponentType>("DrawType");

  UI::HelpMenuPtr = new UI::CHLCC::HelpMenu();
  UI::Menus[drawType].push_back(UI::HelpMenuPtr);
}

}  // namespace HelpMenu
}  // namespace CHLCC
}  // namespace Profile
}  // namespace Impacto
