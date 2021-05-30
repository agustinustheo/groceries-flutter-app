import 'package:bloc_modul/bloc/cart/cart_bloc.dart';
import 'package:bloc_modul/bloc/home/list_product_bloc.dart';
import 'package:diantaraja_mobile/widget/button/custom_button.dart';
import 'package:diantaraja_mobile/widget/card/card_pop_up_checkout.dart';
import 'package:diantaraja_mobile/widget/card/card_product_search.dart';
import 'package:diantaraja_mobile/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/widget/app_bar/app_bar_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  Widget showPopUp(){
    return CheckoutPopUpCard(
      widget: SizedFlatButton(
        backgroundColor: Colors.blue[400],
        child: MontserratText(
          "Lanjutkan",
          textAlign: TextAlign.center,
          textColor: Colors.white,
          fontSize: Sizes.dp16(context),
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context)
      ..add(CartFetchData());
    return Stack(
      children: [
        Scaffold(
          appBar: CustomAppBar(
            titleText: 'Cart',
            isHomePage: false,
            addBackButton: true,
          ),
          backgroundColor: Colors.white,
          body: BlocBuilder<CartBloc, CartState>(
            builder: (context, state){
              bool exists = false;
              if(state is CartFetchSuccessState){
                exists = state.totalQuantity > 0;
              }
              return Container(
                padding: EdgeInsets.only(
                  left: Sizes.dp28(context),
                  top: Sizes.dp10(context),
                  right: Sizes.dp28(context),
                  bottom: exists ? Sizes.dp54(context) : 0,
                ),
                child: BlocBuilder<ListProductBloc, ListProductState>(
                  builder: (context,state){
                    if(state is ListProductFetchSuccessState){
                      return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: state.listProduct.listProduct.length,
                        itemBuilder: (context, index) {
                          return CardProductSearch(
                            product: state.listProduct.listProduct[index]
                          );
                        }
                      );
                    }else if(state is ListProductFetchFailedState){
                      return Text(
                        "Error fetch data",
                        style: TextStyle(color: Colors.red),
                      );
                    }else{
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              );
            }
          ),
        ),
        Positioned(
          bottom: 0,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state){
              bool exists = false;
              if(state is CartFetchSuccessState){
                exists = state.totalQuantity > 0;
              }
              if(exists){
                return showPopUp();
              }
              return Container();
            }
          ),
        ),          
      ],
    );
  }
}
