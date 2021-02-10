class CartProduct {
  final String itemCode;
  final int itemBarcode;
  final String itemName;
  final String itemType;
  final String itemUnit;
  final int price;
  final String productImage;
  int quantity;


  CartProduct(this.itemCode, this.itemBarcode, this.itemName, this.itemType, this.itemUnit, this.price, this.productImage);
}