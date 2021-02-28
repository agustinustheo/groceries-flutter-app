import 'dart:convert';

class Customer {
  String customerEmail;
  String customerPassword;
  String customerName;
  String customerAddress;
  String customerPhone;

  Customer(
      {
        this.customerEmail,
        this.customerPassword,
        this.customerName,
        this.customerAddress,
        this.customerPhone});

  Customer.fromJson(Map<String, dynamic> json) {
    customerEmail = json['customerEmail'];
    customerPassword = json['customerPassword'];
    customerName = json['customerName'];
    customerAddress = json['customerAddress'];
    customerPhone = json['customerPhone'];
  }

  String encode() {
    return json.encode(
      {
        "customerEmail":customerEmail,
        "customerPassword":customerPassword,
        "customerName":customerName,
        "customerAddress":customerAddress,
        "customerPhone":customerPhone,
      }
    );
  }
}