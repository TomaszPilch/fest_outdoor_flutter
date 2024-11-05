import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Fest Outdoor';

  @override
  String get person => 'Gośćie';

  @override
  String get favorite => 'Ulubione';

  @override
  String get settings => 'Ustawienia';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailRequired => 'Email jest wymagany';

  @override
  String get passwordLabel => 'Hasło';

  @override
  String get passwordRequired => 'Hasło jest wymagane';

  @override
  String get loginButton => 'Zaloguj';

  @override
  String get tickets => 'Bilety';

  @override
  String get barcode_data => 'Dane kodu kreskowego';

  @override
  String barcodes_found(Object count) {
    return 'Znalezione kody kreskowe: $count';
  }

  @override
  String barcode(Object barcodeValue) {
    return 'Kod kreskowy: $barcodeValue';
  }

  @override
  String get codeLabel => 'Kod';

  @override
  String get codeRequired => 'Kod jest wymagany';

  @override
  String get codeManually => 'Wprowadź kod ręcznie';

  @override
  String get goToTicketView => 'Kontrola biletów';

  @override
  String get confirmTicket => 'Potwierdź bilet';

  @override
  String get logout => 'Wyloguj';

  @override
  String get noFavoritesFound => 'Zaznacz gości, których chcesz widzieć';

  @override
  String get noGuestsFound => 'Brak gości';

  @override
  String get info => 'Informacje';

  @override
  String get feedback => 'Opinie';

  @override
  String get infoTitle => 'Informacje';

  @override
  String get nameLabel => 'Imię';

  @override
  String get nameIsRequired => 'Imię jest wymagane';

  @override
  String get contentLabel => 'Ocena';

  @override
  String get contentIsRequired => 'Ocena jest wymagana';

  @override
  String get sendButton => 'Wyślij';

  @override
  String get feedbackTitle => 'Opinie na temat festiwalu';

  @override
  String get thankYouForFeedback => 'Dziękujemy za opinię';
}
