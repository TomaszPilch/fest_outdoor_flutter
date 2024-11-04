import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Fest Outdoor';

  @override
  String get person => 'Hosté';

  @override
  String get favorite => 'Oblíbení';

  @override
  String get settings => 'Nastavení';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailRequired => 'Email je povinný';

  @override
  String get passwordLabel => 'Heslo';

  @override
  String get passwordRequired => 'Heslo je povinné';

  @override
  String get loginButton => 'Přihlásit';

  @override
  String get tickets => 'Vstupenky';

  @override
  String get barcode_data => 'Data čárového kódu';

  @override
  String barcodes_found(Object count) {
    return 'Nalezeno čárových kódů: $count';
  }

  @override
  String barcode(Object barcodeValue) {
    return 'Čárový kód: $barcodeValue';
  }

  @override
  String get codeLabel => 'Kód';

  @override
  String get codeRequired => 'Kód je povinný';

  @override
  String get codeManually => 'Ručně zadat kód';
}
