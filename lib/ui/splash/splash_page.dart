import 'dart:async';

import 'package:diantaraja_mobile/ui/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, goToHome);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void goToHome() {
    Navigation.intentWithoutBack(context, DashBoardPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getSplashScreen(),
    );
  }

  getSplashScreen() {
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
