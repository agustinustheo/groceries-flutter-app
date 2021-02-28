import 'package:network/network.dart';

class CustomerRepository {

  // This class is used to handle data from module network, it's mean we can
  // handle the data it's from local or internet

  var _customerProvider = new CustomerProvider();
  Future<void> login(String customerEmail, String customerPassword) => 
    _customerProvider.login(customerEmail, customerPassword);

  Future<void> register(Customer customer) => 
    _customerProvider.register(customer);
}