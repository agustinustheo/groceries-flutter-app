import 'dart:io';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/ui/home/home_page.dart';
import 'package:diantaraja_mobile/ui/auth/login_page.dart';
import 'package:diantaraja_mobile/widget/alert_dialog/pop_up_alert.dart';
import 'package:diantaraja_mobile/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:bloc_modul/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
    return BlocProvider(
      create: (_) => SessionBloc(repository: SessionRepository())..add(SessionFetchData()),
      child: BlocConsumer<SessionBloc, SessionState>(
        listener: (context,state){
          if(state is SessionFetchFailedState){
            Navigation.intentWithoutBack(context, LoginPage());
          }
        },
        builder: (context,state){
          return mainWidget(context);
        },
      ),
    );
  }

  Widget mainWidget(BuildContext context){
    return WillPopScope(
      onWillPop: () {
        CartBloc _cartBloc = new CartBloc();
        if(_cartBloc.totalProductQuantity() > 0){
          return showAlert(
            context: context,
            alertType: AlertType.warning,
            title: "Warning",
            desc: "You have " + _cartBloc.totalProductQuantity().toString() + " products in your cart.\nAre you sure want to exit?",
            dialogs: [
              DialogButton(
                child: MontserratText(
                  "No",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                onPressed: () => Navigator.of(context).pop(),
                width: 120,
              ),
              DialogButton(
                child: MontserratText(
                  "Yes",
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                onPressed: () => exit(0),
                width: 120,
              )
            ],
          );
        }
        else{
          exit(0);
        }
      },
      child: Scaffold(
        body: _list[_page],
      ),
    );
  }
}