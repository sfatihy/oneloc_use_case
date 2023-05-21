import 'package:flutter/material.dart';
import 'package:oneloc_use_case/app/cacheManager.dart';
import 'package:oneloc_use_case/app/themes/themeDark.dart';
import 'package:oneloc_use_case/app/themes/themeLight.dart';

class SplashProvider with ChangeNotifier {

  ThemeData _theme = themeLight; // true -> light - false -> dark

  get getTheme => _theme;
  get getThemeBoolean => _theme == themeLight ? true : false;

  SplashProvider() {
    setTheme();
  }

  final CacheManager _cacheManager = CacheManager();

  setTheme() async {
    bool? response = await _cacheManager.getTheme();

    if (response == null || !response) {
      _theme = themeDark;
    }
    else {
      _theme = themeLight;
    }
    notifyListeners();
  }

  toggleTheme() async {
    if (_theme == themeDark) {
      _theme = themeLight;
      notifyListeners();
      await _cacheManager.saveTheme(true);
    }
    else {
      _theme = themeDark;
      notifyListeners();
      await _cacheManager.saveTheme(false);
    }

  }

  Future userCheck() async {
    String? response = await _cacheManager.getSC();

    if (response == null) {
      return false;
    }
    else {
      if (response == "1") {
        return true;
      }
      else {
        return false;
      }
    }
  }
}