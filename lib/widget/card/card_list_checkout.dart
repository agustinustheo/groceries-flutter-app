import 'package:bloc_modul/bloc.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:network/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListCheckout extends StatelessWidget{
  final CheckoutProduct cartProduct;

  const CardListCheckout(this.cartProduct);

  @override
  Widget build(BuildContext context) {
    int _productQuantity = -1;
    int _productPrice = -1;
    return BlocBuilder<CartProductBloc, CartProductState>(
      builder: (context, state){
        if(state is CartProductFetchDataSuccessState){
          _productQuantity = state.productQuantity;
          _productPrice = state.productPrice;
        }
        if(_productQuantity == -1 || _productPrice == -1){
          return CircularProgressIndicator();
        }

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
                    cartProduct.productName,
                    style: TextStyle(
                      fontSize: Sizes.dp14(context),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    _productQuantity.toString() + ' ' + cartProduct.productUnit,
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
              'Rp ' + _productPrice.toString() + ',-',
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
    );
  }
}