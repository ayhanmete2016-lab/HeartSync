import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageService {
  static const _key = "language";

  static Future<Locale> getLocale() async {
    final prefs = await SharedPreferences.getInstance();

    final code = prefs.getString(_key);

    if (code == null) {
      return const Locale("tr");
    }

    return Locale(code);
  }

  static Future<void> saveLocale(String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, code);
  }
}