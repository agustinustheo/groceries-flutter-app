import 'dart:collection';
import 'package:bloc/bloc/cart/cart_product.dart';
import 'package:flutter/material.dart';

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

  /// Removes [CartProduct] to cart. This is the only way to remove the cart from outside.
  void remove(CartProduct product) {
    productList.asMap().forEach((i, value){
      if(value.itemCode == product.itemCode && value.quantity > 0){
        value.quantity -= 1;
      }
    });
  }

  void removeAllFromList(){
    for(int i = productList.length - 1; i >= 0; i--){
      productList.removeAt(i);
    }
  }

  int length(){
    return productList.length;
  }

  int itemQuantity(CartProduct product){
    int quantity = 0;
    productList.asMap().forEach((i, value){
      if(value.itemCode == product.itemCode){
        quantity = value.quantity;
      }
    });
    return quantity;
  }

  void printList(){
    productList.forEach((value){
      print(value.itemName);
    });
  }
}