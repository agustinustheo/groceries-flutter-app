import 'package:network/network.dart';

import '../api_client.dart';

class CustomerProvider {
  Future<void> login(String customerEmail, String customerPassword) async {
    String basicToken = encodeStringBase64(customerEmail + ":" + customerPassword);
    client.options.headers["Authorization"] = "Basic $basicToken";
    await client.get('/customer/login');
  }
  
  Future<void> register(Customer customer) async {
    String basicToken = encodeStringBase64(customer.customerEmail + ":" + customer.customerPassword);
    client.options.headers["Authorization"] = "Basic $basicToken";
    await client.post('/customer/login', data: customer.encode());
  }
}