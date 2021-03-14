import 'package:network/network.dart';

class CustomerRepository {

  // This class is used to handle data from module network, it's mean we can
  // handle the data it's from local or internet

  var _customerProvider = new CustomerProvider();
  Future<void> checkAuth() async => 
    await _customerProvider.checkAuth();

  Future<void> login(String customerEmail, String customerPassword) async => 
    await _customerProvider.login(customerEmail, customerPassword);

  Future<void> register(Customer customer) async => 
    await _customerProvider.register(customer);
}