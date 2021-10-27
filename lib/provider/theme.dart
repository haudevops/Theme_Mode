import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider_learning/until/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderThemeMode extends ChangeNotifier{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _isDark;

  bool get isDark => _isDark;

  ProviderThemeMode(){
    _isDark = false;
    checkTheme();
  }

  void setTheme(value) async{
    SharedPreferences prefs = await _prefs;
    prefs.setBool(Constants.ThemeMode, value);
    _isDark = value;
    notifyListeners();
  }

  void checkTheme() async{
    SharedPreferences prefs = await _prefs;
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    if(prefs.getBool(Constants.ThemeMode) != null){
      setTheme(_isDark);
    }else{
      setTheme(brightness);
    }
  }
}