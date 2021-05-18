import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_checkout_product.dart';

class CartBloc extends Bloc<CartEvent,CartState> {
  CartBloc() : super(CartInitialState());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async*{
   if(event is CartFetchData){
    yield CartLoadingState();
    int totalQuantity = 0;
    int totalPrice = 0;
    ListCheckoutProduct.productList.asMap().forEach((i, value){
      totalPrice += (value.productQuantity * value.productPrice);
      totalQuantity += value.productQuantity;
    });
    yield CartFetchSuccessState(
      productList: ListCheckoutProduct.productList, 
      totalPrice: totalPrice, 
      totalQuantity: totalQuantity,
    );
   }
   else if(event is CartAddProduct){
    yield CartLoadingState();
    bool isProductExists = false;
    ListCheckoutProduct.productList.asMap().forEach((i, value){
      if(value.productCode == event.product.productCode){
        value.productQuantity += 1;
        isProductExists = true;
      }
    });
    
    if(!isProductExists) {
      event.product.productQuantity = 1;
      ListCheckoutProduct.productList.add(event.product);
    }
    yield CartAddProductSuccessState();
   }
   else if(event is CartRemoveProduct){
    yield CartLoadingState();
    ListCheckoutProduct.productList.asMap().forEach((i, value){
      if(value.productCode == event.product.productCode && value.productQuantity > 0){
        value.productQuantity -= 1;
      }
    });
    yield CartRemoveProductSuccessState();
   }
   else if(event is CartRemoveAllProduct){
    yield CartLoadingState();
    for(int i = ListCheckoutProduct.productList.length - 1; i >= 0; i--){
      ListCheckoutProduct.productList.removeAt(i);
    }
    yield CartRemoveAllProductSuccessState();
   }
  }
} 

abstract class CartState extends Equatable {
  const CartState();
}

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartInitialState extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoadingState extends CartState {
  @override
  List<Object> get props => [];
}

class CartFetchSuccessState extends CartState {
  final List<CheckoutProduct> productList;
  final int totalPrice;
  final int totalQuantity;

  CartFetchSuccessState({
    @required this.productList,
    @required this.totalPrice,
    @required this.totalQuantity,
  });

  @override
  List<Object> get props => [productList, totalPrice, totalQuantity];
}

class CartFetchFailedState extends CartState {
  @override
  List<Object> get props => [];
}

class CartFetchData extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartAddProductSuccessState extends CartState {
  @override
  List<Object> get props => [];
}

class CartAddProduct extends CartEvent {
  final CheckoutProduct product;

  CartAddProduct({
    @required this.product,
  });

  @override
  List<Object> get props => [product];
}

class CartRemoveProductSuccessState extends CartState {
  @override
  List<Object> get props => [];
}

class CartRemoveProduct extends CartEvent {
  final CheckoutProduct product;

  CartRemoveProduct({
    @required this.product,
  });

  @override
  List<Object> get props => [product];
}

class CartRemoveAllProductSuccessState extends CartState {
  @override
  List<Object> get props => [];
}

class CartRemoveAllProduct extends CartEvent {
  @override
  List<Object> get props => [];
}