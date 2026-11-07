// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'Fest Outdoor';

  @override
  String get program => 'Program';

  @override
  String get unableToOpenLink => 'Nie udało się otworzyć linku';

  @override
  String get person => 'Gośćie';

  @override
  String get favorite => 'Ulubione';

  @override
  String get personalFestivalProgram => 'Twój osobisty program festiwalu';

  @override
  String get noSavedFavorites => 'Nie masz jeszcze nic zapisanego.';

  @override
  String get browseProgram => 'Przeglądaj program';

  @override
  String get unableToLoadFavorites => 'Nie udało się wczytać ulubionych';

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
  String get loginTitle => 'Logowanie';

  @override
  String get organizerAccess => 'Dostęp dla organizatorów';

  @override
  String get usernameLabel => 'Nazwa użytkownika';

  @override
  String get usernameRequired => 'Nazwa użytkownika jest wymagana';

  @override
  String get showPassword => 'Pokaż hasło';

  @override
  String get hidePassword => 'Ukryj hasło';

  @override
  String get loginFailed =>
      'Logowanie nie powiodło się. Sprawdź dane i spróbuj ponownie.';

  @override
  String get unableToLoadOrganizerAccess =>
      'Nie udało się wczytać dostępu dla organizatorów.';

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
  String get ticketScanSubtitle => 'Skanowanie kodów QR przy wejściu';

  @override
  String get ticketScanHint => 'Skieruj kamerę na kod QR na bilecie';

  @override
  String get ticketManualHint => 'Wprowadź kod z biletu ręcznie';

  @override
  String get ticketCodeLabel => 'Kod biletu';

  @override
  String get checkTicket => 'Sprawdź';

  @override
  String get cancel => 'Anuluj';

  @override
  String get goToTicketView => 'Kontrola biletów';

  @override
  String get confirmTicket => 'Potwierdź bilet';

  @override
  String get scanNextTicket => 'Skanuj kolejny';

  @override
  String get validTicket => 'Ważny bilet';

  @override
  String get usedTicket => 'Bilet został już użyty';

  @override
  String get invalidTicket => 'Nieważny bilet';

  @override
  String get validTicketNote => 'Bilet jest ważny i nie został jeszcze użyty.';

  @override
  String get usedTicketNote =>
      'Ten bilet został już zeskanowany. Historia wejść znajduje się poniżej.';

  @override
  String get invalidTicketNote =>
      'Ten kod nie odpowiada żadnemu sprzedanemu biletowi.';

  @override
  String get ticketNotFound => 'Nie znaleziono biletu';

  @override
  String get ticketPersonLabel => 'Osoba';

  @override
  String get ticketLogs => 'Historia wejść';

  @override
  String get noTicketLogs => 'Brak wpisów.';

  @override
  String ticketScanTime(String time) {
    return 'Skan: $time';
  }

  @override
  String get unableToLoadTicket => 'Nie udało się wczytać biletu';

  @override
  String get ticketConfirmationFailed =>
      'Nie udało się potwierdzić biletu. Spróbuj ponownie.';

  @override
  String get logout => 'Wyloguj';

  @override
  String get noFavoritesFound => 'Zaznacz gości, których chcesz widzieć';

  @override
  String get noGuestsFound => 'Brak gości';

  @override
  String get guestTitleUnavailable => 'Gość zostanie ogłoszony';

  @override
  String get festivalVenue => 'Dom PZKO Gródek';

  @override
  String get festivalTown => 'Gródek';

  @override
  String get addToFavorites => 'Dodaj do ulubionych';

  @override
  String get removeFromFavorites => 'Usuń z ulubionych';

  @override
  String get info => 'Informacje';

  @override
  String get feedback => 'Opinie';

  @override
  String get infoTitle => 'Informacje';

  @override
  String get aboutFestival => 'O festiwalu';

  @override
  String get festivalTagline => 'Ruch, przyroda i ludzie';

  @override
  String get whatIsFestival => 'Czym jest FEST Outdoor?';

  @override
  String get festivalDescription =>
      '„Fest“ w gwarze cieszyńskiej znaczy „porządnie“. Nasz festiwal to ruch, przyroda i ludzie — z polskimi, czeskimi i regionalnymi akcentami. Pasja przecież łączy.';

  @override
  String get coldWaterSwimming => 'Morsowanie';

  @override
  String get foodAndDrink => 'Jedzenie i napoje';

  @override
  String get closingParty => 'Impreza finałowa';

  @override
  String get organizer => 'Organizator';

  @override
  String get festivalOrganizer =>
      'Miejscowe Koło Polskiego Związku Kulturalno-Oświatowego (PZKO) w Gródku. Projekt jest wspierany z programu Interreg.';

  @override
  String get buyTicket => 'Kup bilet';

  @override
  String get unableToLoadInfo => 'Nie udało się wczytać informacji';

  @override
  String get retry => 'Spróbuj ponownie';

  @override
  String festivalGuestCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gości',
      many: '$count gości',
      few: '$count gości',
      one: '1 gość',
      zero: 'Brak gości',
    );
    return '$_temp0';
  }

  @override
  String festivalDayCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dni programu',
      one: '1 dzień programu',
    );
    return '$_temp0';
  }

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
  String get feedbackTagline => 'Podziel się z nami swoimi wrażeniami';

  @override
  String get ratingLabel => 'Jak podobał Ci się festiwal?';

  @override
  String starRating(int count) {
    return '$count z 5 gwiazdek';
  }

  @override
  String get sendingFeedback => 'Wysyłanie…';

  @override
  String get feedbackSendFailed =>
      'Nie udało się wysłać opinii. Spróbuj ponownie.';

  @override
  String get thankYouForFeedback => 'Dziękujemy za opinię';
}
