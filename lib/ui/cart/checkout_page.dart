import 'package:bloc_modul/bloc.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/ui/cart/delivery_page.dart';
import 'package:diantaraja_mobile/widget/button/custom_button.dart';
import 'package:diantaraja_mobile/widget/card/card_list_checkout.dart';
import 'package:diantaraja_mobile/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CheckoutProduct> products = List<CheckoutProduct>();
  int totalPrice = -1;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context)
      ..add(CartFetchData());
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          'Checkout',
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
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state){
            if(state is CartFetchSuccessState){
              products = state.productList;
            }
            if(state is CartFetchSuccessState){
              totalPrice = state.totalPrice;
            }

            return Column(
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
                      ...generateProduct(context, this.products),
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
                            'Rp ' + (this.totalPrice == -1 ? "0" : this.totalPrice.toString()) + ',-',
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
                FullFlatButton(
                  backgroundColor: Colors.blue[400],
                  onPressed: (){
                    var _repository = new CheckoutRepository();
                    _repository.addCheckout(new Checkout(
                      customerNote: "",
                      paymentMethodType: "Bank Transfer",
                      totalPrice: this.totalPrice,
                      checkoutProducts: this.products
                    ))
                    .then(
                      (res){
                        BlocProvider.of<CartBloc>(context).add(CartRemoveAllProduct());
                        Navigation.intentWithoutBack(context, DeliveryPage());
                      }
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
                  child: MontserratText(
                    "Lanjutkan",
                    textAlign: TextAlign.center,
                    textColor: Colors.white,
                    fontSize: Sizes.dp16(context),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  List<Widget> generateProduct(BuildContext context, List<CheckoutProduct> checkoutProduct){
    List<Widget> widgetList = [];
    for(CheckoutProduct cartProduct in checkoutProduct){
      if(cartProduct.productQuantity > 0){
        widgetList.add(new CardListCheckout(cartProduct));
        widgetList.add(SizedBox(height: Sizes.dp8(context)));
      }
    }
    return widgetList;
  }
}
