// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Aplicación Demo i18n';

  @override
  String get welcomeMessage => '¡Bienvenido a nuestra aplicación multiidioma!';

  @override
  String get changeLanguage => 'Cambiar Idioma';

  @override
  String currentLanguage(String language) {
    return 'Idioma Actual: $language';
  }

  @override
  String greeting(String name) {
    return '¡Hola, $name!';
  }

  @override
  String itemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count elementos',
      one: 'Un elemento',
      zero: 'Sin elementos',
    );
    return '$_temp0';
  }

  @override
  String todayDate(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMMMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Hoy es $dateString';
  }

  @override
  String price(double amount) {
    final intl.NumberFormat amountNumberFormat = intl.NumberFormat.currency(
      locale: localeName,
    );
    final String amountString = amountNumberFormat.format(amount);

    return 'Precio: $amountString';
  }

  @override
  String get settings => 'Configuración';

  @override
  String get home => 'Inicio';

  @override
  String get profile => 'Perfil';

  @override
  String get enterName => 'Ingresa tu nombre';

  @override
  String get submit => 'Enviar';
}
