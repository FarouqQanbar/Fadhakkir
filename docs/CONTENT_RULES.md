Part of the Fadhakkir project source of truth.

This document describes rules for religious and UI content, review workflow, and do/don'ts for content included in the app.

---

Critical content rules (must be enforced)
- AI-generated text must never be treated as authoritative Islamic content.
- Do NOT invent Quran verses, Hadith, duas presented as Prophetic, authenticity grades, reward claims, rulings, or fatwas.
- Religious content must be human-reviewed and source-verified before shipping.

Religious content workflow (required)
1. draft
2. source_verified (attach sources/references)
3. scholar_reviewed (document reviewer)
4. approved (ready for publishing)

Display rules for Arabic religious text
- Preserve verified wording and original formatting.
- Do not modify tashkeel or diacritics in displayed authoritative text.
- Search/index normalization may remove tashkeel/tatweel for matching only; do not display normalized text.

Privacy and personal data
- Personal names used for "Remember Someone" remain on device only.
- Do not send personal names or notes to any cloud service in V1.

Microcopy guidance
- Tone: Calm, respectful, simple.
- Avoid guilt, pressure, or manipulative framing.
- Avoid gamification language (streaks, points, levels).

Content localization
- Provide Arabic and English UI/content.
- All visible strings must be in `lib/l10n/` ARB files and routed through gen-l10n.

Verification and QA
- Track content state (draft, source_verified, scholar_reviewed, approved) in editorial tooling or a local metadata file where applicable.
- Maintain a changelog for any religious content updates and record reviewer names and dates.

Exceptions
- Small explanatory helper text (UI affordances) can be edited by product/ux writers without scholar review, but not religious text.

