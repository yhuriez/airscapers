import 'dart:convert';

import 'package:airscaper/builder/model/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionStorage {

  static const String _SESSION_KEY = "SESSION_KEY";

  void saveSession(Session session) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString(_SESSION_KEY, jsonEncode(session.toJson()));
  }

  Future<Session> loadSession() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final jsonSession = sharedPrefs.getString(_SESSION_KEY);
    if (jsonSession == null) return null;
    return Session.fromJson(jsonDecode(jsonSession));
  }
}
