import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_vi.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('ja'),
    Locale('vi')
  ];

  /// Title of the application
  ///
  /// In en, this message translates to:
  /// **'Multilingual Demo'**
  String get appTitle;

  /// Welcome message displayed on the home screen
  ///
  /// In en, this message translates to:
  /// **'Welcome to Flutter i18n Demo'**
  String get welcome;

  /// App description text
  ///
  /// In en, this message translates to:
  /// **'This app demonstrates internationalization and localization features in Flutter.'**
  String get description;

  /// Title for date and time section
  ///
  /// In en, this message translates to:
  /// **'Date & Time Formatting'**
  String get dateTimeTitle;

  /// Label for current date display
  ///
  /// In en, this message translates to:
  /// **'Current Date'**
  String get currentDate;

  /// Label for current time display
  ///
  /// In en, this message translates to:
  /// **'Current Time'**
  String get currentTime;

  /// Title for numbers and currency section
  ///
  /// In en, this message translates to:
  /// **'Number & Currency Formatting'**
  String get numbersTitle;

  /// Label for large number display
  ///
  /// In en, this message translates to:
  /// **'Large Number'**
  String get largeNumber;

  /// Label for currency display
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// Label for percentage display
  ///
  /// In en, this message translates to:
  /// **'Percentage'**
  String get percentage;

  /// Title for pluralization section
  ///
  /// In en, this message translates to:
  /// **'Pluralization Examples'**
  String get pluralizationTitle;

  /// Title for layout direction section
  ///
  /// In en, this message translates to:
  /// **'Layout Direction'**
  String get layoutTitle;

  /// Description text for RTL layout demonstration
  ///
  /// In en, this message translates to:
  /// **'This text adapts to RTL languages like Arabic'**
  String get layoutDescription;

  /// Display item count with proper pluralization
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No items} =1{1 item} other{{count} items}}'**
  String itemCount(int count);

  /// Greeting message with user name
  ///
  /// In en, this message translates to:
  /// **'Hello {name}!'**
  String userName(String name);

  /// Message showing when user was last seen
  ///
  /// In en, this message translates to:
  /// **'Last seen {timeAgo}'**
  String lastSeenMessage(String timeAgo);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'ja', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'ja': return AppLocalizationsJa();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
