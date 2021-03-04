import 'dart:convert';

class Checkout {
  String checkoutID;
  DateTime checkoutDate;
  int totalPrice;
  String customerName;
  String customerAddress;
  String customerPhone;
  String customerNote;
  String paymentMethodType;
  DateTime paymentDate;
  bool isPaymentConfirmed;
  List<CheckoutProduct> checkoutProducts;

  Checkout(
      {
        this.checkoutID,
        this.checkoutDate,
        this.totalPrice,
        this.customerName,
        this.customerAddress,
        this.customerPhone,
        this.customerNote,
        this.paymentMethodType,
        this.paymentDate,
        this.isPaymentConfirmed,
        this.checkoutProducts});

  Checkout.fromJson(Map<String, dynamic> data) {
    checkoutID = data['checkoutID'];
    checkoutDate = data['checkoutDate'];
    totalPrice = data['totalPrice'];
    customerName = data['customerName'];
    customerAddress = data['customerAddress'];
    customerPhone = data['customerPhone'];
    customerNote = data['customerNote'];
    paymentMethodType = data['paymentMethodType'];
    paymentDate = data['paymentDate'];
    isPaymentConfirmed = data['isPaymentConfirmed'];
    checkoutProducts = (json.decode(data['checkoutProducts']) as List<dynamic>)
          .map<CheckoutProduct>((item) => CheckoutProduct.fromJson(item))
          .toList();
  }

  String encode() {
    return json.encode(
      {
        "checkoutID":checkoutID,
        "checkoutDate":checkoutDate,
        "totalPrice":totalPrice,
        "customerName":customerName,
        "customerAddress":customerAddress,
        "customerPhone":customerPhone,
        "customerNote":customerNote,
        "paymentMethodType":paymentMethodType,
        "paymentDate":paymentDate,
        "isPaymentConfirmed":isPaymentConfirmed,
        "checkoutProducts":checkoutProducts
      }
    );
  }
}

class CheckoutProduct{
  String productID;
  String productCode;
  int productBarcode;
  String productName;
  String productType;
  String productUnit;
  String productImage;
  int productPrice;
  int productQuantity;
  String checkoutID;
  String checkoutProductID;

  CheckoutProduct(
    this.productID,
    this.productCode,
    this.productBarcode,
    this.productName,
    this.productType,
    this.productUnit,
    this.productPrice,
    this.productImage,
    {
      this.productQuantity,
      this.checkoutProductID,
      this.checkoutID
    }
  );

  CheckoutProduct.fromJson(Map<String, dynamic> data) {
    productID = data['productID'];
    productCode = data['productCode'];
    productBarcode = data['productBarcode'];
    productName = data['productName'];
    productType = data['productType'];
    productUnit = data['productUnit'];
    productPrice = data['productPrice'];
    productImage = data['productImage'];
    productQuantity = data['productQuantity'];
    checkoutProductID = data['checkoutProductID'];
    checkoutID = data['checkoutID'];
  }
}