import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:network/network.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBloc extends Bloc<CartEvent,CartState> {
  /// State of the cart.
  static List<CheckoutProduct> productList = new List<CheckoutProduct>();
  CartBloc() : super(CartInitialState());

  @override
  Stream<CartState> mapEventToState(CartEvent event) async*{
   if(event is CartFetchData){
    yield CartLoadingState();
    yield CartFetchSuccessState(productList: productList);
   }
   else if(event is CartFetchTotalCartQuantity){
    yield CartLoadingState();
    int cartQuantity = 0;
    productList.asMap().forEach((i, value){
      cartQuantity += value.productQuantity;
    });
    yield CartFetchTotalCartQuantitySuccessState(quantity: cartQuantity);
   }
   else if(event is CartFetchProductQuantity){
    yield CartLoadingState();
    int productQuantity = 0;
    productList.asMap().forEach((i, value){
      if(value.productCode == event.product.productCode){
        productQuantity = value.productQuantity;
      }
    });
    yield CartFetchProductQuantitySuccessState(quantity: productQuantity);
   }
   else if(event is CartFetchTotalPrice){
    yield CartLoadingState();
    int total = 0;
    productList.asMap().forEach((i, value){
      total += (value.productQuantity * value.productPrice);
    });
    yield CartFetchTotalPriceSuccessState(totalPrice: total);
   }
   else if(event is CartFetchTotalProductPrice){
    yield CartLoadingState();
    int total = 0;
    productList.asMap().forEach((i, value){
      if(value.productCode == event.product.productCode){
        total += (value.productQuantity * value.productPrice);
      }
    });
    yield CartFetchTotalProductPriceSuccessState(totalProductPrice: total);
   }
   else if(event is CartCheckIfProductExists){
    yield CartLoadingState();
    int productQuantity = 0;
    productList.asMap().forEach((i, value){
      productQuantity += value.productQuantity;
    });
    yield CartCheckIfProductExistsSuccessState(exists: productQuantity > 0);
   }
   else if(event is CartAddProduct){
    yield CartLoadingState();
    bool isProductExists = false;
    productList.asMap().forEach((i, value){
      if(value.productCode == event.product.productCode){
        value.productQuantity += 1;
        isProductExists = true;
      }
    });
    
    if(!isProductExists) {
      event.product.productQuantity = 1;
      productList.add(event.product);
    }
    yield CartAddProductSuccessState();
   }
   else if(event is CartRemoveProduct){
    yield CartLoadingState();
    productList.asMap().forEach((i, value){
      if(value.productCode == event.product.productCode && value.productQuantity > 0){
        value.productQuantity -= 1;
      }
    });
    yield CartRemoveProductSuccessState();
   }
   else if(event is CartRemoveAllProduct){
    yield CartLoadingState();
    for(int i = productList.length - 1; i >= 0; i--){
      productList.removeAt(i);
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

  CartFetchSuccessState({
    @required this.productList,
  });

  @override
  List<Object> get props => [productList];
}

class CartFetchFailedState extends CartState {
  @override
  List<Object> get props => [];
}

class CartFetchData extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartFetchTotalCartQuantitySuccessState extends CartState {
  final int quantity;

  CartFetchTotalCartQuantitySuccessState({
    @required this.quantity,
  });

  @override
  List<Object> get props => [quantity];
}

class CartFetchTotalCartQuantity extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartFetchProductQuantitySuccessState extends CartState {
  final int quantity;

  CartFetchProductQuantitySuccessState({
    @required this.quantity,
  });

  @override
  List<Object> get props => [quantity];
}

class CartFetchProductQuantity extends CartEvent {
  final CheckoutProduct product;

  CartFetchProductQuantity({
    @required this.product,
  });

  @override
  List<Object> get props => [product];
}

class CartFetchTotalProductPriceSuccessState extends CartState {
  final int totalProductPrice;

  CartFetchTotalProductPriceSuccessState({
    @required this.totalProductPrice,
  });

  @override
  List<Object> get props => [totalProductPrice];
}

class CartFetchTotalProductPrice extends CartEvent {
  final CheckoutProduct product;

  CartFetchTotalProductPrice({
    @required this.product,
  });

  @override
  List<Object> get props => [product];
}

class CartFetchTotalPriceSuccessState extends CartState {
  final int totalPrice;

  CartFetchTotalPriceSuccessState({
    @required this.totalPrice,
  });

  @override
  List<Object> get props => [totalPrice];
}

class CartFetchTotalPrice extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartCheckIfProductExistsSuccessState extends CartState {
  final bool exists;

  CartCheckIfProductExistsSuccessState({
    @required this.exists,
  });

  @override
  List<Object> get props => [exists];
}

class CartCheckIfProductExists extends CartEvent {
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