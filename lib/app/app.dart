import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fadhakkir/l10n/app_localizations.dart';
import '../core/theme/app_theme.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/saved/presentation/saved_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import '../features/onboarding/presentation/welcome_screen.dart';
import '../features/onboarding/presentation/language_screen.dart';
import '../features/onboarding/presentation/address_style_screen.dart';
import '../features/onboarding/presentation/notifications_intro_screen.dart';

enum OnboardingStep { welcome, language, addressStyle, notifications, done }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  Locale? _overrideLocale;
  // onboarding progress state
  OnboardingStep _onboardingStep = OnboardingStep.welcome;
  AddressStyle? _addressStyle;
  Locale? _selectedLanguage;

  void _setLocale(Locale? locale) {
    setState(() {
      _overrideLocale = locale;
      _selectedLanguage = locale;
    });
  }

  void _advanceOnboarding() {
    setState(() {
      if (_onboardingStep == OnboardingStep.welcome) {
        _onboardingStep = OnboardingStep.language;
      } else if (_onboardingStep == OnboardingStep.language) {
        _onboardingStep = OnboardingStep.addressStyle;
      } else if (_onboardingStep == OnboardingStep.addressStyle) {
        _onboardingStep = OnboardingStep.notifications;
      } else if (_onboardingStep == OnboardingStep.notifications) {
        _onboardingStep = OnboardingStep.done;
      }
    });
  }

  void _goBackOnboarding() {
    setState(() {
      if (_onboardingStep == OnboardingStep.language) {
        _onboardingStep = OnboardingStep.welcome;
      } else if (_onboardingStep == OnboardingStep.addressStyle) {
        _onboardingStep = OnboardingStep.language;
      } else if (_onboardingStep == OnboardingStep.notifications) {
        _onboardingStep = OnboardingStep.addressStyle;
      }
    });
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

          // If onboarding not completed, show onboarding screens.
          if (_onboardingStep != OnboardingStep.done) {
            switch (_onboardingStep) {
              case OnboardingStep.welcome:
                return WelcomeScreen(onGetStarted: _advanceOnboarding);
              case OnboardingStep.language:
                return LanguageScreen(
                  groupValue: _selectedLanguage,
                  onChanged: (v) => _setLocale(v),
                  onNext: _advanceOnboarding,
                  onBack: _goBackOnboarding,
                );
              case OnboardingStep.addressStyle:
                return AddressStyleScreen(
                  groupValue: _addressStyle,
                  onChanged: (v) => setState(() => _addressStyle = v),
                  onNext: _advanceOnboarding,
                  onBack: _goBackOnboarding,
                );
              case OnboardingStep.notifications:
                return NotificationsIntroScreen(
                  onEnable: () =>
                      setState(() => _onboardingStep = OnboardingStep.done),
                  onSkip: () =>
                      setState(() => _onboardingStep = OnboardingStep.done),
                  onBack: _goBackOnboarding,
                );
              default:
                return const SizedBox.shrink();
            }
          }

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
