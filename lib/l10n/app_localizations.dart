import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Fadhakkir'**
  String get appTitle;

  /// No description provided for @homeHeader.
  ///
  /// In en, this message translates to:
  /// **'Fadhakkir'**
  String get homeHeader;

  /// No description provided for @homeHeaderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Khayr & Dua Companion'**
  String get homeHeaderSubtitle;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Peace be upon you — may today\'s reminder bring goodness.'**
  String get homeGreeting;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Good Deed'**
  String get heroTitle;

  /// No description provided for @heroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Reach out today to someone you haven\'t spoken to in a while'**
  String get heroSubtitle;

  /// No description provided for @actionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// No description provided for @actionOtherGood.
  ///
  /// In en, this message translates to:
  /// **'Another Good Deed'**
  String get actionOtherGood;

  /// No description provided for @featureDuaTitle.
  ///
  /// In en, this message translates to:
  /// **'Dua for This Moment'**
  String get featureDuaTitle;

  /// No description provided for @featureDuaSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Find a dua suited to how you feel right now'**
  String get featureDuaSubtitle;

  /// No description provided for @featureRememberTitle.
  ///
  /// In en, this message translates to:
  /// **'Remember Someone'**
  String get featureRememberTitle;

  /// No description provided for @featureRememberSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Include someone you love in your prayers'**
  String get featureRememberSubtitle;

  /// No description provided for @featureIdeasTitle.
  ///
  /// In en, this message translates to:
  /// **'Khayr Ideas'**
  String get featureIdeasTitle;

  /// No description provided for @featureIdeasSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Simple suggestions for acts of kindness'**
  String get featureIdeasSubtitle;

  /// No description provided for @bottomHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get bottomHome;

  /// No description provided for @bottomSaved.
  ///
  /// In en, this message translates to:
  /// **'Saved'**
  String get bottomSaved;

  /// No description provided for @bottomSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get bottomSettings;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @langSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get langSystem;

  /// No description provided for @langEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langEnglish;

  /// No description provided for @langArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get langArabic;

  /// No description provided for @savedEmpty.
  ///
  /// In en, this message translates to:
  /// **'No saved items yet.'**
  String get savedEmpty;

  /// No description provided for @welcomeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Khayr & Dua Companion'**
  String get welcomeSubtitle;

  /// No description provided for @welcomeSupport.
  ///
  /// In en, this message translates to:
  /// **'Simple reminders to help you make dua and do good throughout your day.'**
  String get welcomeSupport;

  /// No description provided for @welcomeCTA.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get welcomeCTA;

  /// No description provided for @chooseLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get chooseLanguageTitle;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @addressStyleTitle.
  ///
  /// In en, this message translates to:
  /// **'How would you like us to address you?'**
  String get addressStyleTitle;

  /// No description provided for @addressStyleExplanation.
  ///
  /// In en, this message translates to:
  /// **'This only affects Arabic wording. Your choice stays on your device.'**
  String get addressStyleExplanation;

  /// No description provided for @addressMasculine.
  ///
  /// In en, this message translates to:
  /// **'تذكّر'**
  String get addressMasculine;

  /// No description provided for @addressFeminine.
  ///
  /// In en, this message translates to:
  /// **'تذكّري'**
  String get addressFeminine;

  /// No description provided for @notificationsTitle.
  ///
  /// In en, this message translates to:
  /// **'Gentle reminders, when you need them'**
  String get notificationsTitle;

  /// No description provided for @notificationsIntro.
  ///
  /// In en, this message translates to:
  /// **'Enable the reminders you\'d like to receive. You can change these later.'**
  String get notificationsIntro;

  /// No description provided for @featureTodayGood.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Good Deed'**
  String get featureTodayGood;

  /// No description provided for @enableReminders.
  ///
  /// In en, this message translates to:
  /// **'Enable Reminders'**
  String get enableReminders;

  /// No description provided for @notNow.
  ///
  /// In en, this message translates to:
  /// **'Not Now'**
  String get notNow;

  /// No description provided for @notificationsPrivacyNote.
  ///
  /// In en, this message translates to:
  /// **'We will only use reminders locally on your device.'**
  String get notificationsPrivacyNote;

  /// No description provided for @languageArabicLabel.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get languageArabicLabel;

  /// No description provided for @languageEnglishLabel.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglishLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
