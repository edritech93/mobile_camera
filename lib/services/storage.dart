import 'dart:async';

import 'package:mobile_camera/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  void setToken(String token) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(STORAGE_TOKEN, token);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? token = prefs.getString(STORAGE_TOKEN);
      return token;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
