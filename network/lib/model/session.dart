import 'dart:convert';

class Session {
  List<String> cookies;

  Session({this.cookies});

  Session.fromJson(Map<String, dynamic> json) {
    cookies = (json['cookies'] as List)
        .map((x) => x.toString())
        .toList();
  }

  String encode() => json.encode({ 'cookies': cookies });
}