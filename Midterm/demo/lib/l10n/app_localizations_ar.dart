// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'عرض متعدد اللغات';

  @override
  String get welcome => 'مرحباً بك في عرض Flutter i18n';

  @override
  String get description => 'يعرض هذا التطبيق ميزات التدويل والتوطين في Flutter.';

  @override
  String get dateTimeTitle => 'تنسيق التاريخ والوقت';

  @override
  String get currentDate => 'التاريخ الحالي';

  @override
  String get currentTime => 'الوقت الحالي';

  @override
  String get numbersTitle => 'تنسيق الأرقام والعملة';

  @override
  String get largeNumber => 'رقم كبير';

  @override
  String get currency => 'العملة';

  @override
  String get percentage => 'النسبة المئوية';

  @override
  String get pluralizationTitle => 'أمثلة الجمع';

  @override
  String get layoutTitle => 'اتجاه التخطيط';

  @override
  String get layoutDescription => 'يتكيف هذا النص مع اللغات التي تُكتب من اليمين إلى اليسار مثل العربية';

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count عنصر',
      many: '$count عنصراً',
      few: '$count عناصر',
      two: 'عنصران',
      one: 'عنصر واحد',
      zero: 'لا توجد عناصر',
    );
    return '$_temp0';
  }

  @override
  String userName(String name) {
    return 'مرحباً $name!';
  }

  @override
  String lastSeenMessage(String timeAgo) {
    return 'آخر ظهور $timeAgo';
  }
}
