import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/ui/cart/cart.dart';
import 'package:diantaraja_mobile/ui/home/products_page.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key key, this.addBackButton, this.appBarColor}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @required
  final bool addBackButton;

  @required
  final Color appBarColor;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar>{

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.appBarColor,
      automaticallyImplyLeading: widget.addBackButton,
      leading: IconButton(
        icon: widget.addBackButton ? Icon(Icons.arrow_back_ios_rounded) : Icon(Icons.menu),
        onPressed: (){
          if(Scaffold.of(context).hasDrawer){
            Scaffold.of(context).openDrawer();
          }
          else if(widget.addBackButton){
            Navigator.of(context).pop();
          }
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
      elevation: 0,
      actions: <Widget>[
        InkWell(
          onTap: () {
            Navigation.intent(context, ProductsPage());
          },
          child: Container(
            margin: EdgeInsets.only(right: Sizes.dp25(context)),
            padding: EdgeInsets.all(4.0),
            child: Row(
              children: <Widget>[
                Wrap(
                  alignment: WrapAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.white
                        ),
                      ),
                      child: Container(
                        height: Sizes.width(context) / 13,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(4.0),
                        width: Sizes.width(context) / 2,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 4.0, left: 6.0),
                              alignment: Alignment.center,
                              child: Icon(Icons.search, size : 14.0, color: Colors.grey,),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 6.0),
                              alignment: Alignment.center,
                              child: Text('Mau belanja apa hari ini?',
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigation.intent(context, CartPage());
          },
          child: Container(
            margin: EdgeInsets.only(right: Sizes.dp14(context)),
            alignment: Alignment.center,
            child: Icon(
              Icons.shopping_cart, 
              color: Colors.white,
              size: Sizes.dp22(context)
            ),
          ),
        ),
        InkWell(
          onTap: () {

          },
          child: Container(
            margin: EdgeInsets.only(right: Sizes.dp25(context)),
            alignment: Alignment.center,
            child: Icon(
              Icons.notifications, 
              color: Colors.white,
              size: Sizes.dp22(context)
            ),
          ),
        ),
      ],
    );
  }
}