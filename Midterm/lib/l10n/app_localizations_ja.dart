// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get tasks => 'タスク';

  @override
  String get addTask => 'タスクを追加';

  @override
  String get taskTitle => 'タスク名';

  @override
  String get category => 'カテゴリー';

  @override
  String get deadline => '期限';

  @override
  String get cancel => 'キャンセル';

  @override
  String get save => '保存';

  @override
  String get settings => '設定';

  @override
  String get darkMode => 'ダークモード';

  @override
  String get language => '言語';

  @override
  String get all => 'すべて';
}
