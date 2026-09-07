Part of the Fadhakkir project source of truth.

This document records the approved product decisions for Fadhakkir V1. It distinguishes approved decisions, current implementation notes (high level), and future/planned work. Use this file as the canonical product reference.

---

# Approved Product Decisions (V1)

Brand
- Arabic: فَذَكِّر
- English: Fadhakkir
- Expanded branding (short): فَذَكِّر — رفيق الخير والدعاء / Fadhakkir — Khayr & Dua Companion

Mission
- A simple, private companion that gently reminds Muslims of dua and opportunities for good.

Product philosophy
- Calm, Respectful, Simple
- Privacy-first, Local-first
- Free, No manipulative engagement
- Open -> understand -> benefit -> leave

V1 core features (approved)
1. Today's Good Deed / خير اليوم
  - One simple daily good deed, mark Done, ask for Another, Save.
  - No points, streaks, or guilt language.

2. Dua for This Moment / دعاء اللحظة
  - Browse/search verified duas by feeling or situation.
  - Show Arabic original and English meaning. Optional transliteration later.
  - Show source/reference/authenticity where applicable. Save/copy/share.
  - Religious content must be human-reviewed and verified.

3. Remember Someone in Dua / ادعُ لهم
  - General prompts and optional personal names/nicknames.
  - Personal names remain on device; no cloud storage required.

4. Khayr Ideas / أفكار خير
  - Simple good-deed suggestions with Save/Another.
  - No gamification.

Main navigation
- Home, Saved, Settings

Excluded from V1 (explicitly disallowed)
- Prayer times, Adhan, Qibla, Quran reader, Tasbeeh counter, Zakat calculator, Hijri calendar
- Mosque/halal finder, Social/chat, AI religious assistant
- Account/login, Cloud sync, Payments, Ads, Public profiles
- Location, Contacts, Streaks, Leaderboards

Privacy commitments
- No account, No ads, No tracking
- Personal reminder data stays on device
- No email/phone required

---

# Onboarding (approved flow)

Flow (order): Welcome -> Language -> Address Style -> Notifications -> Home

Welcome copy (Arabic / English) is approved (see localisation files). Language and Address Style selections must apply immediately (RTL for Arabic). Address Style is an app preference (not called "gender"). Notifications are an in-app selection; real OS permission integration happens later.

Address Style options
- تذكّر (AddressStyle.masculine)
- تذكّري (AddressStyle.feminine)

Notifications categories
- Today's Good Deed
- Dua for This Moment
- Remember Someone

---

# Current implementation (summary)

- Flutter app with Material 3 theming.
- Onboarding implemented: Welcome -> Language -> Address Style -> Notifications -> Home (ephemeral state, no persistence).
- Theming tokens exist under `lib/core/theme/` (colors, spacing, radii).
- Localization uses Flutter gen-l10n with `lib/l10n/` ARB files for `en` and `ar`.
- Home, Saved, Settings, and onboarding screens are present and wired.

Note: This section only describes the current high-level implementation state as observed in the repo; it is not a guarantee of production readiness.

---

# Future / Planned

- Persist onboarding completion and address style preference locally (no cloud) when product requirements demand remembering choices.
- Add verified dua content workflow (draft -> source_verified -> scholar_reviewed -> approved).
- Implement optional transliteration and improved dua display.
- Consider light-weight remote repo patterns only when concrete need arises (do not introduce cloud early).

---

# How to use this document

- Treat this file as the authoritative product decisions for V1 features and exclusions.
- When proposing UI or data changes, reference this file to confirm alignment with product philosophy and allowed scope.
- Do not add features listed under "Excluded from V1" without product approval.

