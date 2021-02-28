import 'dart:convert';

class Session {
  List<String> cookies;

  Session({this.cookies});

  Session.fromJson(Map<String, dynamic> json) {
    cookies = json['cookies'];
  }

  String encode() => json.encode({ 'cookies': cookies });
}