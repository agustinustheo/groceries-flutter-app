class CartProduct {
  final String itemCode;
  final int itemBarcode;
  final String itemName;
  final String itemType;
  final int price;
  final String productImage;
  int quantity;


  CartProduct(this.itemCode, this.itemBarcode, this.itemName, this.itemType, this.price, this.productImage);
}