// ::Import 1
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeType { light, dark, system }

class AppTheme {
  static ThemeType themeType = ThemeType.light;
  static const String _storageKey = "theme_mode";

  static bool changeTheme(ThemeType type) {
    themeType = type;
    _syncToStorage();
    return true;
  }

  static init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    themeType = sharedPreferences.getString(_storageKey).toString() == "dark" ? ThemeType.dark : ThemeType.light;
  }

  static Future<void> _syncToStorage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_storageKey, themeType == ThemeType.dark ? "dark" : "light");
  }
}
