import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:network/network.dart';

import '../api_client.dart';

class CheckoutProvider {
  Future<void> getCheckout({Map<String, dynamic> queryParameters}) async {
    try{
      await client.get('/checkout', queryParameters: queryParameters);
    }
    on DioError catch(ex){
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new ApiException(errorMessage);
    }
  }
  
  Future<void> addCheckout(Checkout checkout) async {
    try{
      await client.post('/checkout', data: checkout.encode());
    }
    on DioError catch(ex){
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new ApiException(errorMessage);
    }
  }
}