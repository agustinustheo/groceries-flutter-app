import 'dart:collection';
import 'package:bloc/bloc/cart/product.dart';
import 'package:flutter/material.dart';

class CartBloc extends ChangeNotifier {
  /// Internal, private state of the cart.
  final List<Product> productList = [];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<Product> get getProduct => UnmodifiableListView(productList);

  /// Adds [Product] to cart. This is the only way to add the cart from outside.
  void add(Product product) {
    productList.add(product);
  }

  int findToDelete(Product product){
    int index = -1;
    productList.asMap().forEach((i, value){
      if(value.itemID == product.itemID){
        index = i;
      }
    });
    return index;
  }

  /// Removes [Product] to cart. This is the only way to remove the cart from outside.
  void remove(Product product) {
    int index = this.findToDelete(product);
    if(index >= 0)
      productList.removeAt(index);
  }

  void addToList(List<Product> product){
    this.removeAllFromList();
    product.forEach((value){
      productList.add(value);
    });
  }

  void removeAllFromList(){
    for(int i = productList.length - 1; i >= 0; i--){
      productList.removeAt(i);
    }
  }

  int itemLength(String searchedId){
    int count = 0;
    productList.forEach((value){
      if(value.itemID == searchedId)
        count++;
    });
    return count;
  }

  void printList(){
    productList.forEach((value){
      print(value.itemName);
    });
  }
}