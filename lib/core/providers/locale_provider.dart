import 'package:flutter/material.dart';

import '../services/language_service.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale("tr");

  Locale get locale => _locale;

  Future<void> load() async {
    _locale = await LanguageService.getLocale();
    notifyListeners();
  }

  Future<void> changeLanguage(String code) async {
    _locale = Locale(code);

    await LanguageService.saveLocale(code);

    notifyListeners();
  }
}