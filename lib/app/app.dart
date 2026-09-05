import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fadhakkir/l10n/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/saved/presentation/saved_screen.dart';
import '../features/settings/presentation/settings_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  Locale? _overrideLocale;

  void _setLocale(Locale? locale) {
    setState(() => _overrideLocale = locale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      locale: _overrideLocale,
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) return const Locale('en');
        for (final supported in supportedLocales) {
          if (supported.languageCode == locale.languageCode) return supported;
        }
        return const Locale('en');
      },
      title: 'Fadhakkir',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      home: Builder(
        builder: (context) {
          final l10n = AppLocalizations.of(context)!;
          final pages = <Widget>[
            const Scaffold(body: HomeScreen()),
            const Scaffold(body: SavedScreen()),
            Scaffold(
              body: SettingsScreen(
                currentLocale: _overrideLocale,
                onLocaleChanged: _setLocale,
              ),
            ),
          ];
          final titles = [l10n.appTitle, l10n.bottomSaved, l10n.bottomSettings];

          return Scaffold(
            appBar: AppBar(title: Text(titles[_selectedIndex])),
            body: pages[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: l10n.bottomHome,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.bookmark),
                  label: l10n.bottomSaved,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: l10n.bottomSettings,
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: (i) => setState(() => _selectedIndex = i),
            ),
          );
        },
      ),
    );
  }
}
