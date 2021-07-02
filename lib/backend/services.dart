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
}
