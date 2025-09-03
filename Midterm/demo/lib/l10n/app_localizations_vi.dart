// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Multilingual Demo';

  @override
  String get welcome => 'Welcome to Flutter i18n Demo';

  @override
  String get description => 'This app demonstrates internationalization and localization features in Flutter.';

  @override
  String get dateTimeTitle => 'Date & Time Formatting';

  @override
  String get currentDate => 'Current Date';

  @override
  String get currentTime => 'Current Time';

  @override
  String get numbersTitle => 'Number & Currency Formatting';

  @override
  String get largeNumber => 'Large Number';

  @override
  String get currency => 'Currency';

  @override
  String get percentage => 'Percentage';

  @override
  String get pluralizationTitle => 'Pluralization Examples';

  @override
  String get layoutTitle => 'Layout Direction';

  @override
  String get layoutDescription => 'This text adapts to RTL languages like Arabic';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: '1 item',
      zero: 'No items',
    );
    return '$_temp0';
  }

  @override
  String userName(String name) {
    return 'Hello $name!';
  }

  @override
  String lastSeenMessage(String timeAgo) {
    return 'Last seen $timeAgo';
  }
}
