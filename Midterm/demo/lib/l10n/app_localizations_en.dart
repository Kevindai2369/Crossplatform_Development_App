// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override

  String get appTitle => 'i18n Demo App';

  @override
  String get welcomeMessage => 'Welcome to our multilingual app!';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String currentLanguage(String language) {
    return 'Current Language: $language';
  }

  @override
  String greeting(String name) {
    return 'Hello, $name!';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count items',
      one: 'One item',
      zero: 'No items',
  String get helloWorld => 'Hello World!';

  @override
  String get greeting => 'Good morning!';

  @override
  String get welcomeMessage => 'Welcome to our app.';

  @override
  String itemsInCart(int itemCount) {
    String _temp0 = intl.Intl.pluralLogic(
      itemCount,
      locale: localeName,
      other: '$itemCount items in cart.',
      one: 'One item in cart.',
      zero: 'No items in cart.',
    );
    return '$_temp0';
  }

  @override

  String todayDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Today is $dateString';
  }

  @override
  String price(double amount) {
    final intl.NumberFormat amountNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
    );
    final String amountString = amountNumberFormat.format(amount);

    return 'Price: $amountString';
  }

  @override
  String get settings => 'Settings';

  @override
  String get home => 'Home';

  @override
  String get profile => 'Profile';

  @override
  String get enterName => 'Enter your name';

  @override
  String get submit => 'Submit';
  String currentDate(String date) {
    return 'Today\'s date: $date';
  }

  @override
  String amount(String amount) {
    return 'Amount: $amount';
  }

  @override
  String get languageSelection => 'Select Language:';
}
