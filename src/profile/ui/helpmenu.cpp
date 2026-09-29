#include "helpmenu.h"
#include "../profile_internal.h"
#include "../games/cclcc/helpmenu.h"
#include "../games/chlcc/helpmenu.h"
#include "../../ui/ui.h"
#include "../../log.h"

namespace Impacto {
namespace Profile {
namespace HelpMenu {

using namespace Impacto::UI;

void Configure() {
  if (TryPushMember("HelpMenu")) {
    AssertIs(LUA_TTABLE);

    Type = EnsureGetMember<HelpMenuType>("Type");

    if (Type == HelpMenuType::CCLCC) {
      CCLCC::HelpMenu::Configure();
    } else if (Type == HelpMenuType::CHLCC) {
      CHLCC::HelpMenu::Configure();
    }

    Pop();
  }
}

}  // namespace HelpMenu
}  // namespace Profile
}  // namespace Impacto
