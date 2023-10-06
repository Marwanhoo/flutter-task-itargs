import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';


class AppLocalizationsConfig {
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('ar', 'EG'),
  ];

  static Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates() {
    return [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  static Locale? localeResolutionCallback(
      Locale? deviceLocal, Iterable<Locale> supportedLocales) {
    for (var locale in supportedLocales) {
      if (deviceLocal != null) {
        if (deviceLocal.languageCode == locale.languageCode) {
          return deviceLocal;
        }
      }
    }
    return supportedLocales.first;
  }
}
