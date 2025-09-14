// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Biến để theo dõi ngôn ngữ hiện tại, mặc định là tiếng Anh
  Locale _locale = const Locale('en', '');

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter i18n & l10n Demo',
      // Cấu hình các locales được hỗ trợ, bây giờ có 3 ngôn ngữ
      supportedLocales: const [
        Locale('en', ''), // Tiếng Anh
        Locale('vi', ''), // Tiếng Việt
        Locale('ja', ''), // Tiếng Nhật
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      home: MyHomePage(
        title: 'Internationalization & Localization Demo (3 Languages)',
        onLanguageChanged: _changeLanguage,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
    required this.onLanguageChanged,
  }) : super(key: key);

  final String title;
  final Function(Locale) onLanguageChanged;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _itemCount = 0;

  void _incrementItemCount() {
    setState(() {
      _itemCount++;
    });
  }

  void _decrementItemCount() {
    setState(() {
      if (_itemCount > 0) {
        _itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);

    // Định dạng ngày tháng
    final DateTime now = DateTime.now();
    final DateFormat dateFormatter = DateFormat.yMMMMd(currentLocale.languageCode);
    final String formattedDate = dateFormatter.format(now);

    // Định dạng tiền tệ
    final double price = 1234567.89;
    String currencySymbol;
    if (currentLocale.languageCode == 'vi') {
      currencySymbol = '₫';
    } else if (currentLocale.languageCode == 'ja') {
      currencySymbol = '円'; // Ký hiệu Yen Nhật
    } else {
      currencySymbol = '\$';
    }

    final NumberFormat currencyFormatter = NumberFormat.currency(
      locale: currentLocale.languageCode,
      symbol: currencySymbol,
    );
    final String formattedCurrency = currencyFormatter.format(price);

    // Định dạng số
    final int bigNumber = 987654321;
    final NumberFormat numberFormatter = NumberFormat.decimalPattern(currentLocale.languageCode);
    final String formattedNumber = numberFormatter.format(bigNumber);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                appLocalizations.helloWorld,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              Text(
                appLocalizations.greeting,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              Text(
                appLocalizations.welcomeMessage,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 40),

              Text(
                appLocalizations.itemsInCart(_itemCount),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _decrementItemCount,
                    child: const Text('-'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _incrementItemCount,
                    child: const Text('+'),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              Text(
                appLocalizations.currentDate(formattedDate),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),

              Text(
                appLocalizations.amount(formattedCurrency),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 20),

              Text(
                'Large Number: ${formattedNumber}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 40),

              Text(
                appLocalizations.languageSelection, // Text "Select Language:"
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => widget.onLanguageChanged(const Locale('en', '')),
                    child: const Text('English'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => widget.onLanguageChanged(const Locale('vi', '')),
                    child: const Text('Tiếng Việt'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => widget.onLanguageChanged(const Locale('ja', '')),
                    child: const Text('日本語'), // Japanese
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}