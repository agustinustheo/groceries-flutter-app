import 'package:bloc_modul/bloc/cart/cart_bloc.dart';
import 'package:bloc_modul/bloc/home/list_product_bloc.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/ui/cart/checkout_page.dart';
import 'package:diantaraja_mobile/widget/button/custom_button.dart';
import 'package:diantaraja_mobile/widget/card/card_pop_up_checkout.dart';
import 'package:diantaraja_mobile/widget/card/card_product_search.dart';
import 'package:diantaraja_mobile/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/widget/app_bar/app_bar_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool _exists = false;

  Widget showPopUp(int _totalPrice){
    return CheckoutPopUpCard(
      totalPrice: _totalPrice,
      widget: SizedFlatButton(
        onPressed: (){
          Navigation.intent(context, CheckoutPage());
        },
        backgroundColor: Colors.blue[400],
        child: MontserratText(
          "Checkout",
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
    int _totalPrice = -1;
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
          body: SingleChildScrollView(
            padding: EdgeInsets.only(
              left: Sizes.dp28(context),
              top: Sizes.dp22(context),
              right: Sizes.dp28(context),
            ),
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MontserratText(
                  'Ringkasan Belanja',
                  textAlign: TextAlign.center,
                  fontSize: Sizes.dp18(context),
                  textColor: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: Sizes.dp14(context)),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: _exists ? Sizes.dp54(context) : 0,
                  ),
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state){
                      if(state is CartFetchSuccessState){
                        _exists = state.totalQuantity > 0;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.productList.length,
                          itemBuilder: (context, index) {
                            if(state.productList[index].productQuantity > 0){
                              return CardProductSearch(
                                product: state.productList[index]
                              );
                            }
                            return Container();
                          }
                        );
                      }
                      else if(state is ListProductFetchFailedState){
                        return Text(
                          "Error fetch data",
                          style: TextStyle(color: Colors.red),
                        );
                      }
                      else{
                        return Center(child: CircularProgressIndicator());
                      }
                    }
                  ),
                ),
              ]
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state){
              bool exists = false;
              if(state is CartFetchSuccessState){
                _totalPrice = state.totalPrice;
                exists = state.totalQuantity > 0;
              }
              if(exists){
                return showPopUp(_totalPrice);
              }
              return Container();
            }
          ),
        ),          
      ],
    );
  }
}
