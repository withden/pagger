// ::Import 1
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagger/library/library.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme {
  static ThemeMode themeType = ThemeMode.light;
  static const String _storageKey = "theme_mode";

  static bool changeTheme(ThemeMode type) {
    themeType = type;
    final BuildContext? context = Get.context;
    if (context != null) {
      Provider.of<AppNotifier>(context, listen: false).notify();
    }
    _syncToStorage();
    return true;
  }

  static Future<void> init() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    themeType = sharedPreferences.getString(_storageKey).toString() == "dark" ? ThemeMode.dark : ThemeMode.light;
  }

  static Future<void> _syncToStorage() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_storageKey, themeType == ThemeMode.dark ? "dark" : "light");
  }
}
