import 'package:bloc/bloc/home/list_product_bloc.dart';
import 'package:diantaraja_mobile/widget/card/card_product_search.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:diantaraja_mobile/widget/app_bar/app_bar_home.dart';
import 'package:network/model/list_product.dart';
import 'package:network/network.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final bloc_product = ListProductBloc();

  @override
  void initState() {
    super.initState();
    bloc_product.fetchAllReview();
  }


  @override
  void dispose() {
    bloc_product.fetchAllReview();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: StreamBuilder(
          stream: bloc_product.allProduct,
          builder: (context, AsyncSnapshot<ListProduct> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.listProduct.length,
                itemBuilder: (context, index) {
                  return CardProductSearch(
                    product: snapshot.data.listProduct[index]
                  );
                }
              );
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.red),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
