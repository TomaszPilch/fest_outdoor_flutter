// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get appTitle => 'Fest Outdoor';

  @override
  String get program => 'Program';

  @override
  String get unableToOpenLink => 'Odkaz se nepodařilo otevřít';

  @override
  String get person => 'Hosté';

  @override
  String get favorite => 'Oblíbení';

  @override
  String get personalFestivalProgram => 'Váš osobní program festivalu';

  @override
  String get noSavedFavorites => 'Zatím nemáte nic uloženo.';

  @override
  String get browseProgram => 'Projít program';

  @override
  String get unableToLoadFavorites => 'Oblíbené se nepodařilo načíst';

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
  String get loginButton => 'Přihlásit se';

  @override
  String get loginTitle => 'Přihlášení';

  @override
  String get organizerAccess => 'Vstup pro pořadatele';

  @override
  String get usernameLabel => 'Přihlašovací jméno';

  @override
  String get usernameRequired => 'Přihlašovací jméno je povinné';

  @override
  String get showPassword => 'Zobrazit heslo';

  @override
  String get hidePassword => 'Skrýt heslo';

  @override
  String get loginFailed =>
      'Přihlášení se nezdařilo. Zkontrolujte údaje a zkuste to znovu.';

  @override
  String get unableToLoadOrganizerAccess =>
      'Přístup pro pořadatele se nepodařilo načíst.';

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

  @override
  String get ticketScanSubtitle => 'Skenování QR kódů na vstupu';

  @override
  String get ticketScanHint => 'Namířte kameru na QR kód na lístku';

  @override
  String get ticketManualHint => 'Zadejte kód z lístku ručně';

  @override
  String get ticketCodeLabel => 'Kód vstupenky';

  @override
  String get checkTicket => 'Zkontrolovat';

  @override
  String get cancel => 'Zrušit';

  @override
  String get goToTicketView => 'Kontrola vstupenek';

  @override
  String get confirmTicket => 'Potvrdit vstupenku';

  @override
  String get scanNextTicket => 'Skenovat další';

  @override
  String get validTicket => 'Platný lístek';

  @override
  String get usedTicket => 'Lístek už byl použit';

  @override
  String get invalidTicket => 'Neplatný lístek';

  @override
  String get validTicketNote => 'Lístek je platný a dosud nepoužitý.';

  @override
  String get usedTicketNote =>
      'Tento lístek už byl naskenován. Historie vstupů je uvedena níže.';

  @override
  String get invalidTicketNote =>
      'Tento kód neodpovídá žádné prodané vstupence.';

  @override
  String get ticketNotFound => 'Vstupenka nenalezena';

  @override
  String get ticketPersonLabel => 'Osoba';

  @override
  String get ticketLogs => 'Historie vstupů';

  @override
  String get noTicketLogs => 'Zatím žádné záznamy.';

  @override
  String ticketScanTime(String time) {
    return 'Sken: $time';
  }

  @override
  String get unableToLoadTicket => 'Vstupenku se nepodařilo načíst';

  @override
  String get ticketConfirmationFailed =>
      'Vstupenku se nepodařilo potvrdit. Zkuste to znovu.';

  @override
  String get logout => 'Odhlásit';

  @override
  String get noFavoritesFound => 'Označte hosty, které chcete vidět';

  @override
  String get noGuestsFound => 'Žádní hosté';

  @override
  String get guestTitleUnavailable => 'Host bude oznámen';

  @override
  String get festivalVenue => 'Dům PZKO Hrádek';

  @override
  String get festivalTown => 'Hrádek';

  @override
  String get addToFavorites => 'Přidat do oblíbených';

  @override
  String get removeFromFavorites => 'Odebrat z oblíbených';

  @override
  String get info => 'Informace';

  @override
  String get feedback => 'Zpětná vazba';

  @override
  String get infoTitle => 'Informace';

  @override
  String get aboutFestival => 'O festivalu';

  @override
  String get festivalTagline => 'Pohyb, příroda a lidé';

  @override
  String get whatIsFestival => 'Co je FEST Outdoor?';

  @override
  String get festivalDescription =>
      '„Fest“ znamená v těšínském nářečí „pořádně“. Náš festival je zaměřený na pohyb, přírodu a lidi — plný polských, českých i regionálních akcentů. Vášeň přece spojuje.';

  @override
  String get coldWaterSwimming => 'Otužování';

  @override
  String get foodAndDrink => 'Jídlo a pití';

  @override
  String get closingParty => 'Závěrečná párty';

  @override
  String get organizer => 'Pořadatel';

  @override
  String get festivalOrganizer =>
      'Místní skupina Polského kulturně-osvětového svazu (PZKO) v Hrádku. Projekt je podpořen z programu Interreg.';

  @override
  String get buyTicket => 'Koupit vstupenku';

  @override
  String get unableToLoadInfo => 'Informace se nepodařilo načíst';

  @override
  String get retry => 'Zkusit znovu';

  @override
  String festivalGuestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hostů',
      few: '$count hosté',
      one: '1 host',
      zero: 'Žádní hosté',
    );
    return '$_temp0';
  }

  @override
  String festivalDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dní programu',
      few: '$count dny programu',
      one: '1 den programu',
    );
    return '$_temp0';
  }

  @override
  String get nameLabel => 'Jméno';

  @override
  String get nameIsRequired => 'Jméno je povinné';

  @override
  String get contentLabel => 'Hodnocení';

  @override
  String get contentIsRequired => 'Hodnocení je povinné';

  @override
  String get sendButton => 'Odeslat';

  @override
  String get feedbackTitle => 'Zpětná vazba na festival';

  @override
  String get feedbackTagline => 'Podělte se s námi o své zážitky';

  @override
  String get ratingLabel => 'Jak se vám festival líbil?';

  @override
  String starRating(int count) {
    return '$count z 5 hvězdiček';
  }

  @override
  String get sendingFeedback => 'Odesílání…';

  @override
  String get feedbackSendFailed =>
      'Hodnocení se nepodařilo odeslat. Zkuste to znovu.';

  @override
  String get thankYouForFeedback => 'Děkujeme za zpětnou vazbu';
}
