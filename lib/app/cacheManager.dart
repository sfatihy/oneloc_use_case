import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {

  // Token
  Future saveEmail(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("data", token);
  }

  Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("data");
  }

  Future deleteEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("data");
  }

  // StatusCode
  Future saveSC(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("data", token);
  }

  Future<String?> getSC() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("data");
  }

  Future deleteSC() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("data");
  }

  // Theme
  Future saveTheme(bool theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("theme", theme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("theme");
  }
}