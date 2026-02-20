// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get loginTitle => 'Connexion';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Mot de passe';

  @override
  String get cguLabel => 'J\'accepte les conditions d\'utilisation';

  @override
  String get loginButton => 'Se connecter';

  @override
  String get emailRequired => 'Email requis';

  @override
  String get emailInvalid => 'Format email invalide';

  @override
  String get passwordRequired => 'Mot de passe requis';

  @override
  String get cguRequired => 'Vous devez accepter les conditions';

  @override
  String get loginSuccess => 'Utilisateur connecté';
}
