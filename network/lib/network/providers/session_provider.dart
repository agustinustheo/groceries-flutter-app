

import 'dart:convert';
import 'package:network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionProvider {
  Future<Session> fetchSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String sessionString = prefs.getString("session");
    if(sessionString != null){
      var map = json.decode(sessionString);
      return Session.fromJson(map);
    }
    return new Session();
  }
  
  Future<void> setSession(Session session) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("session", session.encode());
  }
  
  Future<void> destroySession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("session", "");
  }
}