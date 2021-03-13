import 'dart:async';
import 'dart:convert';

import "package:dio/dio.dart";
import "package:network/network.dart";

Dio client = _getClient();

Dio _getClient() {
  Dio _dio = new Dio();
  _dio.interceptors.add(new ApiInterceptors());
  _dio.options.baseUrl = "https://dev.diantaraje.com/api";
  _dio.options.followRedirects = false;
  _dio.options.validateStatus = (status) {
    return status < 500;
  };
  return _dio;
}

class ApiInterceptors extends Interceptor {
  @override
  Future<dynamic> onRequest(RequestOptions options) async {
    var sessionProvider = new SessionProvider();
    var session = await sessionProvider.fetchSession();
    if(session.cookies != null){
      options.headers["cookie"] = session.cookies;
    }
    return options;
  }

  @override
  Future<dynamic> onError(DioError dioError) {
    throw dioError;
  }

  @override
  Future<dynamic> onResponse(Response response) async {
    final cookies = response.headers.map["set-cookie"];

    if(response.statusCode == 401){
      var sessionProvider = new SessionProvider();
      sessionProvider.destroySession();
    }
    else if(cookies != null){
      var sessionProvider = new SessionProvider();
      await sessionProvider.setSession(new Session(cookies: cookies));
    }
    return response;
  }
}