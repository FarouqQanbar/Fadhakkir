import 'package:flutter/material.dart';
import 'package:fadhakkir/l10n/app_localizations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_radius.dart';

class NotificationsIntroScreen extends StatefulWidget {
  final VoidCallback onEnable;
  final VoidCallback onSkip;
  final VoidCallback onBack;

  const NotificationsIntroScreen({
    super.key,
    required this.onEnable,
    required this.onSkip,
    required this.onBack,
  });

  @override
  State<NotificationsIntroScreen> createState() =>
      _NotificationsIntroScreenState();
}

class _NotificationsIntroScreenState extends State<NotificationsIntroScreen> {
  bool todayGood = true;
  bool duaMoment = true;
  bool rememberSomeone = true;

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
                BackButton(onPressed: widget.onBack),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Text(
                    l10n.notificationsTitle,
                    style: Theme.of(context).textTheme.titleLarge,
                    softWrap: true,
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
            Text(
              l10n.notificationsIntro,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.md),
            _NotificationTile(
              title: l10n.featureTodayGood,
              subtitle: '',
              icon: Icons.star_border,
              value: todayGood,
              onChanged: (v) => setState(() => todayGood = v),
            ),
            const SizedBox(height: AppSpacing.sm),
            _NotificationTile(
              title: l10n.featureDuaTitle,
              subtitle: '',
              icon: Icons.auto_awesome,
              value: duaMoment,
              onChanged: (v) => setState(() => duaMoment = v),
            ),
            const SizedBox(height: AppSpacing.sm),
            _NotificationTile(
              title: l10n.featureRememberTitle,
              subtitle: '',
              icon: Icons.favorite_border,
              value: rememberSomeone,
              onChanged: (v) => setState(() => rememberSomeone = v),
            ),
            const Spacer(),
            Text(
              l10n.notificationsPrivacyNote,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: widget.onSkip,
                    child: Text(l10n.notNow),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: ElevatedButton(
                    onPressed: widget.onEnable,
                    child: Text(l10n.enableReminders),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _NotificationTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Material(
      color: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.medium),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: colorScheme.primary.withAlpha(
                (0.12 * 255).round(),
              ),
              child: Icon(icon, color: colorScheme.primary, size: 20),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ],
              ),
            ),
            Switch.adaptive(value: value, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}
