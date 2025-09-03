class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // Phương thức để lấy instance từ context
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  // Map chứa tất cả văn bản đã dịch
  // Cấu trúc: {'language_code': {'key': 'translated_text'}}
  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_title': 'Multilingual Demo',
      'welcome': 'Welcome to Flutter i18n Demo',
      'description': 'This app demonstrates internationalization and localization features in Flutter.',
      'date_time_title': 'Date & Time Formatting',
      'current_date': 'Current Date',
      'current_time': 'Current Time',
      'numbers_title': 'Number & Currency Formatting',
      'large_number': 'Large Number',
      'currency': 'Currency',
      'percentage': 'Percentage',
      'pluralization_title': 'Pluralization Examples',
      'layout_title': 'Layout Direction',
      'layout_description': 'This text adapts to RTL languages like Arabic',
      'item_count_zero': 'No items',
      'item_count_one': '1 item',
      'item_count_other': '{} items',
    },
    'vi': {
      'app_title': 'Demo Đa Ngôn Ngữ',
      'welcome': 'Chào mừng đến với Demo i18n Flutter',
      'description': 'Ứng dụng này thể hiện các tính năng quốc tế hóa và bản địa hóa trong Flutter.',
      'date_time_title': 'Định Dạng Ngày & Giờ',
      'current_date': 'Ngày Hiện Tại',
      'current_time': 'Giờ Hiện Tại',
      'numbers_title': 'Định Dạng Số & Tiền Tệ',
      'large_number': 'Số Lớn',
      'currency': 'Tiền Tệ',
      'percentage': 'Phần Trăm',
      'pluralization_title': 'Ví Dụ Số Nhiều',
      'layout_title': 'Hướng Bố Cục',
      'layout_description': 'Văn bản này thích ứng với ngôn ngữ RTL như tiếng Ả Rập',
      'item_count_zero': 'Không có mục nào',
      'item_count_one': '1 mục',
      'item_count_other': '{} mục',
    },
    'ja': {
      'app_title': '多言語デモ',
      'welcome': 'Flutter i18n デモへようこそ',
      'description': 'このアプリはFlutterでの国際化とローカライゼーション機能を実演します。',
      'date_time_title': '日時フォーマット',
      'current_date': '現在の日付',
      'current_time': '現在の時刻',
      'numbers_title': '数値と通貨のフォーマット',
      'large_number': '大きな数',
      'currency': '通貨',
      'percentage': 'パーセンテージ',
      'pluralization_title': '複数形の例',
      'layout_title': 'レイアウト方向',
      'layout_description': 'このテキストはアラビア語などのRTL言語に対応します',
      'item_count_zero': 'アイテムなし',
      'item_count_one': '1アイテム',
      'item_count_other': '{}アイテム',
    },
    'ar': {
      'app_title': 'عرض متعدد اللغات',
      'welcome': 'مرحباً بك في عرض Flutter i18n',
      'description': 'يعرض هذا التطبيق ميزات التدويل والتوطين في Flutter.',
      'date_time_title': 'تنسيق التاريخ والوقت',
      'current_date': 'التاريخ الحالي',
      'current_time': 'الوقت الحالي',
      'numbers_title': 'تنسيق الأرقام والعملة',
      'large_number': 'رقم كبير',
      'currency': 'العملة',
      'percentage': 'النسبة المئوية',
      'pluralization_title': 'أمثلة الجمع',
      'layout_title': 'اتجاه التخطيط',
      'layout_description': 'يتكيف هذا النص مع اللغات التي تُكتب من اليمين إلى اليسار مثل العربية',
      'item_count_zero': 'لا توجد عناصر',
      'item_count_one': 'عنصر واحد',
      'item_count_other': '{} عناصر',
    },
  };

  // Các getter để lấy văn bản đã dịch
  // Cách hoạt động: Lấy language code từ locale hiện tại, 
  // sau đó tìm key tương ứng trong _localizedValues
  String get appTitle => _localizedValues[locale.languageCode]!['app_title']!;
  String get welcome => _localizedValues[locale.languageCode]!['welcome']!;
  String get description => _localizedValues[locale.languageCode]!['description']!;
  String get dateTimeTitle => _localizedValues[locale.languageCode]!['date_time_title']!;
  String get currentDate => _localizedValues[locale.languageCode]!['current_date']!;
  String get currentTime => _localizedValues[locale.languageCode]!['current_time']!;
  String get numbersTitle => _localizedValues[locale.languageCode]!['numbers_title']!;
  String get largeNumber => _localizedValues[locale.languageCode]!['large_number']!;
  String get currency => _localizedValues[locale.languageCode]!['currency']!;
  String get percentage => _localizedValues[locale.languageCode]!['percentage']!;
  String get pluralizationTitle => _localizedValues[locale.languageCode]!['pluralization_title']!;
  String get layoutTitle => _localizedValues[locale.languageCode]!['layout_title']!;
  String get layoutDescription => _localizedValues[locale.languageCode]!['layout_description']!;

  // Hàm xử lý pluralization (số ít/nhiều)
  // Nhận vào số lượng và trả về chuỗi phù hợp
  String itemCount(int count) {
    if (count == 0) {
      return _localizedValues[locale.languageCode]!['item_count_zero']!;
    } else if (count == 1) {
      return _localizedValues[locale.languageCode]!['item_count_one']!;
    } else {
      return _localizedValues[locale.languageCode]!['item_count_other']!
          .replaceAll('{}', count.toString());
    }
  }
}

// Delegate để Flutter biết cách load AppLocalizations
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  // Kiểm tra locale có được hỗ trợ không
  @override
  bool isSupported(Locale locale) {
    return ['en', 'vi', 'ja', 'ar'].contains(locale.languageCode);
  }

  // Load AppLocalizations cho locale cụ thể
  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  // Có cần reload khi delegate thay đổi không
  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}