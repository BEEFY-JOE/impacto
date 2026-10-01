#pragma once

#include "../../animation.h"
#include "../../ui/menu.h"

namespace Impacto {
namespace UI {
namespace CHLCC {

class HelpMenu : public Menu {
 public:
  HelpMenu();

  void Show() override;
  void Hide() override;
  void Update(float dt) override;
  void UpdateInput(float dt) override;
  void Render() override;

 private:
  Animation FadeAnimation;
};

}  // namespace CHLCC
}  // namespace UI
}  // namespace Impacto
