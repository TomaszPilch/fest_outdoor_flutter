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
/// import 'localization/app_localizations.dart';
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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('cs'),
    Locale('pl')
  ];

  /// No description provided for @appTitle.
  ///
  /// In cs, this message translates to:
  /// **'Fest Outdoor'**
  String get appTitle;

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
  /// **'Přihlásit'**
  String get loginButton;

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

  /// No description provided for @thankYouForFeedback.
  ///
  /// In cs, this message translates to:
  /// **'Děkujeme za zpětnou vazbu'**
  String get thankYouForFeedback;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['cs', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'cs': return AppLocalizationsCs();
    case 'pl': return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
