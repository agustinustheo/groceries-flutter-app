import 'package:bloc_modul/bloc.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:network/model/list_product.dart';
import 'package:network/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardProductSearch extends StatefulWidget {
  final Product product;
  const CardProductSearch({Key key, this.product}) : super(key: key);

  @override
  _CardProductSearchState createState() => _CardProductSearchState();
}

class _CardProductSearchState extends State<CardProductSearch> {
  CheckoutProduct _cartProduct;
  TextEditingController _controller;
  String _productId;
  
  @override
  void initState() {
    super.initState();
    _productId = widget.product.productID;
    _cartProduct = new CheckoutProduct(
      widget.product.productID,
      widget.product.productCode,
      widget.product.productBarcode,
      widget.product.productName,
      widget.product.productType,
      widget.product.productUnit,
      widget.product.productPrice,
      widget.product.productImage
    );
    _controller = new TextEditingController(text: "0");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartProductBloc>(context)
      ..add(CartProductFetchData(product: _cartProduct));
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.dp16(context)),
      padding: EdgeInsets.all(Sizes.dp12(context)),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[300],
        ),
        borderRadius: BorderRadius.circular(15.0)
      ),
      child: BlocBuilder<CartProductBloc, CartProductState>(
        builder: (context, state){
          if(state is CartProductFetchDataSuccessState){
            if(_productId == state.product.productID){
              _controller.text = state.productQuantity.toString();
            }
          }

          return Column(
              children: <Widget>[
                SizedBox(
                  height: Sizes.dp8(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25.0),
                      child: Image.network(
                        widget.product.productImage,
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
                            widget.product.productName,
                            style: TextStyle(
                              fontSize: Sizes.dp14(context),
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '1 ' + widget.product.productUnit,
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
                      'Rp ' + widget.product.productPrice.toString() + ',-',
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
                SizedBox(
                  height: Sizes.dp8(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        setState(() {
                          BlocProvider.of<CartBloc>(context)
                            ..add(CartRemoveProduct(product: _cartProduct))
                            ..add(CartFetchData());

                          BlocProvider.of<CartProductBloc>(context)
                            ..add(CartProductFetchData(product: _cartProduct));
                        });
                      },
                      child: Container(
                        width: Sizes.dp24(context),
                        height: Sizes.dp24(context),
                        decoration: BoxDecoration(
                          color: Colors.red[400],
                          shape: BoxShape.circle
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "-",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.dp20(context),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Sizes.dp4(context),
                    ),
                    Container(
                      width: Sizes.dp28(context),
                      child: TextField(
                        controller: _controller,
                        textAlign: TextAlign.center,
                        maxLength: 3,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: "",
                          isDense: true
                        ),                                 
                        style: TextStyle(
                          fontSize: Sizes.dp12(context)                
                        )
                      ),
                    ),
                    SizedBox(
                      width: Sizes.dp4(context),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          BlocProvider.of<CartBloc>(context)
                            ..add(CartAddProduct(product: _cartProduct))
                            ..add(CartFetchData());

                          BlocProvider.of<CartProductBloc>(context)
                            ..add(CartProductFetchData(product: _cartProduct));
                        });
                      },
                      child: Container(
                        width: Sizes.dp24(context),
                        height: Sizes.dp24(context),
                        decoration: BoxDecoration(
                          color: Colors.green[400],
                          shape: BoxShape.circle
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "+",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Sizes.dp20(context),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
        }
      )
    );
  }
}

