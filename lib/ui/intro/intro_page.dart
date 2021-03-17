import 'package:carousel_slider/carousel_slider.dart';
import 'package:diantaraja_mobile/common/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/colors.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';
import 'package:diantaraja_mobile/ui/dashboard/dashboard_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class IntroImageDescription{
  String imageString;
  String imageTitle;
  String imageDescription;

  IntroImageDescription(
    this.imageString,
    this.imageTitle,
    this.imageDescription
  );
}

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

final List<IntroImageDescription> imgList = [
  new IntroImageDescription(StringImageAsset.cukupTransfer, 'Cukup transfer!', 'Barang akan disiapkan dan diantar maksimal dalam 24 jam!'),
  new IntroImageDescription(StringImageAsset.gratisOngkir, 'Gratis Ongkir', 'Dengan jarak maksimum 5 km!'),
  new IntroImageDescription(StringImageAsset.diantarAja, '', 'Belanja kebutuhanmu sekarang, gak pake ribet!')
];

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int _current = 0;
  final _debouncer = Debouncer(milliseconds: 200);

  // request permission for location
  void _getPermission(BuildContext context) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result =
    await _permissionHandler.requestPermissions([PermissionGroup.location]);

    if (result[PermissionGroup.location] == PermissionStatus.denied) {
      Alert(
        context: context,
        type: AlertType.info,
        title: "Permission",
        desc: "You need to accept permission",
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
    _getPermission(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buttonDemo()
        ]
      )
    );
  }

  Widget carouselItems(dynamic i){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Container(
          child: Image.asset(
            i.imageString, 
            height: Sizes.dp80(context)
          ),
        ),
        Container(
          width: Sizes.dp72(context),
          padding: EdgeInsets.only(
            top: Sizes.dp10(context),
            left: Sizes.dp10(context),
            right: Sizes.dp10(context)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                i.imageTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.dp24(context),
                  color: Colors.blue[400],
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: Sizes.dp6(context)
              ),
              Text(
                i.imageDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.dp16(context),
                  color: Colors.blue[400],
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w600
                ),
              )
            ],
          )
        )
      ]
    );
  }

  Widget buttonDemo() {
    List child = map<Widget>(
      imgList,
      (index, i) {
        if(index + 1 == imgList.length){
          return GestureDetector(
            onHorizontalDragUpdate: (details){
              if (details.delta.dx < 0) {
                _debouncer.run(() =>
                  Navigation.intentWithoutBack(context, DashBoardPage())
                );
              }
            },
            child: carouselItems(i)
          );
        }
        else{
          return carouselItems(i);
        }
      },
    ).toList();
    
    return Column(
      children: [
        Container(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: child,
                scrollPhysics: ClampingScrollPhysics(),
                enableInfiniteScroll: false,
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: .9,
                aspectRatio: .8,
                initialPage: 0,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: Sizes.dp10(context)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(imgList, (index, url) {
                    return Container(
                      width: Sizes.dp14(context),
                      height: Sizes.dp14(context),
                      margin: EdgeInsets.symmetric(horizontal: Sizes.dp6(context)),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorPalette.borderBlue),
                        color: _current == index ? ColorPalette.borderBlue : Colors.white
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ]
    );
  }
}
