#pragma once

#include "../../../spritesheet.h"

namespace Impacto {
namespace Profile {
namespace CHLCC {
namespace HelpMenu {

inline float FadeInDuration;
inline float FadeOutDuration;
inline float PageStartYOffset;
inline float BackGuideSlideDuration;
inline Sprite PageSprite;
inline Sprite BackGuideSprite;
inline glm::vec2 BackGuidePosition;

void Configure();

}  // namespace HelpMenu
}  // namespace CHLCC
}  // namespace Profile
}  // namespace Impacto
