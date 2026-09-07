import 'package:flutter/material.dart';
import 'package:fadhakkir/l10n/app_localizations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onGetStarted;

  const WelcomeScreen({super.key, required this.onGetStarted});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppSpacing.md,
          ),
          child: Column(
            children: [
              const SizedBox(height: AppSpacing.lg),
              // Header motif composed of overlapping low-opacity shapes
              SizedBox(
                height: 140,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    // Subtle arch base
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        width: double.infinity,
                        height: 120,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.light
                              ? AppColors.burgundy.withAlpha(
                                  (0.06 * 255).round(),
                                )
                              : AppColors.beige.withAlpha((0.08 * 255).round()),
                          borderRadius: const BorderRadiusDirectional.only(
                            bottomStart: Radius.circular(48),
                            bottomEnd: Radius.circular(48),
                          ),
                        ),
                      ),
                    ),
                    // Woven motif (rotated thin rectangle) for subtle texture
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Transform.rotate(
                        angle: -0.12,
                        child: Container(
                          width: 220,
                          height: 22,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).brightness == Brightness.light
                                ? AppColors.beige.withAlpha(
                                    (0.06 * 255).round(),
                                  )
                                : AppColors.darkTeal.withAlpha(
                                    (0.06 * 255).round(),
                                  ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: AppSpacing.lg),

              // Brand area
              Text(
                l10n.appTitle,
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                l10n.welcomeSubtitle,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                l10n.welcomeSupport,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.xl),

              // CTA
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onGetStarted,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: AppRadius.large,
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    l10n.welcomeCTA,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}
