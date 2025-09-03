// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get helloWorld => 'Xin chào Thế giới!';

  @override
  String get greeting => 'Chào buổi sáng!';

  @override
  String get welcomeMessage => 'Chào mừng bạn đến với ứng dụng của chúng tôi.';

  @override
  String itemsInCart(int itemCount) {
    String _temp0 = intl.Intl.pluralLogic(
      itemCount,
      locale: localeName,
      other: '$itemCount sản phẩm trong giỏ hàng.',
    );
    return '$_temp0';
  }

  @override
  String currentDate(String date) {
    return 'Ngày hôm nay: $date';
  }

  @override
  String amount(String amount) {
    return 'Số tiền: $amount';
  }

  @override
  String get languageSelection => 'Chọn ngôn ngữ:';
}
