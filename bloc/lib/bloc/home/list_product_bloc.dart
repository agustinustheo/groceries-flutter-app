import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:network/model/list_product.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProductBloc extends Bloc<ListProductEvent,ListProductState> {
  final ProductRepository repository;
  ListProductBloc({@required this.repository}) : super(ListProductInitialState());

  @override
  Stream<ListProductState> mapEventToState(ListProductEvent event) async*{
   if(event is ListProductFetchData){
     yield ListProductLoadingState();
     ListProduct listProduct = await repository.fetchAllProduct();
     if(listProduct.listProduct.isEmpty){
       yield ListProductFetchFailedState();
     }else{
       yield ListProductFetchSuccessState(listProduct: listProduct);
     }
   }
  }
}

abstract class ListProductState extends Equatable {
  const ListProductState();
}

abstract class ListProductEvent extends Equatable {
  const ListProductEvent();
}

class ListProductInitialState extends ListProductState {
  @override
  List<Object> get props => [];
}

class ListProductLoadingState extends ListProductState {
  @override
  List<Object> get props => [];
}

class ListProductFetchSuccessState extends ListProductState {
  final ListProduct listProduct;

  ListProductFetchSuccessState({
    @required this.listProduct,
  });

  @override
  List<Object> get props => [listProduct];
}

class ListProductFetchFailedState extends ListProductState {
  @override
  List<Object> get props => [];
}

class ListProductFetchData extends ListProductEvent {
  @override
  List<Object> get props => [];
}

class SearchData extends ListProductEvent {
  final String text;

  SearchData({this.text});

  @override
  List<Object> get props => [text];
}
