// ::Import 1
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pagger/library/library.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { light, dark, system }

class AppTheme {
  static ThemeType themeType = ThemeType.light;
  static const String _storageKey = "theme_mode";

  static bool changeTheme(ThemeType type) {
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
    themeType = sharedPreferences.getString(_storageKey).toString() == "dark" ? ThemeType.dark : ThemeType.light;
  }

  static Future<void> _syncToStorage() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_storageKey, themeType == ThemeType.dark ? "dark" : "light");
  }
}
