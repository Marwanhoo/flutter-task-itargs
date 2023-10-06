import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeModeType { light, dark }

class ThemeAppProvider extends ChangeNotifier {
  ThemeModeType? themeModeType;

  ThemeAppProvider() {
    themeModeType = ThemeModeType.light;
    loadThemeTypeFromPrefs();
  }


  ThemeModeType? get currentTheme => themeModeType;

  Future<void> toggleTheme()async{
    themeModeType = themeModeType == ThemeModeType.light ? ThemeModeType.dark : ThemeModeType.light;
    notifyListeners();
    await saveThemeTypeToPrefs();
  }
  Future<void> loadThemeTypeFromPrefs()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    themeModeType = ThemeModeType.values[prefs.getInt("themeType") ?? 0];
    notifyListeners();
  }
  Future<void> saveThemeTypeToPrefs()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("themeType", themeModeType!.index);
  }
}