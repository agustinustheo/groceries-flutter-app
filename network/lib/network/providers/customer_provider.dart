import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:network/network.dart';

import '../api_client.dart';

class CustomerProvider {
  Future<void> checkAuth() async {
    try{
      await client.get('/customer/checkauth');
    }
    on DioError catch(ex){
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new ApiException(errorMessage);
    }
  }

  Future<void> login(String customerEmail, String customerPassword) async {
    try{
      String basicToken = encodeStringBase64(customerEmail + ":" + customerPassword);
      client.options.headers["Authorization"] = "Basic $basicToken";
      await client.get('/customer/login');
    }
    on DioError catch(ex){
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new ApiException(errorMessage);
    }
  }
  
  Future<void> register(Customer customer) async {
    try{
      String basicToken = encodeStringBase64(customer.customerEmail + ":" + customer.customerPassword);
      client.options.headers["Authorization"] = "Basic $basicToken";
      await client.post('/customer/login', data: customer.encode());
    }
    on DioError catch(ex){
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new ApiException(errorMessage);
    }
  }
}