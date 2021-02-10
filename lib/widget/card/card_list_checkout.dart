import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';

class CardListCheckout extends StatelessWidget{
  final CartProduct cartProduct;
  final CartBloc cartBloc;

  const CardListCheckout(this.cartProduct, this.cartBloc);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.network(
            cartProduct.productImage,
            fit: BoxFit.cover,
            width: Sizes.width(context) / 8,
            height: Sizes.width(context) / 8,
          ),
        ),
        SizedBox(
          width: Sizes.dp12(context),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                cartProduct.itemName,
                style: TextStyle(
                  fontSize: Sizes.dp14(context),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                cartBloc.itemQuantity(cartProduct).toString() + ' ' + cartProduct.itemUnit,
                style: TextStyle(
                  fontSize: Sizes.dp12(context),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: Colors.grey
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Text(
          'Rp ' + cartBloc.itemPrice(cartProduct).toString() + ',-',
          style: TextStyle(
            fontSize: Sizes.dp12(context),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: Colors.blue[400]
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}