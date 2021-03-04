import 'package:network/network.dart';

class ProductRepository {

  // This class is used to handle data from module network, it's mean we can
  // handle the data it's from local or internet

  var _productProvider = new ProductProvider();
  Future<ListProduct> fetchAllProduct() => _productProvider.fetchAllProduct();
  Future<ListProduct> searchProduct(String text) => _productProvider.SearchProduct(text);

}