import 'package:bloc_modul/bloc.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/ui/cart/delivery.dart';
import 'package:diantaraja_mobile/widget/card/card_list_checkout.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CartPage extends StatelessWidget {
  final CartBloc _cartBloc = new CartBloc();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          'Keranjang',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        backgroundColor:Colors.blue[400]
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: Sizes.dp28(context),
          left: Sizes.dp28(context),
          right: Sizes.dp28(context)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Ringkasan Belanja',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Sizes.dp18(context),
                color: Colors.grey[700],
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: Sizes.dp14(context)),
            Container(
              padding: EdgeInsets.all(Sizes.dp12(context)),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300],
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: Sizes.dp8(context),
                  ),
                  ...generateProduct(context, _cartBloc),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: Sizes.dp14(context),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        width: Sizes.dp28(context),
                      ),
                      Text(
                        'Rp ' + _cartBloc.totalPrice().toString() + ',-',
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
                  ),
                ],
              )
            ),
            SizedBox(height: Sizes.dp14(context)),
            Text(
              'Informasi Pembayaran',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Sizes.dp18(context),
                color: Colors.grey[700],
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: Sizes.dp14(context)),
            Container(
              padding: EdgeInsets.all(Sizes.dp20(context)),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300],
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Text(
                'Pembayaran dapat dilakukan melalui nomor rekening berikut: \n\n' + 
                'BCA: 123456\n' + 
                'Mandiri: 123'
              )
            ),
            SizedBox(height: Sizes.dp14(context)),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                color: Colors.blue[400],
                onPressed: (){
                  var _repository = new CheckoutRepository();
                  _repository.addCheckout(new Checkout(
                    totalPrice: _cartBloc.totalPrice(),
                    checkoutProducts: _cartBloc.getProduct
                  ))
                  .then(
                    (res) => Navigation.intentWithoutBack(context, DeliveryPage())
                  )
                  .catchError((ex){
                    if(ex is ApiException){
                      Alert(
                        context: context,
                        type: AlertType.warning,
                        title: "Error",
                        desc: ex.message
                      ).show();
                    }
                  });
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 12.0, 0, 12.0),
                  child: Text(
                    "Lanjutkan",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.dp16(context),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> generateProduct(BuildContext context, CartBloc cartBloc){
    List<Widget> widgetList = [];
    for(CheckoutProduct cartProduct in _cartBloc.getProduct){
      if(cartProduct.productQuantity > 0){
        widgetList.add(new CardListCheckout(cartProduct, cartBloc));
        widgetList.add(SizedBox(height: Sizes.dp8(context)));
      }
    }
    return widgetList;
  }
}
