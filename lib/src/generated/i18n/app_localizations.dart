import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_cs.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'i18n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('pl'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In cs, this message translates to:
  /// **'Fest Outdoor'**
  String get appTitle;

  /// No description provided for @program.
  ///
  /// In cs, this message translates to:
  /// **'Program'**
  String get program;

  /// No description provided for @unableToOpenLink.
  ///
  /// In cs, this message translates to:
  /// **'Odkaz se nepodařilo otevřít'**
  String get unableToOpenLink;

  /// No description provided for @person.
  ///
  /// In cs, this message translates to:
  /// **'Hosté'**
  String get person;

  /// No description provided for @favorite.
  ///
  /// In cs, this message translates to:
  /// **'Oblíbení'**
  String get favorite;

  /// No description provided for @personalFestivalProgram.
  ///
  /// In cs, this message translates to:
  /// **'Váš osobní program festivalu'**
  String get personalFestivalProgram;

  /// No description provided for @noSavedFavorites.
  ///
  /// In cs, this message translates to:
  /// **'Zatím nemáte nic uloženo.'**
  String get noSavedFavorites;

  /// No description provided for @browseProgram.
  ///
  /// In cs, this message translates to:
  /// **'Projít program'**
  String get browseProgram;

  /// No description provided for @unableToLoadFavorites.
  ///
  /// In cs, this message translates to:
  /// **'Oblíbené se nepodařilo načíst'**
  String get unableToLoadFavorites;

  /// No description provided for @settings.
  ///
  /// In cs, this message translates to:
  /// **'Nastavení'**
  String get settings;

  /// No description provided for @emailLabel.
  ///
  /// In cs, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @emailRequired.
  ///
  /// In cs, this message translates to:
  /// **'Email je povinný'**
  String get emailRequired;

  /// No description provided for @passwordLabel.
  ///
  /// In cs, this message translates to:
  /// **'Heslo'**
  String get passwordLabel;

  /// No description provided for @passwordRequired.
  ///
  /// In cs, this message translates to:
  /// **'Heslo je povinné'**
  String get passwordRequired;

  /// No description provided for @loginButton.
  ///
  /// In cs, this message translates to:
  /// **'Přihlásit se'**
  String get loginButton;

  /// No description provided for @loginTitle.
  ///
  /// In cs, this message translates to:
  /// **'Přihlášení'**
  String get loginTitle;

  /// No description provided for @organizerAccess.
  ///
  /// In cs, this message translates to:
  /// **'Vstup pro pořadatele'**
  String get organizerAccess;

  /// No description provided for @usernameLabel.
  ///
  /// In cs, this message translates to:
  /// **'Přihlašovací jméno'**
  String get usernameLabel;

  /// No description provided for @usernameRequired.
  ///
  /// In cs, this message translates to:
  /// **'Přihlašovací jméno je povinné'**
  String get usernameRequired;

  /// No description provided for @showPassword.
  ///
  /// In cs, this message translates to:
  /// **'Zobrazit heslo'**
  String get showPassword;

  /// No description provided for @hidePassword.
  ///
  /// In cs, this message translates to:
  /// **'Skrýt heslo'**
  String get hidePassword;

  /// No description provided for @loginFailed.
  ///
  /// In cs, this message translates to:
  /// **'Přihlášení se nezdařilo. Zkontrolujte údaje a zkuste to znovu.'**
  String get loginFailed;

  /// No description provided for @unableToLoadOrganizerAccess.
  ///
  /// In cs, this message translates to:
  /// **'Přístup pro pořadatele se nepodařilo načíst.'**
  String get unableToLoadOrganizerAccess;

  /// No description provided for @tickets.
  ///
  /// In cs, this message translates to:
  /// **'Vstupenky'**
  String get tickets;

  /// No description provided for @barcode_data.
  ///
  /// In cs, this message translates to:
  /// **'Data čárového kódu'**
  String get barcode_data;

  /// No description provided for @barcodes_found.
  ///
  /// In cs, this message translates to:
  /// **'Nalezeno čárových kódů: {count}'**
  String barcodes_found(Object count);

  /// No description provided for @barcode.
  ///
  /// In cs, this message translates to:
  /// **'Čárový kód: {barcodeValue}'**
  String barcode(Object barcodeValue);

  /// No description provided for @codeLabel.
  ///
  /// In cs, this message translates to:
  /// **'Kód'**
  String get codeLabel;

  /// No description provided for @codeRequired.
  ///
  /// In cs, this message translates to:
  /// **'Kód je povinný'**
  String get codeRequired;

  /// No description provided for @codeManually.
  ///
  /// In cs, this message translates to:
  /// **'Ručně zadat kód'**
  String get codeManually;

  /// No description provided for @ticketScanSubtitle.
  ///
  /// In cs, this message translates to:
  /// **'Skenování QR kódů na vstupu'**
  String get ticketScanSubtitle;

  /// No description provided for @ticketScanHint.
  ///
  /// In cs, this message translates to:
  /// **'Namířte kameru na QR kód na lístku'**
  String get ticketScanHint;

  /// No description provided for @ticketManualHint.
  ///
  /// In cs, this message translates to:
  /// **'Zadejte kód z lístku ručně'**
  String get ticketManualHint;

  /// No description provided for @ticketCodeLabel.
  ///
  /// In cs, this message translates to:
  /// **'Kód vstupenky'**
  String get ticketCodeLabel;

  /// No description provided for @checkTicket.
  ///
  /// In cs, this message translates to:
  /// **'Zkontrolovat'**
  String get checkTicket;

  /// No description provided for @cancel.
  ///
  /// In cs, this message translates to:
  /// **'Zrušit'**
  String get cancel;

  /// No description provided for @goToTicketView.
  ///
  /// In cs, this message translates to:
  /// **'Kontrola vstupenek'**
  String get goToTicketView;

  /// No description provided for @confirmTicket.
  ///
  /// In cs, this message translates to:
  /// **'Potvrdit vstupenku'**
  String get confirmTicket;

  /// No description provided for @scanNextTicket.
  ///
  /// In cs, this message translates to:
  /// **'Skenovat další'**
  String get scanNextTicket;

  /// No description provided for @validTicket.
  ///
  /// In cs, this message translates to:
  /// **'Platný lístek'**
  String get validTicket;

  /// No description provided for @usedTicket.
  ///
  /// In cs, this message translates to:
  /// **'Lístek už byl použit'**
  String get usedTicket;

  /// No description provided for @invalidTicket.
  ///
  /// In cs, this message translates to:
  /// **'Neplatný lístek'**
  String get invalidTicket;

  /// No description provided for @validTicketNote.
  ///
  /// In cs, this message translates to:
  /// **'Lístek je platný a dosud nepoužitý.'**
  String get validTicketNote;

  /// No description provided for @usedTicketNote.
  ///
  /// In cs, this message translates to:
  /// **'Tento lístek už byl naskenován. Historie vstupů je uvedena níže.'**
  String get usedTicketNote;

  /// No description provided for @invalidTicketNote.
  ///
  /// In cs, this message translates to:
  /// **'Tento kód neodpovídá žádné prodané vstupence.'**
  String get invalidTicketNote;

  /// No description provided for @ticketNotFound.
  ///
  /// In cs, this message translates to:
  /// **'Vstupenka nenalezena'**
  String get ticketNotFound;

  /// No description provided for @ticketPersonLabel.
  ///
  /// In cs, this message translates to:
  /// **'Osoba'**
  String get ticketPersonLabel;

  /// No description provided for @ticketLogs.
  ///
  /// In cs, this message translates to:
  /// **'Historie vstupů'**
  String get ticketLogs;

  /// No description provided for @noTicketLogs.
  ///
  /// In cs, this message translates to:
  /// **'Zatím žádné záznamy.'**
  String get noTicketLogs;

  /// No description provided for @ticketScanTime.
  ///
  /// In cs, this message translates to:
  /// **'Sken: {time}'**
  String ticketScanTime(String time);

  /// No description provided for @unableToLoadTicket.
  ///
  /// In cs, this message translates to:
  /// **'Vstupenku se nepodařilo načíst'**
  String get unableToLoadTicket;

  /// No description provided for @ticketConfirmationFailed.
  ///
  /// In cs, this message translates to:
  /// **'Vstupenku se nepodařilo potvrdit. Zkuste to znovu.'**
  String get ticketConfirmationFailed;

  /// No description provided for @logout.
  ///
  /// In cs, this message translates to:
  /// **'Odhlásit'**
  String get logout;

  /// No description provided for @noFavoritesFound.
  ///
  /// In cs, this message translates to:
  /// **'Označte hosty, které chcete vidět'**
  String get noFavoritesFound;

  /// No description provided for @noGuestsFound.
  ///
  /// In cs, this message translates to:
  /// **'Žádní hosté'**
  String get noGuestsFound;

  /// No description provided for @guestTitleUnavailable.
  ///
  /// In cs, this message translates to:
  /// **'Host bude oznámen'**
  String get guestTitleUnavailable;

  /// No description provided for @festivalVenue.
  ///
  /// In cs, this message translates to:
  /// **'Dům PZKO Hrádek'**
  String get festivalVenue;

  /// No description provided for @festivalTown.
  ///
  /// In cs, this message translates to:
  /// **'Hrádek'**
  String get festivalTown;

  /// No description provided for @addToFavorites.
  ///
  /// In cs, this message translates to:
  /// **'Přidat do oblíbených'**
  String get addToFavorites;

  /// No description provided for @removeFromFavorites.
  ///
  /// In cs, this message translates to:
  /// **'Odebrat z oblíbených'**
  String get removeFromFavorites;

  /// No description provided for @info.
  ///
  /// In cs, this message translates to:
  /// **'Informace'**
  String get info;

  /// No description provided for @feedback.
  ///
  /// In cs, this message translates to:
  /// **'Zpětná vazba'**
  String get feedback;

  /// No description provided for @infoTitle.
  ///
  /// In cs, this message translates to:
  /// **'Informace'**
  String get infoTitle;

  /// No description provided for @aboutFestival.
  ///
  /// In cs, this message translates to:
  /// **'O festivalu'**
  String get aboutFestival;

  /// No description provided for @festivalTagline.
  ///
  /// In cs, this message translates to:
  /// **'Pohyb, příroda a lidé'**
  String get festivalTagline;

  /// No description provided for @whatIsFestival.
  ///
  /// In cs, this message translates to:
  /// **'Co je FEST Outdoor?'**
  String get whatIsFestival;

  /// No description provided for @festivalDescription.
  ///
  /// In cs, this message translates to:
  /// **'„Fest“ znamená v těšínském nářečí „pořádně“. Náš festival je zaměřený na pohyb, přírodu a lidi — plný polských, českých i regionálních akcentů. Vášeň přece spojuje.'**
  String get festivalDescription;

  /// No description provided for @coldWaterSwimming.
  ///
  /// In cs, this message translates to:
  /// **'Otužování'**
  String get coldWaterSwimming;

  /// No description provided for @foodAndDrink.
  ///
  /// In cs, this message translates to:
  /// **'Jídlo a pití'**
  String get foodAndDrink;

  /// No description provided for @closingParty.
  ///
  /// In cs, this message translates to:
  /// **'Závěrečná párty'**
  String get closingParty;

  /// No description provided for @organizer.
  ///
  /// In cs, this message translates to:
  /// **'Pořadatel'**
  String get organizer;

  /// No description provided for @festivalOrganizer.
  ///
  /// In cs, this message translates to:
  /// **'Místní skupina Polského kulturně-osvětového svazu (PZKO) v Hrádku. Projekt je podpořen z programu Interreg.'**
  String get festivalOrganizer;

  /// No description provided for @buyTicket.
  ///
  /// In cs, this message translates to:
  /// **'Koupit vstupenku'**
  String get buyTicket;

  /// No description provided for @unableToLoadInfo.
  ///
  /// In cs, this message translates to:
  /// **'Informace se nepodařilo načíst'**
  String get unableToLoadInfo;

  /// No description provided for @retry.
  ///
  /// In cs, this message translates to:
  /// **'Zkusit znovu'**
  String get retry;

  /// No description provided for @festivalGuestCount.
  ///
  /// In cs, this message translates to:
  /// **'{count, plural, =0{Žádní hosté} =1{1 host} few{{count} hosté} other{{count} hostů}}'**
  String festivalGuestCount(int count);

  /// No description provided for @festivalDayCount.
  ///
  /// In cs, this message translates to:
  /// **'{count, plural, =1{1 den programu} few{{count} dny programu} other{{count} dní programu}}'**
  String festivalDayCount(int count);

  /// No description provided for @nameLabel.
  ///
  /// In cs, this message translates to:
  /// **'Jméno'**
  String get nameLabel;

  /// No description provided for @nameIsRequired.
  ///
  /// In cs, this message translates to:
  /// **'Jméno je povinné'**
  String get nameIsRequired;

  /// No description provided for @contentLabel.
  ///
  /// In cs, this message translates to:
  /// **'Hodnocení'**
  String get contentLabel;

  /// No description provided for @contentIsRequired.
  ///
  /// In cs, this message translates to:
  /// **'Hodnocení je povinné'**
  String get contentIsRequired;

  /// No description provided for @sendButton.
  ///
  /// In cs, this message translates to:
  /// **'Odeslat'**
  String get sendButton;

  /// No description provided for @feedbackTitle.
  ///
  /// In cs, this message translates to:
  /// **'Zpětná vazba na festival'**
  String get feedbackTitle;

  /// No description provided for @feedbackTagline.
  ///
  /// In cs, this message translates to:
  /// **'Podělte se s námi o své zážitky'**
  String get feedbackTagline;

  /// No description provided for @ratingLabel.
  ///
  /// In cs, this message translates to:
  /// **'Jak se vám festival líbil?'**
  String get ratingLabel;

  /// No description provided for @starRating.
  ///
  /// In cs, this message translates to:
  /// **'{count} z 5 hvězdiček'**
  String starRating(int count);

  /// No description provided for @sendingFeedback.
  ///
  /// In cs, this message translates to:
  /// **'Odesílání…'**
  String get sendingFeedback;

  /// No description provided for @feedbackSendFailed.
  ///
  /// In cs, this message translates to:
  /// **'Hodnocení se nepodařilo odeslat. Zkuste to znovu.'**
  String get feedbackSendFailed;

  /// No description provided for @thankYouForFeedback.
  ///
  /// In cs, this message translates to:
  /// **'Děkujeme za zpětnou vazbu'**
  String get thankYouForFeedback;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['cs', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs':
      return AppLocalizationsCs();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
