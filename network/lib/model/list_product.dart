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
  int price;
  int itemBarcode;
  int width;
  int height;
  String itemCode;
  String itemName;
  String itemType;
  String itemUnit;
  String description;
  String productImage;
  String brandImage;

  Product(
      {
        this.price,
        this.itemBarcode,
        this.width,
        this.height,
        this.itemCode,
        this.itemName,
        this.itemType,
        this.itemUnit,
        this.description,
        this.productImage,
        this.brandImage});

  Product.fromJson(Map<String, dynamic> json) {
    itemCode = json['itemCode'];
    itemName = json['itemName'];
    itemType = json['itemType'];
    itemUnit = json['itemUnit'];
    description = json['description'];
    price = json['price'];
    itemBarcode = json['itemBarcode'];
    productImage = json['productImage'];
    brandImage = json['brandImage'];
    width = json['productImageWidth'];
    height = json['productImageHeight'];
  }
}