import 'package:flutter/material.dart';
import 'package:fadhakkir/l10n/app_localizations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_radius.dart';

enum AddressStyle { masculine, feminine }

class AddressStyleScreen extends StatelessWidget {
  final AddressStyle? groupValue;
  final ValueChanged<AddressStyle?> onChanged;
  final VoidCallback onNext;
  final VoidCallback onBack;

  const AddressStyleScreen({
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
                        l10n.addressStyleTitle,
                        style: Theme.of(context).textTheme.titleLarge,
                        softWrap: true,
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        l10n.addressStyleExplanation,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
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
            _AddressTile(
              label: l10n.addressMasculine,
              selected: groupValue == AddressStyle.masculine,
              onTap: () => onChanged(AddressStyle.masculine),
            ),
            const SizedBox(height: AppSpacing.md),
            _AddressTile(
              label: l10n.addressFeminine,
              selected: groupValue == AddressStyle.feminine,
              onTap: () => onChanged(AddressStyle.feminine),
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

class _AddressTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _AddressTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: selected
          ? colorScheme.primary.withAlpha((0.1 * 255).round())
          : colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.medium),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? colorScheme.primary
                      : colorScheme.surfaceContainerHighest,
                ),
                child: selected
                    ? Icon(Icons.check, size: 18, color: colorScheme.onPrimary)
                    : Icon(
                        Icons.person,
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
