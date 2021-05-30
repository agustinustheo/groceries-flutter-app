import 'package:bloc_modul/bloc.dart';
import 'package:bloc_modul/bloc/cart/cart_bloc.dart';
import 'package:diantaraja_mobile/widget/app_bar/app_bar_home.dart';
import 'package:diantaraja_mobile/widget/button/custom_button.dart';
import 'package:diantaraja_mobile/widget/card/card_detail_product_pop_up.dart';
import 'package:diantaraja_mobile/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/network.dart';

class DetailProductsPage extends StatefulWidget {
  final Product product;
  const DetailProductsPage({Key key, @required this.product}) : super(key: key);

  @override
  _DetailProductsPageState createState() => _DetailProductsPageState();
}

class _DetailProductsPageState extends State<DetailProductsPage> {
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
  
  Widget showPopUp(){
    return DetailProductPopUpCard(
      checkoutProduct: _cartProduct,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          InkWell(
            onTap: (){
              BlocProvider.of<CartBloc>(context)
                ..add(CartRemoveProduct(product: _cartProduct))
                ..add(CartFetchData());

              BlocProvider.of<CartProductBloc>(context)
                ..add(CartProductFetchData(product: _cartProduct));
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
                  MontserratText(
                    "-",
                    textColor: Colors.white,
                    fontSize: Sizes.dp20(context),
                    fontWeight: FontWeight.w700,
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
              BlocProvider.of<CartBloc>(context)
                ..add(CartAddProduct(product: _cartProduct))
                ..add(CartFetchData());

              BlocProvider.of<CartProductBloc>(context)
                ..add(CartProductFetchData(product: _cartProduct));
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
                  MontserratText(
                    "+",
                    textColor: Colors.white,
                    fontSize: Sizes.dp20(context),
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartProductBloc>(context)
      ..add(CartProductFetchData(product: _cartProduct));
    return Scaffold(
      appBar: CustomAppBar(
        titleText: 'Detail Product',
        isHomePage: false,
        addBackButton: true,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state){
              bool exists = false;
              if(state is CartFetchSuccessState){
                exists = state.totalQuantity > 0;
              }
              return Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: Sizes.dp28(context),
                  top: Sizes.dp10(context),
                  right: Sizes.dp28(context),
                  bottom: exists ? Sizes.dp54(context) : 0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(
                          this.widget.product.productImage,
                          height: Sizes.dp94(context),
                        ),
                      ),
                    ),
                    MontserratText(
                      this.widget.product.productName,
                      textColor: Colors.blue[400],
                      fontSize: Sizes.dp24(context),
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: Sizes.dp8(context)),
                    MontserratText(
                      'Rp'+this.widget.product.productPrice.toString()+',-/'+this.widget.product.productUnit,
                      textColor: Colors.blue[400],
                      fontSize: Sizes.dp16(context),
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(height: Sizes.dp14(context)),
                    MontserratText(
                      this.widget.product.productDescription,
                      textColor: Colors.grey,
                      fontSize: Sizes.dp16(context),
                    ),
                  ],
                ),
              );
            }
          ),
          Positioned(
            bottom: 0,
            child: BlocBuilder<CartProductBloc, CartProductState>(
              builder: (context, state){
                bool exists = false;
                if(state is CartProductFetchDataSuccessState){
                  if(_productId == state.product.productID){
                    _controller.text = state.productQuantity.toString();
                    exists = state.productQuantity > 0;
                  }
                }
                if(exists){
                  return showPopUp();
                }
                return FullFlatButton(
                  backgroundColor: Colors.blue[400],
                  margin: EdgeInsets.all(
                    Sizes.dp30(context),
                  ),
                  child: MontserratText(
                    "Beli",
                    textColor: Colors.white,
                    fontSize: Sizes.dp20(context),
                    fontWeight: FontWeight.bold,
                  ),
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context)
                      ..add(CartAddProduct(product: _cartProduct));
                    BlocProvider.of<CartProductBloc>(context)
                      ..add(CartProductFetchData(product: _cartProduct));
                  },
                );
              }
            ),
          ),          
        ],
      ),
    );
  }
}
