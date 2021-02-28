

import 'dart:convert';
import 'package:network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionProvider {
  Future<Session> fetchSession() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String sessionString = prefs.getString("session");
      if(sessionString != null){
        var map = json.decode(sessionString);
        return Session.fromJson(map);
      }
      return new Session();
    }
    on Exception catch(ex){
      throw ex;
    }
  }
  
  Future<void> setSession(Session session) async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("session", session.encode());
    }
    on Exception catch(ex){
      throw ex;
    }
  }
  
  Future<void> destroySession() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("session", null);
    }
    on Exception catch(ex){
      throw ex;
    }
  }
}