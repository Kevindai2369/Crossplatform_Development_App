// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Ứng Dụng Demo i18n';

  @override
  String get welcomeMessage =>
      'Chào mừng đến với ứng dụng đa ngôn ngữ của chúng tôi!';

  @override
  String get changeLanguage => 'Đổi Ngôn Ngữ';

  @override
  String currentLanguage(String language) {
    return 'Ngôn Ngữ Hiện Tại: $language';
  }

  @override
  String greeting(String name) {
    return 'Xin chào, $name!';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mục',
      one: 'Một mục',
      zero: 'Không có mục nào',
    );
    return '$_temp0';
  }

  @override
  String todayDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Hôm nay là $dateString';
  }

  @override
  String price(double amount) {
    final intl.NumberFormat amountNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
    );
    final String amountString = amountNumberFormat.format(amount);

    return 'Giá: $amountString';
  }

  @override
  String get settings => 'Cài Đặt';

  @override
  String get home => 'Trang Chủ';

  @override
  String get profile => 'Hồ Sơ';

  @override
  String get enterName => 'Nhập tên của bạn';

  @override
  String get submit => 'Gửi';
}
