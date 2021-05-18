import 'package:bloc_modul/bloc.dart';
import 'package:diantaraja_mobile/ui/cart/cart.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:network/network.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardListShop extends StatelessWidget {
  final Product product;

  const CardListShop({
    Key key, 
    @required this.product
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigation.intent(context, CartPage());
      },
      child: Container(
        padding: EdgeInsets.all(Sizes.dp4(context)),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(Sizes.dp6(context)),
              child: CardProductHeader(
                imageUrl: this.product.brandImage,
                productName: this.product.productName,
                productPrice: this.product.productPrice.toString(),
              )
            ),
            SizedBox(
              height: Sizes.dp4(context),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.all(Sizes.dp4(context)),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300],
                  ),
                  borderRadius: BorderRadius.circular(25.0)
                ),
                child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    return Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                            bottom: Sizes.dp28(context),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.network(
                              this.product.productImage,
                            ),
                          ),
                        ),
                        Positioned(
                          width: constraints.maxWidth,
                          height: Sizes.dp30(context),
                          bottom: 0,
                          child: CardProductButton(
                            'Beli',
                            backgroundColor: Colors.blue[400],
                            textColor: Colors.white,
                            product: this.product,
                          )
                        ),
                      ],
                    );
                  }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardProductHeader extends StatelessWidget{
  final String imageUrl;
  final String productName;
  final String productPrice;

  CardProductHeader({
    @required this.imageUrl,
    @required this.productName,
    @required this.productPrice,
  });

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.network(
            this.imageUrl,
            fit: BoxFit.cover,
            width: Sizes.width(context) / 10,
            height: Sizes.width(context) / 10,
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
                this.productName,
                style: TextStyle(fontSize: Sizes.dp14(context), fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
              Text(
                this.productPrice,
                style: TextStyle(color: Colors.grey, fontSize: Sizes.dp12(context), fontFamily: 'Montserrat',),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CardProductButton extends StatefulWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Product product;

  const CardProductButton(this.text, {
    Key key,
    @required this.product,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  @override
  _CardProductButtonState createState() => _CardProductButtonState();
}

class _CardProductButtonState extends State<CardProductButton>{
  CheckoutProduct _cartProduct;
  TextEditingController _controller;
  int _quantity = -1;
  
  @override
  void initState() {
    super.initState();
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
    _controller = new TextEditingController(text: _quantity == -1 ? "0" : _quantity.toString());
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context){
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state){
        if(state is CartFetchProductQuantitySuccessState && state.quantity > 0){
          _quantity = state.quantity;
          _controller.text = _quantity.toString();
        }
        if(_quantity == -1){
          return OutlinedButton(
            onPressed: (){
              setState(() {
                BlocProvider.of<CartBloc>(context)
                  ..add(CartAddProduct(product: _cartProduct))
                  ..add(CartFetchProductQuantity(product: _cartProduct))
                  ..add(CartFetchTotalCartQuantity());
              });
            }, 
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                this.widget.backgroundColor
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                ),
              ),
            ),
            child: Text(
              this.widget.text,
              style: TextStyle(
                fontSize: Sizes.dp14(context), 
                fontFamily: 'Montserrat', 
                fontWeight: FontWeight.bold,
                color: this.widget.textColor,
              ),
            ),
          );
        }
        return OutlinedButton(
          onPressed: (){}, 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.white
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: (){
                  setState(() {
                    BlocProvider.of<CartBloc>(context)
                      ..add(CartRemoveProduct(product: _cartProduct))
                      ..add(CartFetchProductQuantity(product: _cartProduct))
                      ..add(CartFetchTotalCartQuantity());
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
                      ..add(CartFetchProductQuantity(product: _cartProduct))
                      ..add(CartFetchTotalCartQuantity());
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
        );
      }
    );
  }
}