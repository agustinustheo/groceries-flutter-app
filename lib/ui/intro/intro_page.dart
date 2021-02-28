import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/colors.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';
import 'package:diantaraja_mobile/ui/dashboard/dashboard_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

final List<String> imgList = [
  StringImageAsset.introImage,
  StringImageAsset.introImage,
  StringImageAsset.introImage,
  StringImageAsset.introImage,
];

final List child = map<Widget>(
  imgList,
  (index, i) {
    return Container(
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Image.asset(i, fit: BoxFit.cover),
    );
  },
).toList();

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _current = 0;

  // request permission for location
  void _getPermission(BuildContext context) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result =
    await _permissionHandler.requestPermissions([PermissionGroup.location]);

    if (result[PermissionGroup.location] == PermissionStatus.granted) {
      Navigation.intentWithoutBack(context, DashBoardPage());
    } else if (result[PermissionGroup.location] == PermissionStatus.denied) {
      Alert(
        context: context,
        type: AlertType.info,
        title: "Permission",
        desc: "You need accepted permission for access maps",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(
                  color: Colors.white, fontSize: 20),
            ),
            onPressed: (){
              PermissionHandler().openAppSettings().then((bool hasOpened) =>
                debugPrint('App Settings opened: ' + hasOpened.toString()));
            },
            width: 120,
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: buttonDemo(),
        ),
      ),
    );
  }

  Widget buttonDemo() {
    final basicSlider = CarouselSlider(
      items: child,
      scrollPhysics: ClampingScrollPhysics(),
      enableInfiniteScroll: false,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 1.0,
      initialPage: 0,
      onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },
    );
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(0, 40, 0,0),
        child: Stack(
          children: <Widget>[
            basicSlider,
            Positioned(
                top: 100.0,
                left: 0.0,
                right: 0.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      width: Sizes.dp8(context),
                      height: Sizes.dp8(context),
                      margin: EdgeInsets.symmetric(vertical: 300.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorPalette.borderBlue),
                          color: _current == index ? ColorPalette.borderBlue : Colors.white),
                    );
                  }),
                )),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 40),
              width: Sizes.width(context) / 1.5,
              child: Text("Cara pemakai'an Diantar aja akan ditulis disini",
              style: TextStyle(color: ColorPalette.textGrey,fontSize: Sizes.dp14(context),fontWeight: FontWeight.normal, fontFamily: 'Quicksand'),
              textAlign: TextAlign.center,),),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Flexible(
          child: FlatButton(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: ColorPalette.unActiveBorder, width: 3),
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: Colors.white,
            onPressed: () =>  _getPermission(context),
            child: Container(
                width: Sizes.width(context) / 3,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Center(
                    child: Text(
                  'Lewatkan',
                  style: TextStyle(color: ColorPalette.textGrey, fontSize: Sizes.dp14(context),fontWeight: FontWeight.normal, fontFamily: 'Quicksand'),
                ),),),
          ),
        ),
        SizedBox(
          width: Sizes.dp16(context),
        ),
        Flexible(
          child: FlatButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            color: ColorPalette.backgroundButtonRed,
            onPressed: () => _current != 3 ? basicSlider.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear) : _getPermission(context),
            child: Container(
              width: Sizes.width(context) / 3,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Center(
                child: Text(
                  'Lanjut',
                  style: TextStyle(color: ColorPalette.backgroundWhite, fontSize: Sizes.dp14(context),fontWeight: FontWeight.normal, fontFamily: 'Quicksand'),
                ),),),
          ),
        ),
      ]),
    ]);
  }
}
