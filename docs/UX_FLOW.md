Part of the Fadhakkir project source of truth.

This document records the approved UX flow for V1 and notes about current implementation and future adjustments.

---

# Top-level flow

Main navigation: Home, Saved, Settings

Home flow (typical session)
- Launch -> If onboarding incomplete -> Welcome -> Language -> Address Style -> Notifications -> Home
- Home shows: Brand + greeting, Today's Good Deed hero, Dua for This Moment section, Remember Someone, Khayr Ideas, bottom nav

Onboarding (detailed)
1. Welcome
  - Purpose: introduce mission in calm tone; CTA "Get Started".
  - Copy (EN/AR) is defined in localization files.
2. Language
  - Options: Arabic / English
  - Device language preselected; selecting immediately switches locale/UI direction.
3. Address Style
  - Title (AR): كيف تفضّل أن نخاطبك؟
  - Options: تذكّر / تذكّري (mapped to AddressStyle enum)
  - This affects Arabic wording only; not a gender label.
4. Notifications
  - Title (EN/AR): gentle reminders headline
  - Categories toggles: Today's Good Deed, Dua for This Moment, Remember Someone
  - Real OS permissions to be implemented later; in-app toggles are local preferences for V1
5. Home
  - Onboarding completes and user lands on Home; onboarding state is ephemeral in V1 (future persistence planned)

Navigation rules
- Back action returns to previous onboarding step; app should preserve in-memory selections.
- CTA flows: each screen's primary CTA advances; secondary "Not Now" on Notifications skips and goes to Home.

Responsive and accessibility notes
- Titles in onboarding must support multi-line to avoid truncation on small widths.
- Use Directional padding and alignment, test Arabic RTL layout.
- Ensure bottom CTA is reachable above safe area and on screens like iPhone 17.

Microcopy guidance
- Use calm, respectful voice; avoid guilt or reward-laden language.
- Keep CTAs simple and action-oriented (Get Started, Continue, Enable Reminders, Not Now).

