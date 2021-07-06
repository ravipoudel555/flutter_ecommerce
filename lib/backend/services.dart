import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicePref extends ChangeNotifier {
  setStatus(bool login) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('login', login);
  }

  Future<bool?> getStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('login');
  }

  setToken(String token) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('token', token);
  }

  Future<String?> getToken() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('token');
  }

  setEmail(String email) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('email', email);
  }

  Future<String?> getEmail() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString('email');
  }
}
