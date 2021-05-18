import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_checkout_product.dart';

class CartProductBloc extends Bloc<CartProductEvent,CartProductState> {
  CartProductBloc() : super(CartProductInitialState());

  @override
  Stream<CartProductState> mapEventToState(CartProductEvent event) async*{
   CheckoutProduct _product;
   if(event is CartProductFetchData){
    yield CartProductLoadingState();
    _product = event.product;
    int productPrice = 0;
    int productQuantity = 0;
    ListCheckoutProduct.productList.asMap().forEach((i, value){
      if(value.productCode == event.product.productCode){
        productPrice += (value.productQuantity * value.productPrice);
        productQuantity += value.productQuantity;
      }
    });
    yield CartProductFetchDataSuccessState(
      product: _product,
      productQuantity: productQuantity,
      productPrice: productPrice,
    );
   }
  }
} 


abstract class CartProductState extends Equatable {
  const CartProductState();
}

abstract class CartProductEvent extends Equatable {
  const CartProductEvent();
}

class CartProductInitialState extends CartProductState {
  @override
  List<Object> get props => [];
}

class CartProductLoadingState extends CartProductState {
  @override
  List<Object> get props => [];
}

class CartProductFetchDataSuccessState extends CartProductState {
  final CheckoutProduct product;
  final int productQuantity;
  final int productPrice;

  CartProductFetchDataSuccessState({
    @required this.product,
    @required this.productQuantity,
    @required this.productPrice,
  });

  @override
  List<Object> get props => [productQuantity, productPrice];
}

class CartProductFetchData extends CartProductEvent {
  final CheckoutProduct product;

  CartProductFetchData({
    @required this.product,
  });

  @override
  List<Object> get props => [product];
}