import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider_learning/until/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../until/constants.dart';

ThemeData light = ThemeData(
    brightness: Brightness.light,
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
);

class ProviderThemeMode extends ChangeNotifier{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ThemeData _selectTheme;

  ThemeData light = ThemeData(
    brightness: Brightness.light,
  );

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
  );

  ProviderThemeMode({bool isDarkMode}){
    _selectTheme = isDarkMode ? dark : light;
  }

  void checkTheme() async {
    SharedPreferences prefs = await _prefs;
    if (_selectTheme == dark) {
      _selectTheme = light;
      await prefs.setBool(Constants.ThemeMode, false);
    } else {
      _selectTheme = dark;
      await prefs.setBool(Constants.ThemeMode, true);
    }

    notifyListeners();
  }

  ThemeData get getTheme => _selectTheme;
}