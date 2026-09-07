import 'package:flutter/material.dart';
import 'package:fadhakkir/l10n/app_localizations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_radius.dart';

class LanguageScreen extends StatelessWidget {
  final Locale? groupValue;
  final ValueChanged<Locale?> onChanged;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const LanguageScreen({
    super.key,
    required this.groupValue,
    required this.onChanged,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(88),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppSpacing.md,
            ),
            child: Row(
              children: [
                BackButton(onPressed: onBack),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        l10n.chooseLanguageTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                        softWrap: true,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text('', style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            const SizedBox(height: AppSpacing.sm),
            // Language tiles
            _LanguageTile(
              label: l10n.languageArabicLabel,
              sublabel: l10n.langArabic,
              selected: groupValue?.languageCode == 'ar',
              onTap: () => onChanged(const Locale('ar')),
            ),
            const SizedBox(height: AppSpacing.md),
            _LanguageTile(
              label: l10n.languageEnglishLabel,
              sublabel: l10n.langEnglish,
              selected: groupValue?.languageCode == 'en',
              onTap: () => onChanged(const Locale('en')),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onNext,
                child: Text(l10n.continueButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String label;
  final String sublabel;
  final bool selected;
  final VoidCallback onTap;

  const _LanguageTile({
    required this.label,
    required this.sublabel,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bg = selected
        ? colorScheme.primary.withAlpha((0.12 * 255).round())
        : colorScheme.surface;
    final border = selected
        ? Border.all(color: colorScheme.primary, width: 1.5)
        : Border.all(color: colorScheme.surfaceContainerHighest);

    return Material(
      color: bg,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.medium),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            borderRadius: AppRadius.medium,
            border: border,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      sublabel,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              // selection indicator
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? colorScheme.primary
                      : colorScheme.surfaceContainerHighest,
                  border: Border.all(
                    color: selected ? colorScheme.primary : Colors.transparent,
                  ),
                ),
                child: selected
                    ? Icon(Icons.check, size: 18, color: colorScheme.onPrimary)
                    : Icon(
                        Icons.language,
                        size: 16,
                        color: colorScheme.onSurface.withAlpha(
                          (0.6 * 255).round(),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
