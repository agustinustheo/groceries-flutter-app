import 'dart:convert';

import "package:dio/dio.dart";
import "package:network/network.dart";

Dio client = _getClient();

Dio _getClient() {
  Dio _dio = new Dio();
  _dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (RequestOptions options) => _requestInterceptor(options),
      onResponse: (Response response) => _responseInterceptor(response),
      onError: (DioError error) => _errorInterceptor(error)
    )
  );
  _dio.options.baseUrl = "https://dev.diantaraje.com/api";
  return _dio;
}

dynamic _requestInterceptor(RequestOptions options) async {
  var sessionProvider = new SessionProvider();
  var session = await sessionProvider.fetchSession();
  if(session.cookies != null){
    options.headers["cookie"] = session.cookies;
  }
	return options;
}

dynamic _responseInterceptor(Response response) async {
  final cookies = response.headers.map["set-cookie"];

  if(cookies != null){
    var sessionProvider = new SessionProvider();
    await sessionProvider.setSession(new Session(cookies: cookies));
  }
  return response;
}

dynamic _errorInterceptor(DioError dioError) async {
  if(dioError.response.statusCode == 401){
    var sessionProvider = new SessionProvider();
    sessionProvider.destroySession();
    return dioError;
  }
  String errorMessage = json.decode(dioError.response.toString())["errorMessage"];
  throw new Exception(errorMessage);
}