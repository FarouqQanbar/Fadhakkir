Part of the Fadhakkir project source of truth.

This document records the approved architecture, folder structure, and implementation guidance for V1.

---

Platform and language
- Flutter + Dart
- One codebase for Android and iOS

High-level structure (approved)
lib/
  app/             # App entry and shell
  core/
    theme/         # Design tokens (colors, spacing, radii)
    localization/  # gen-l10n outputs and resources
    storage/       # local persistence adapters (shared preferences / local JSON)
    notifications/ # local notifications adapters (planned)
    search/        # search utilities and normalization
    utils/         # small helpers
  features/
    onboarding/
    home/
    todays_khayr/
    dua_moment/
    remember_someone/
    khayr_ideas/
    saved/
    settings/
  shared/
    widgets/
    models/

Implementation principles
- Feature-first modular code organization.
- Presentation -> repository interface -> local repository (implementation).
- V1 is local-first; avoid introducing remote repositories or cloud sync unless a concrete requirement appears.
- Keep UI code independent from storage implementation by depending on repository interfaces.

State & navigation
- Keep simple in-memory state for V1 onboarding; routing uses simple state machine in the `App` shell.
- Do not introduce global state libraries (Riverpod) or complex routers (go_router) until justified by complexity.

Persistence & data
- Use local persistence for small user preferences (address style, locale, onboarding completion) when required.
- Store personal names and saved content locally, encrypted if necessary.

Notifications
- Local notifications are planned; do not implement OS permissions or notification server integration in V1.

Testing & CI
- Maintain `flutter analyze` and `flutter test` as baseline checks.
- Keep unit and widget tests focused on UI behavior and local repository logic.

Future extensibility
- Define repository interfaces so remote implementations can be added later without rewriting UI.
- Consider adding Riverpod / go_router when app complexity grows and a clear migration path exists.

Security & privacy
- No analytics / no tracking by default in V1.
- Any future backend must be reviewed for minimal data collection and privacy impact.

