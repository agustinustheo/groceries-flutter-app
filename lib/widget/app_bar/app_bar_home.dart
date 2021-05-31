import 'package:bloc_modul/bloc.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/ui/cart/cart_page.dart';
import 'package:diantaraja_mobile/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/debouncer.dart';
import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({Key key, this.isHomePage, this.titleText, this.addBackButton})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  final bool isHomePage;
  final bool addBackButton;
  final Color appBarColor = Colors.blue[400];
  final String titleText;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _quantity = -1;
  final _debouncer = Debouncer(milliseconds: 500);

  Widget productBubble(BuildContext context){
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state){
        if(state is CartFetchSuccessState){
          _quantity = state.totalQuantity;
        }
        if(_quantity == -1 || _quantity == 0){
          return Container(
            width: Sizes.dp12(context),
            height: Sizes.dp12(context),
          );
        }
        return Container(
          width: Sizes.dp14(context),
          height: Sizes.dp14(context),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(100.0)
          ),
          child: Center(
            child: MontserratText(
              _quantity.toString(),
              fontSize: Sizes.dp8(context),
              textColor: Colors.white,
            ),
          ),
        );
      }
    );
  }

  Widget appBarTitle(){
    if(widget.isHomePage){
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          color: Colors.white,
          border: Border.all(color: Colors.white),
        ),
        child: Container(
          height: Sizes.width(context) / 13,
          width: Sizes.width(context) / 2,
          child: TextField(
            textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Cari ...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.blue[400],
                  ),
                  hintStyle: TextStyle(
                    fontSize: 14.5,
                    color: Colors.grey,
                  ),
              ),
            onChanged: (text) {
                _debouncer.run(() {
                  BlocProvider.of<ListProductBloc>(context)
                    .add(SearchData(text: text.toString()));
                  BlocProvider.of<CartBloc>(context)
                    .add(CartFetchData());
                }
              );
            },
          ),
        ),
      );
    }
    return Text(
      widget.titleText,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListProductBloc(repository: ProductRepository())
        ..add(SearchData(text: "")),
      child: AppBar(
        backgroundColor: widget.appBarColor,
        automaticallyImplyLeading: widget.addBackButton,
        leading: IconButton(
          icon: widget.addBackButton
              ? Icon(Icons.arrow_back_ios_rounded)
              : Icon(Icons.menu),
          onPressed: () {
            if (Scaffold.of(context).hasDrawer) {
              Scaffold.of(context).openDrawer();
            } else if (widget.addBackButton) {
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
        title: appBarTitle(),
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigation.intent(context, CartPage());
            },
            child: Container(
              margin: EdgeInsets.only(right: Sizes.dp14(context)),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Icon(
                    Icons.shopping_cart,
                    color: Colors.white, 
                    size: Sizes.dp22(context)
                  ),
                  Positioned(
                    right: 0,
                    child: productBubble(context),
                  ),
                ]
              ),
            ),
          ),
          InkWell(
            onTap: () {
              var _repository = new SessionRepository();
              _repository.destroySession().then((res) {
                BlocProvider.of<SessionBloc>(context).add(SessionFetchData());
              }).catchError((ex) {
                if (ex is ApiException) {
                  Alert(
                    context: context,
                    type: AlertType.warning,
                    title: "Error",
                    desc: ex.message
                  ).show();
                }
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: Sizes.dp25(context)),
              alignment: Alignment.center,
              child: Icon(Icons.logout,
                  color: Colors.white, size: Sizes.dp22(context)),
            ),
          ),
        ],
      ),
    );
  }
}
