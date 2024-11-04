import 'package:fest_outdoor/localization/app_localizations.dart';
import 'package:fest_outdoor/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(231, 120, 42, 0)),
        useMaterial3: true,
      ),
      home: const Home(),
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales
            .where((element) => element.languageCode == locale?.languageCode)
            .isNotEmpty) {
          return locale;
        }

        return const Locale('pl');
      },
    );
  }
}
