import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleAppBar extends StatefulWidget implements PreferredSizeWidget{
  @override
  final Size preferredSize;
  final void Function() onPressed;

  SimpleAppBar({
    this.onPressed  
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  _SimpleAppBarState createState() => _SimpleAppBarState();
}

class _SimpleAppBarState extends State<SimpleAppBar> {
  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: IconButton(
        padding: EdgeInsets.only(
          left: Sizes.dp14(context),
          top: Sizes.dp14(context),
        ),
        icon: Icon(Icons.arrow_back_ios),
        iconSize: Sizes.dp25(context),
        color: Colors.blue[400],
        onPressed: widget.onPressed == null ? (){} : widget.onPressed
      ),
    );
  }
}