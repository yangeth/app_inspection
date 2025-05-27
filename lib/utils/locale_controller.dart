import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  var locale = const Locale('en').obs;
  var themeMode = ThemeMode.system.obs;

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString('languageCode') ?? 'en';
    locale.value = Locale(langCode);
    Get.updateLocale(locale.value);
    final themeString = prefs.getString('themeMode') ?? 'system';
    themeMode.value = _stringToThemeMode(themeString);
    Get.changeThemeMode(themeMode.value);
  }

  Future<void> toggleLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final newLang = locale.value.languageCode == 'en' ? 'es' : 'en';
    locale.value = Locale(newLang);
    await prefs.setString('languageCode', newLang);
    Get.updateLocale(locale.value);
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (themeMode.value == ThemeMode.dark) {
      themeMode.value = ThemeMode.light;
    } else {
      themeMode.value = ThemeMode.dark;
    }
    await prefs.setString('themeMode', _themeModeToString(themeMode.value));
    Get.changeThemeMode(themeMode.value);
  }

  ThemeMode _stringToThemeMode(String theme) {
    switch (theme) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
      return 'system';
    }
  }
}
