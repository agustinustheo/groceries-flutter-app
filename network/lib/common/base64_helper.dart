import 'dart:convert';

String encodeStringBase64(String string){
  var bytes = utf8.encode(string);
  return base64.encode(bytes);
}