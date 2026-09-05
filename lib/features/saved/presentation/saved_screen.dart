import 'package:flutter/material.dart';
import 'package:fadhakkir/l10n/app_localizations.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  Locale? _observedLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context);
    if (_observedLocale != locale) {
      _observedLocale = locale;
      // Trigger rebuild to pick up Directionality and locale-driven layout
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsetsDirectional.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          Text(
            l10n.savedEmpty,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
