import 'dart:async';
import 'package:http/http.dart' show Client;
import 'package:network/model/list_product.dart';
import 'dart:convert';

class ApiProvider {
  Client client = Client();
  static final String _baseUrlListProduct = 'http://dev.diantaraje.com/api/product';

  Future<ListProduct> getListProduct() async {
    final response = await client.get(_baseUrlListProduct);
    if (response.statusCode == 200){
      return ListProduct.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load list Product');
    }
  }

}