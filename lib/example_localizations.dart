import 'package:flutter/material.dart';
import 'package:flutter_i69n/i69n/translations.i69n.dart';
import 'package:flutter_i69n/i69n/translations_fr.i69n.dart';
import 'package:flutter_i69n/i69n/translations_uk.i69n.dart';

const _supportedLocales = ['en', 'fr', 'uk'];

class ExampleLocalizations {
  const ExampleLocalizations(this.translations);

  final Translations translations;

  static final _translations = <String, Translations Function()>{
    'en': () => const Translations(),
    'fr': () => const Translations_fr(),
    'uk': () => const Translations_uk(),
  };

  static const LocalizationsDelegate<ExampleLocalizations> delegate =
      _ExampleLocalizationDelegate();

  static final List<Locale> supportedLocales =
      _supportedLocales.map((x) => Locale(x)).toList();

  static Future<ExampleLocalizations> load(Locale locale) =>
      Future.value(ExampleLocalizations(_translations[locale.languageCode]!()));

  static Translations of(BuildContext context) =>
      Localizations.of<ExampleLocalizations>(context, ExampleLocalizations)!
          .translations;
}

class _ExampleLocalizationDelegate
    extends LocalizationsDelegate<ExampleLocalizations> {
  const _ExampleLocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      _supportedLocales.contains(locale.languageCode);

  @override
  Future<ExampleLocalizations> load(Locale locale) {
    return ExampleLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<ExampleLocalizations> old) => false;
}
