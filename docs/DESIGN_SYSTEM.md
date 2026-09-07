Part of the Fadhakkir project source of truth.

This document captures the approved design system, tokens, and high-level guidance for UI and visual language.

---

# Identity
Modern Islamic Luxury Minimalism

Keywords
- Modern, Calm, Islamic, Warm, Premium, Simple, Rich but restrained

Locked brand palette (do not scatter hexes in widgets; use semantic tokens)
- Burgundy: #3E0C08 (primary identity; Today's Good Deed)
- Warm Beige: #CCAB8E (accent / warmth / highlights)
- Muted Dark Green: #2E3F37 (Dua for This Moment)
- Dark Teal: #042932 (Remember Someone; dark surfaces)
- Deep Navy: #05192F (Khayr Ideas; foundation)

Feature color identity
- Today's Good Deed -> Burgundy
- Dua -> Muted Dark Green
- Remember Someone -> Dark Teal
- Khayr Ideas -> Deep Navy

Design principles (must follow)
- Modern rather than heavy traditional motifs
- Inspiration from Islamic architecture, woven/rug motifs, arches and geometry
- Decoration opacity: typically 3–8% (never reduce text readability)
- No cartoon visuals, emoji-based UI, confetti, or gamification visuals
- Avoid loud gradients and excessive shadows
- Prefer elegant line icons and restrained cards
- Generous breathing room and strong typography hierarchy

Light theme
- Warm off-white / cream background
- Dark navy/teal text
- Subtle tinted surfaces

Dark theme
- Deep teal/navy background
- Warm beige highlights
- High-contrast readable text
- Avoid dark burgundy text on dark backgrounds

Typography (approximate scale)
- Display: 36–44
- Screen title: 28–32
- Card title: 20–24
- Body: 16–18
- Dua Arabic: 24–30
- Buttons: 16
- Caption: 13–14
- Use system fonts for now; future candidates: IBM Plex Sans Arabic, Noto Sans Arabic, Inter

Spacing scale
- 4, 8, 12, 16, 24, 32, 40, 48

Radius tokens
- small: 10
- button: 14
- input: 16
- card: 20–24
- hero: 28

Tokens and implementation guidance
- Use semantic color tokens defined under `lib/core/theme/`.
- Prefer `EdgeInsetsDirectional`, `AlignmentDirectional`, and `BorderRadiusDirectional` where applicable.
- Text alignment: `TextAlign.start`.
- Do not hardcode color hex values in widgets.

Accessibility
- Ensure controls have adequate contrast across light/dark.
- Touch targets must be at least 44x44 logical pixels when possible.
- Respect RTL layout and test Arabic flows.

Decoration rules
- Decorative motifs may be used sparingly; keep opacity low and avoid interfering with content.
- Use woven/arch composition for hero or header areas — not full-screen carpets.

Assets & Icons
- Prefer custom line icons or vetted iconography that matches the premium tone.
- Avoid emoji or playful imagery.

Change management
- Any change to palette, spacing, or tokens must be reflected in `lib/core/theme/` and documented here.

