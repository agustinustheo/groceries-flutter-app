import 'package:network/model/list_product.dart';
import 'package:network/network.dart';

class Repository {

  // This class is used to handle data from module network, it's mean we can
  // handle the data it's from local or internet

  final _apiProvider = ApiProvider();
  Future<ListProduct> fetchAllProduct() => _apiProvider.getListProduct();

}