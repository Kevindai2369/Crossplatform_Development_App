import 'package:flutter/material.dart';
import '/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.settings)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              title: Text(loc.darkMode),
              value: settingsProvider.isDarkMode,
              onChanged: (val) {
                settingsProvider.toggleDarkMode(val);
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(loc.language),
                DropdownButton<Locale>(
                  value: settingsProvider.locale,
                  items: const [
                    DropdownMenuItem(
                      value: Locale('en'),
                      child: Text('English'),
                    ),
                    DropdownMenuItem(
                      value: Locale('vi'),
                      child: Text('Tiếng Việt'),
                    ),
                    DropdownMenuItem(value: Locale('ja'), child: Text('日本語')),
                  ],
                  onChanged: (Locale? locale) {
                    if (locale != null) {
                      settingsProvider.setLocale(locale);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
