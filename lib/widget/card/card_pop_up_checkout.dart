import 'package:bloc_modul/bloc/cart/cart_bloc.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/widget/text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_modul/bloc.dart';

class CheckoutPopUpCard extends StatefulWidget {
  final Widget widget;
  const CheckoutPopUpCard({Key key, this.widget}) : super(key: key);

  @override
  _CheckoutPopUpCardState createState() => _CheckoutPopUpCardState();
}

class _CheckoutPopUpCardState extends State<CheckoutPopUpCard> {  
  int totalPrice = -1;
  @override
  Widget build(BuildContext context){
    BlocProvider.of<CartBloc>(context)
      ..add(CartFetchTotalPrice());
    return Positioned(
      bottom: 0,
      child: Container(
        width: Sizes.width(context),
        height: Sizes.dp54(context),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              Sizes.dp20(context)
            ),
            topRight: Radius.circular(
              Sizes.dp20(context)
            )
          )
        ),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state){
            if(state is CartFetchTotalPriceSuccessState){
              totalPrice = state.totalPrice;
            }
            if(totalPrice == -1){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MontserratText(
                      "Total Pembayaran",
                      textAlign: TextAlign.center,
                      textColor: Colors.black,
                      fontSize: Sizes.dp16(context),
                      fontWeight: FontWeight.bold,
                    ),
                    MontserratText(
                      "Rp " + totalPrice.toString() + ",-",
                      textAlign: TextAlign.center,
                      textColor: Colors.blue[400],
                      fontSize: Sizes.dp16(context),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ],
                ),
                this.widget.widget
              ],
            );
          }
        ),
      ),
    );
  }
}