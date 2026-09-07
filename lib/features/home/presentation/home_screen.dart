import 'package:flutter/material.dart';
import 'package:fadhakkir/l10n/app_localizations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsetsDirectional.only(
          start: AppSpacing.md,
          end: AppSpacing.md,
          top: AppSpacing.md,
          // add extra bottom padding so final card sits above bottom nav
          bottom: AppSpacing.xl + 56,
        ),
        children: [
          Text(
            l10n.homeHeaderSubtitle,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(letterSpacing: 0.2),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            l10n.homeGreeting,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: AppSpacing.md),

          // Hero card with subtle decorative motif
          Card(
            shape: RoundedRectangleBorder(borderRadius: AppRadius.large),
            child: Stack(
              children: [
                // Decorative motif (directional)
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(top: 8, end: 8),
                    child: Transform.rotate(
                      angle: 0.7,
                      child: Icon(
                        Icons.grid_on,
                        size: 64,
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withAlpha(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              l10n.heroTitle,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.save_alt),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text(
                        l10n.heroSubtitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.xs,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.check_circle_outline),
                            label: Text(l10n.actionDone),
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 18,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: AppRadius.small,
                              ),
                            ),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_border),
                            label: Text(l10n.actionOtherGood),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 18,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: AppRadius.small,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          FeatureCard(
            title: l10n.featureDuaTitle,
            subtitle: l10n.featureDuaSubtitle,
            icon: Icons.volunteer_activism,
            accentColor: AppColors.mutedGreen,
            onTap: () {},
          ),
          const SizedBox(height: AppSpacing.sm),
          FeatureCard(
            title: l10n.featureRememberTitle,
            subtitle: l10n.featureRememberSubtitle,
            icon: Icons.person_search,
            accentColor: AppColors.darkTeal,
            onTap: () {},
          ),
          const SizedBox(height: AppSpacing.sm),
          FeatureCard(
            title: l10n.featureIdeasTitle,
            subtitle: l10n.featureIdeasSubtitle,
            icon: Icons.lightbulb_outline,
            accentColor: AppColors.deepNavy,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
