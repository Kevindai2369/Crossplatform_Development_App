// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get helloWorld => 'こんにちは世界！';

  @override
  String get greeting => 'おはようございます！';

  @override
  String get welcomeMessage => 'アプリへようこそ。';

  @override
  String itemsInCart(int itemCount) {
    String _temp0 = intl.Intl.pluralLogic(
      itemCount,
      locale: localeName,
      other: 'カートに$itemCount個のアイテムがあります。',
    );
    return '$_temp0';
  }

  @override
  String currentDate(String date) {
    return '今日の日にち: $date';
  }

  @override
  String amount(String amount) {
    return '金額: $amount';
  }

  @override
  String get languageSelection => '言語を選択してください:';
}
