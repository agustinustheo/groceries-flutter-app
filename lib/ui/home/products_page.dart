
import 'package:bloc/bloc.dart';
import 'package:bloc_modul/bloc/home/list_product_bloc.dart';
import 'package:diantaraja_mobile/widget/card/card_product_search.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:diantaraja_mobile/widget/app_bar/app_bar_home.dart';
import 'package:network/model/list_product.dart';
import 'package:network/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final String text_search = "kopi susu";

  //BlocProvider.of<ListProductBloc>(context).add(SearchData(text: text_search));
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListProductBloc(repository: Repository())..add(FetchData()),
      child: Scaffold(
        appBar: CustomAppBar(
          appBarColor: Colors.blue[400],
          addBackButton: true,
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.only(
            top: Sizes.dp28(context),
            left: Sizes.dp28(context),
            right: Sizes.dp28(context)
          ),
          child: BlocConsumer<ListProductBloc, ListProductState>(
            listener: (context,state){},
            builder: (context,state){
              if(state is FetchSuccessState){
                return ListView.builder(
                  itemCount: state.listProduct.listProduct.length,
                  itemBuilder: (context, index) {
                    return CardProductSearch(
                      product: state.listProduct.listProduct[index]
                    );
                  }
                );
              }else if(state is FetchFailedState){
                return Text(
                  "Error fetch data",
                  style: TextStyle(color: Colors.red),
                );
              }else{
                return Center(child: CircularProgressIndicator(),
              );
              }
            },
          )
//          StreamBuilder(
//            stream: bloc_product.allProduct,
//            builder: (context, AsyncSnapshot<ListProduct> snapshot) {
//              if (snapshot.hasData) {
//                return ListView.builder(
//                  itemCount: snapshot.data.listProduct.length,
//                  itemBuilder: (context, index) {
//                    return CardProductSearch(
//                      product: snapshot.data.listProduct[index]
//                    );
//                  }
//                );
//              } else if (snapshot.hasError) {
//                return Text(
//                  snapshot.error.toString(),
//                  style: TextStyle(color: Colors.red),
//                );
//              }
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            },
//          ),
        ),
      ),
    );
  }
}
