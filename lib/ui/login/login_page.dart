import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/colors.dart';
import 'package:diantaraja_mobile/common/custom_icons.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';
import 'package:diantaraja_mobile/ui/intro/intro_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 32, 0, 32),
              child: SizedBox(
                height: Sizes.width(context) / 2.5,
                width: Sizes.width(context) / 2.5,
                child: Image.asset(StringImageAsset.logo)
              )
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: ColorPalette.textBlue,
                  fontSize: Sizes.dp18(context),
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Quicksand',
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(CustomIcons.user),
                  hintText: "Email / Number Phone",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.dp18(context),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Quicksand',
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPalette.activeBorder, width: 3.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPalette.unActiveBorder, width: 3.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: TextStyle(
                  color: ColorPalette.textBlue,
                  fontSize: Sizes.dp18(context),
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Quicksand',
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(CustomIcons.lock),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: Sizes.dp18(context),
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Quicksand',
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPalette.activeBorder, width: 3.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorPalette.unActiveBorder, width: 3.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 24),
              child: GestureDetector(
                onTap: (){},
                child: Center(
                  child: Text(
                    "Lupa Password",
                    style: TextStyle(color: ColorPalette.textLoginBlack, fontSize: Sizes.dp18(context), fontWeight: FontWeight.normal, fontFamily: 'Sukh'),
                  ),
                ),
              ),
            ),
            Container(
              width: Sizes.width(context)/1.7,
              padding: EdgeInsets.fromLTRB(16, 16, 16, 24),
              child: FlatButton(
                color: ColorPalette.backgroundDarkBlue,
                onPressed: () {
//                  Navigation.intentWithoutBack(context, IntroPageOne());
                  Navigation.intentWithoutBack(context, IntroPage());
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: Sizes.dp16(context), fontFamily: 'Sukh'),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
            SizedBox(height: Sizes.width(context) / 20),
            Padding(
              padding: EdgeInsets.fromLTRB(0,0,0,10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () => {},
                    color: ColorPalette.backgroundFB,
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      width: Sizes.width(context)/3.5,
                      child: Row( // Re
                        mainAxisAlignment: MainAxisAlignment.center,// place with a Row for horizontal icon + text
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0),
                            child: Image.asset(StringImageAsset.fbLogo, width: Sizes.dp18(context),height:Sizes.dp18(context) ,),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5,0,0,0),
                            child: Text("Facebook", style: TextStyle(color: Colors.white,fontSize: Sizes.dp16(context), fontFamily: 'Quicksand'),),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: Sizes.dp16(context),),
                  FlatButton(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color:ColorPalette.unActiveBorder,width: 3),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    onPressed: () => {},
                    color: Colors.white,
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      width: Sizes.width(context)/3.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,// Replace with a Row for horizontal icon + text
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0,0,0,0),
                            child: Image.asset(StringImageAsset.googleLogo, width: Sizes.dp18(context),height:Sizes.dp18(context) ,),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5,0,0,0),
                            child: Text("Google", style: TextStyle(color: ColorPalette.textGrey,fontFamily: 'Sukh', fontSize: Sizes.dp16(context)),),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 24),
              child: GestureDetector(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Sudah Daftar?",
                        style: TextStyle(color: ColorPalette.textLoginBlack, fontFamily: 'Sukh', fontSize: Sizes.dp18(context), fontWeight: FontWeight.normal),
                      ),
                      Text(
                        " Daftar sekarang!",
                        style: TextStyle(color: ColorPalette.textLoginBlue, fontFamily: 'Sukh', fontSize: Sizes.dp18(context), fontWeight: FontWeight.bold),
                      ),
                    ],

                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
