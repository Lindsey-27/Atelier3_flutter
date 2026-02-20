// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginTitle => 'Login';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get cguLabel => 'I accept the terms and conditions';

  @override
  String get loginButton => 'Sign in';

  @override
  String get emailRequired => 'Email required';

  @override
  String get emailInvalid => 'Invalid email format';

  @override
  String get passwordRequired => 'Password required';

  @override
  String get cguRequired => 'You must accept the terms';

  @override
  String get loginSuccess => 'User connected';
}
