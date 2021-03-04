import 'package:network/network.dart';

class CheckoutRepository {

  // This class is used to handle data from module network, it's mean we can
  // handle the data it's from local or internet

  var _checkoutProvider = new CheckoutProvider();
  Future<void> getCheckout({Map<String, dynamic> queryParameters}) async => 
    await _checkoutProvider.getCheckout(queryParameters: queryParameters);

  Future<void> addCheckout(Checkout checkout) async => 
    await _checkoutProvider.addCheckout(checkout);
}