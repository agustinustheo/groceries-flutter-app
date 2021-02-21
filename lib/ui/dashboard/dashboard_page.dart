import 'dart:io';
import 'package:diantaraja_mobile/ui/cart/delivery.dart';
import 'package:diantaraja_mobile/ui/home/home_page.dart';
import 'package:diantaraja_mobile/ui/home/products_page.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/widget/alert_dialog/pop_up_exit_apps.dart';

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> with TickerProviderStateMixin {
  int _page = 0;

  final List<Widget> _list = [
    HomePage(),
  ];


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return PopUp(
                content: "Are you sure want to exit?",
                cancelText: "No",
                acceptText: "Yes",
                onTapCancel: () => Navigator.of(context).pop(),
                onTapAccept: () => exit(0),
              );
            }
        );
      },
      child: Scaffold(
        body: _list[_page],
      ),
    );
  }
}