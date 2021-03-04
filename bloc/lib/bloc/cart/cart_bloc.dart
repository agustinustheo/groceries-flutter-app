import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:network/network.dart';

class CartBloc extends ChangeNotifier {
  /// State of the cart.
  static List<CheckoutProduct> productList = new List<CheckoutProduct>();

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<CheckoutProduct> get getProduct => UnmodifiableListView(productList);

  /// Adds [CheckoutProduct] to cart. This is the only way to add the cart from outside.
  void add(CheckoutProduct product) {
    bool isProductExists = false;
    productList.asMap().forEach((i, value){
      if(value.productCode == product.productCode){
        value.productQuantity += 1;
        isProductExists = true;
      }
    });
    
    if(!isProductExists) {
      product.productQuantity = 1;
      productList.add(product);
    }
  }

  /// Removes [CheckoutProduct] from cart.
  void remove(CheckoutProduct product) {
    productList.asMap().forEach((i, value){
      if(value.productCode == product.productCode && value.productQuantity > 0){
        value.productQuantity -= 1;
      }
    });
  }

  /// Removes all [CheckoutProduct] in cart.
  void removeAllFromList(){
    for(int i = productList.length - 1; i >= 0; i--){
      productList.removeAt(i);
    }
  }

  /// Calculates the price of an [CheckoutProduct].
  int productPrice(CheckoutProduct product){
    int total = 0;
    productList.asMap().forEach((i, value){
      if(value.productCode == product.productCode){
        total += (value.productQuantity * value.productPrice);
      }
    });
    return total;
  }

  /// Calculates entire cart price.
  int totalPrice(){
    int total = 0;
    productList.asMap().forEach((i, value){
      total += (value.productQuantity * value.productPrice);
    });
    return total;
  }

  /// Retrieves the productQuantity of an [CheckoutProduct].
  int productQuantity(CheckoutProduct product){
    int productQuantity = 0;
    productList.asMap().forEach((i, value){
      if(value.productCode == product.productCode){
        productQuantity = value.productQuantity;
      }
    });
    return productQuantity;
  }
}