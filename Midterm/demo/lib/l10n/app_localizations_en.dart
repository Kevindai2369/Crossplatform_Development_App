// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
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
