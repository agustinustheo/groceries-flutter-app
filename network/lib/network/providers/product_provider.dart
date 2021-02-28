import 'dart:convert';
import 'package:network/network.dart';

import '../api_client.dart';

class ProductProvider {
  Future<ListProduct> fetchAllProduct() async {
    final response = await client.get('/product');
    return ListProduct.fromJson(json.decode(response.toString()));
  }
}