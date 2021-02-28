import 'dart:collection';
import 'package:flutter/material.dart';

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

class CartBloc extends ChangeNotifier {
  /// State of the cart.
  static List<CartProduct> productList = new List<CartProduct>();

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<CartProduct> get getProduct => UnmodifiableListView(productList);

  /// Adds [CartProduct] to cart. This is the only way to add the cart from outside.
  void add(CartProduct product) {
    bool isProductExists = false;
    productList.asMap().forEach((i, value){
      if(value.itemCode == product.itemCode){
        value.quantity += 1;
        isProductExists = true;
      }
    });
    
    if(!isProductExists) {
      product.quantity = 1;
      productList.add(product);
    }
  }

  /// Removes [CartProduct] from cart.
  void remove(CartProduct product) {
    productList.asMap().forEach((i, value){
      if(value.itemCode == product.itemCode && value.quantity > 0){
        value.quantity -= 1;
      }
    });
  }

  /// Removes all [CartProduct] in cart.
  void removeAllFromList(){
    for(int i = productList.length - 1; i >= 0; i--){
      productList.removeAt(i);
    }
  }

  /// Calculates the price of an [CartProduct].
  int itemPrice(CartProduct product){
    int total = 0;
    productList.asMap().forEach((i, value){
      if(value.itemCode == product.itemCode){
        total += (value.quantity * value.price);
      }
    });
    return total;
  }

  /// Calculates entire cart price.
  int totalPrice(){
    int total = 0;
    productList.asMap().forEach((i, value){
      total += (value.quantity * value.price);
    });
    return total;
  }

  /// Retrieves the quantity of an [CartProduct].
  int itemQuantity(CartProduct product){
    int quantity = 0;
    productList.asMap().forEach((i, value){
      if(value.itemCode == product.itemCode){
        quantity = value.quantity;
      }
    });
    return quantity;
  }
}