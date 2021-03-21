import 'package:diantaraja_mobile/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/ui/splash/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiantarAja Apps',
      theme: ThemeData(
        primarySwatch: ColorPalette.primaryThemeSwatch,
      ),
      home: SplashPage(),
    );
  }
}