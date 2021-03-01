import 'dart:io';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/ui/home/home_page.dart';
import 'package:diantaraja_mobile/ui/login/login_page.dart';
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
        return Alert(
          context: context,
          type: AlertType.warning,
          title: "Warning",
          desc: "Are you sure want to exit?",
          buttons: [
            DialogButton(
              child: Text(
                "No",
                style: TextStyle(
                    color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.of(context).pop(),
              width: 120,
            ),
            DialogButton(
              child: Text(
                "Yes",
                style: TextStyle(
                    color: Colors.white, fontSize: 20),
              ),
              onPressed: () => exit(0),
              width: 120,
            )
          ],
        ).show();
      },
      child: Scaffold(
        body: _list[_page],
      ),
    );
  }
}