// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => '多言語デモ';

  @override
  String get welcome => 'Flutter i18n デモへようこそ';

  @override
  String get description => 'このアプリはFlutterでの国際化とローカライゼーション機能を実演します。';

  @override
  String get dateTimeTitle => '日時フォーマット';

  @override
  String get currentDate => '現在の日付';

  @override
  String get currentTime => '現在の時刻';

  @override
  String get numbersTitle => '数値と通貨のフォーマット';

  @override
  String get largeNumber => '大きな数';

  @override
  String get currency => '通貨';

  @override
  String get percentage => 'パーセンテージ';

  @override
  String get pluralizationTitle => '複数形の例';

  @override
  String get layoutTitle => 'レイアウト方向';

  @override
  String get layoutDescription => 'このテキストはアラビア語などのRTL言語に対応します';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countアイテム',
      one: '1アイテム',
      zero: 'アイテムなし',
    );
    return '$_temp0';
  }

  @override
  String userName(String name) {
    return 'こんにちは、$nameさん！';
  }

  @override
  String lastSeenMessage(String timeAgo) {
    return '最後のアクセス：$timeAgo';
  }
}
