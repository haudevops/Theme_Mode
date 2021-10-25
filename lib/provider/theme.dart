import 'package:flutter/material.dart';

class ProviderThemeMode extends ChangeNotifier{
  bool _isDark = false;

  bool get isDark => _isDark;

  void setThemeDark(value){
    _isDark = value;
    notifyListeners();
  }
}