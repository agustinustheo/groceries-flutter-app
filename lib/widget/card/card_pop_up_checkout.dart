import 'package:bloc_modul/bloc/cart/cart_bloc.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/widget/text/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutPopUpCard extends StatelessWidget{
  final CartBloc cartBloc;
  final Widget widget;

  CheckoutPopUpCard({
    @required this.cartBloc,
    this.widget
  });
  
  @override
  Widget build(BuildContext context){
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
        child: Row(
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
                  "Rp " + cartBloc.totalPrice().toString() + ",-",
                  textAlign: TextAlign.center,
                  textColor: Colors.blue[400],
                  fontSize: Sizes.dp16(context),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ],
            ),
            widget
          ],
        ),
      ),
    );
  }
}