import 'package:flutter/material.dart';
import 'package:fadhakkir/l10n/app_localizations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: ListView(
        padding: const EdgeInsetsDirectional.all(AppSpacing.md),
        children: [
          Text(
            l10n.homeHeaderSubtitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            l10n.homeGreeting,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppSpacing.md),

          Card(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.heroTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    l10n.heroSubtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        spacing: AppSpacing.sm,
                        runSpacing: AppSpacing.xs,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.check_circle_outline),
                            label: Text(l10n.actionDone),
                          ),
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.bookmark_border),
                            label: Text(l10n.actionOtherGood),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.save_alt),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: AppSpacing.md),

          FeatureCard(
            title: l10n.featureDuaTitle,
            subtitle: l10n.featureDuaSubtitle,
            icon: Icons.volunteer_activism,
            onTap: () {},
          ),
          const SizedBox(height: AppSpacing.sm),
          FeatureCard(
            title: l10n.featureRememberTitle,
            subtitle: l10n.featureRememberSubtitle,
            icon: Icons.person_search,
            onTap: () {},
          ),
          const SizedBox(height: AppSpacing.sm),
          FeatureCard(
            title: l10n.featureIdeasTitle,
            subtitle: l10n.featureIdeasSubtitle,
            icon: Icons.lightbulb_outline,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
