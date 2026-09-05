import 'package:flutter/material.dart';
import 'package:fadhakkir/l10n/app_localizations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_radius.dart';

class SettingsScreen extends StatelessWidget {
  final Locale? currentLocale;
  final ValueChanged<Locale?> onLocaleChanged;

  const SettingsScreen({
    super.key,
    this.currentLocale,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).colorScheme;
    final langCode = Localizations.localeOf(context).languageCode;

    String t(String en, String ar) => langCode == 'ar' ? ar : en;

    return Padding(
      padding: const EdgeInsetsDirectional.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.bottomSettings,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(color: colorScheme.onSurface),
          ),
          const SizedBox(height: AppSpacing.lg),

          Text(
            t('Language', 'اللغة'),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.sm),

          Card(
            shape: RoundedRectangleBorder(borderRadius: AppRadius.medium),
            color: colorScheme.surface,
            child: RadioGroup<Locale?>(
              groupValue: currentLocale,
              onChanged: (value) => onLocaleChanged(value),
              child: Column(
                children: [
                  RadioListTile<Locale?>(
                    title: Text(t('System', 'النظام')),
                    value: null,
                    activeColor: colorScheme.primary,
                  ),
                  const Divider(height: 1),
                  RadioListTile<Locale?>(
                    title: Text(t('English', 'English')),
                    value: const Locale('en'),
                    activeColor: colorScheme.primary,
                  ),
                  const Divider(height: 1),
                  RadioListTile<Locale?>(
                    title: Text(t('Arabic', 'العربية')),
                    value: const Locale('ar'),
                    activeColor: colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
