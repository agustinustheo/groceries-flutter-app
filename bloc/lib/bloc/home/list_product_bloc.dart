import 'package:network/model/list_product.dart';
import 'package:rxdart/rxdart.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';

class ListProductBloc {

  final _repository = Repository();
  final _productFetcher = PublishSubject<ListProduct>();

  Observable<ListProduct> get allProduct => _productFetcher.stream;

  fetchAllReview() async {
    ListProduct listProduct = await _repository.fetchAllProduct();
    _productFetcher.sink.add(listProduct);
  }

  dispose() {
    _productFetcher.close();
  }
}