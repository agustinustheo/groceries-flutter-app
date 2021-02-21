import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:network/model/list_product.dart';
import 'package:rxdart/rxdart.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListProductBloc extends Bloc<ListProductEvent,ListProductState> {
  final Repository repository;
  ListProductBloc({@required this.repository}) : super(InitialState());

  @override
  Stream<ListProductState> mapEventToState(ListProductEvent event) async*{
   if(event is FetchData){
     yield LoadingState();
     ListProduct listProduct = await repository.fetchAllProduct();
     if(listProduct.listProduct.isEmpty){
       yield FetchFailedState();
     }else{
       yield FetchSuccessState(listProduct: listProduct);
     }
   }
  }
  // ada 3 component => class bloc, class event, class state
  // class bloc = ngatur event apa aja, fetch, search dll
  // class event = spesifik ngejalanin event apa, misalnya ngejalanin event search
  // class state = ada state apa aja, misalnya ngebuild widget, => loading, datanya ga ada, failed, success

//  final _repository = Repository();
//  final _productFetcher = PublishSubject<ListProduct>();
//
//  Observable<ListProduct> get allProduct => _productFetcher.stream;
//
//  fetchAllReview() async {
//    ListProduct listProduct = await _repository.fetchAllProduct();
//    _productFetcher.sink.add(listProduct);
//  }
//
//  dispose() {
//    _productFetcher.close();
//  }

}

abstract class ListProductState extends Equatable {
  const ListProductState();
}

class InitialState extends ListProductState {
  @override
  List<Object> get props => [];
}

class LoadingState extends ListProductState {
  @override
  List<Object> get props => [];
}

class FetchSuccessState extends ListProductState {
  final ListProduct listProduct;

  FetchSuccessState({
    @required this.listProduct,
  });

  @override
  List<Object> get props => [listProduct];
}

class FetchFailedState extends ListProductState {
  @override
  List<Object> get props => [];
}

abstract class ListProductEvent extends Equatable {
  const ListProductEvent();
}

class FetchData extends ListProductEvent {
  @override
  List<Object> get props => [];
}

class SearchData extends ListProductEvent {
  final String text;

  SearchData({this.text});

  @override
  List<Object> get props => [text];
}
