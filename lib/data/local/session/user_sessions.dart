import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';

// utility class to manage user sessions by email & password
// using shared preferences
class UserSessions {
  static const String _key = 'user_sessions';
  // static const String _emailKey = 'email';
  static const String _tokenKey = 'token';
  static const String _nameKey = 'name';
  static const String _userIdKey = 'userId';

  static saveSession(User user) async {
    debugPrint('saving session');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final Map<String, String> session = <String, String>{
      // _emailKey: email,
      _tokenKey: user.token!,
      _nameKey: user.name!,
      _userIdKey: user.userId!

    };
    prefs.setString(_key, json.encode(session)).then((value) => debugPrint('saved session: $value'));
    debugPrint('saved session: ${prefs.getString(_key)}');
  }

  static Future<User?> getSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? session = prefs.getString(_key);
    if (session == null) {
      return null;
    }
    debugPrint(session.toString());
    return User.fromJson(json.decode(session));
  }

  static deleteSession() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_key);
  }
}