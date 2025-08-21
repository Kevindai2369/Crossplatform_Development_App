import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  final Function(Locale) onLocaleChange;

  const HomeScreen({super.key, required this.onLocaleChange});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _userName = 'User';
  int _itemCount = 0;
  final TextEditingController _nameController = TextEditingController();

  final List<Map<String, dynamic>> _languages = [
    {'code': 'en', 'name': 'English', 'flag': '🇺🇸'},
    {'code': 'es', 'name': 'Español', 'flag': '🇪🇸'},
    {'code': 'vi', 'name': 'Tiếng Việt', 'flag': '🇻🇳'},
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final currentLocale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.appTitle),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Message
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Icon(Icons.language, size: 50, color: Colors.blue),
                    SizedBox(height: 10),
                    Text(
                      localizations.welcomeMessage,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Current Language Display
            Card(
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.green),
                title: Text(
                  localizations.currentLanguage(
                    _getLanguageName(currentLocale.languageCode),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Language Selection
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      localizations.changeLanguage,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: _languages.map((lang) {
                        final isSelected =
                            currentLocale.languageCode == lang['code'];
                        return FilterChip(
                          avatar: Text(lang['flag']),
                          label: Text(lang['name']),
                          selected: isSelected,
                          onSelected: (selected) {
                            if (selected) {
                              widget.onLocaleChange(Locale(lang['code']));
                            }
                          },
                          selectedColor: Colors.blue.withOpacity(0.3),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Name Input and Greeting
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: localizations.enterName,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _userName = _nameController.text.isNotEmpty
                              ? _nameController.text
                              : 'User';
                        });
                      },
                      child: Text(localizations.submit),
                    ),
                    SizedBox(height: 10),
                    Text(
                      localizations.greeting(_userName),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Pluralization Demo
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pluralization Demo',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (_itemCount > 0) _itemCount--;
                            });
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Expanded(
                          child: Text(
                            localizations.itemCount(_itemCount),
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _itemCount++;
                            });
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Date and Number Formatting
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Formatting Demo',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.calendar_today),
                      title: Text(localizations.todayDate(DateTime.now())),
                    ),
                    ListTile(
                      leading: Icon(Icons.attach_money),
                      title: Text(localizations.price(123.45)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: localizations.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: localizations.settings,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: localizations.profile,
          ),
        ],
      ),
    );
  }

  String _getLanguageName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'es':
        return 'Español';
      case 'vi':
        return 'Tiếng Việt';
      default:
        return 'Unknown';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
