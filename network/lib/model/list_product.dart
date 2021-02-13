class ListProduct {
  List<Product> listProduct;

  ListProduct({this.listProduct});

  ListProduct.fromJson(Map<String, dynamic> json) {
    if (json['listProduct'] != null) {
      // ignore: deprecated_member_use
      listProduct = new List<Product>();
      json['listProduct'].forEach((v) {
        listProduct.add(new Product.fromJson(v));
      });
    }
  }
}

class Product {
  int productPrice;
  int productBarcode;
  int width;
  int height;
  String productCode;
  String productName;
  String productType;
  String productUnit;
  String productDescription;
  String productImage;
  String brandImage;

  Product(
      {
        this.productPrice,
        this.productBarcode,
        this.width,
        this.height,
        this.productCode,
        this.productName,
        this.productType,
        this.productUnit,
        this.productDescription,
        this.productImage,
        this.brandImage});

  Product.fromJson(Map<String, dynamic> json) {
    productCode = json['productCode'];
    productName = json['productName'];
    productType = json['productType'];
    productUnit = json['productUnit'];
    productDescription = json['productDescription'];
    productPrice = json['productPrice'];
    productBarcode = json['productBarcode'];
    productImage = json['productImage'];
    brandImage = json['brandImage'];
    width = json['productImageWidth'];
    height = json['productImageHeight'];
  }
}