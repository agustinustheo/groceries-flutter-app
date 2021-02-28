import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:network/network.dart';

import '../api_client.dart';

class ProductProvider {
  Future<ListProduct> fetchAllProduct() async {
    try{
      final response = await client.get('/product');
      return ListProduct.fromJson(json.decode(response.toString()));
    }
    on DioError catch(ex){
      String errorMessage = json.decode(ex.response.toString())["errorMessage"];
      throw new ApiException(errorMessage);
    }
  }
}