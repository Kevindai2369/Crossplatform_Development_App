import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'providers/task_provider.dart';
import 'providers/settings_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: Consumer2<TaskProvider, SettingsProvider>(
        builder: (context, taskProvider, settingsProvider, child) {
          return MaterialApp(
            title: 'To-Do App',
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(),
            themeMode: settingsProvider.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            locale: settingsProvider.locale,
            supportedLocales: const [Locale('en'), Locale('vi'), Locale('ja')],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
