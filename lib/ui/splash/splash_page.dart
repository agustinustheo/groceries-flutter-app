import 'dart:async';
import 'package:diantaraja_mobile/ui/intro/start_page.dart';
import 'package:diantaraja_mobile/ui/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';
import 'package:bloc_modul/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime(void Function() f) async {
    var _duration = Duration(seconds: 1);
    return Timer(_duration, f);
  }

  void checkAuth() async{
    var _repository = new CustomerRepository();
    await _repository.checkAuth();
    // BlocProvider.of<SessionBloc>(context).add(SessionFetchData());
  }

  void goToHome() {
    Navigation.intentWithoutBack(context, StartPage());
  }

  void goToLogin() {
    Navigation.intentWithoutBack(context, LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SessionBloc(repository: SessionRepository())..add(SessionFetchData()),
      child: Scaffold(
        body: BlocConsumer<SessionBloc, SessionState>(
          listener: (context,state){},
          builder: (context,state){
            if(state is SessionFetchSuccessState){
              startTime(goToHome);
            }else if(state is SessionFetchFailedState){
              startTime(goToLogin);
            }
            checkAuth();
            return getSplashScreen();
          },
        ),
      ),
    );
  }

  Widget getSplashScreen() {
    return Stack(
      children: <Widget>[
        Center(
          child: SizedBox(
            height: Sizes.width(context) / 2.5,
            width: Sizes.width(context) / 2.5,
            child: Image.asset(StringImageAsset.logo)
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'v.1.0',
              style: TextStyle(
                fontSize: Sizes.dp16(context),
                color: Colors.blue,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                letterSpacing: 3
              ),
            ),
          ),
        ),
      ],
    );
  }
}
