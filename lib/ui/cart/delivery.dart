import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';

class DeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          'Pesanan Selesai',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ), 
        backgroundColor:Colors.blue[400]
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: Sizes.width(context) / 1.8,
              child: Text(
                'Selamat!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.dp25(context),
                  color: Colors.blue[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: Sizes.dp4(context)),
            SizedBox(
              height: Sizes.width(context) / 1.8,
              width: Sizes.width(context) / 1.8,
              child: Image.asset(StringImageAsset.delivery)
            ),
            SizedBox(height: Sizes.dp4(context)),
            SizedBox(
              width: Sizes.width(context) / 1.8,
              child: Text(
                'Pesananmu akan segera diproses. Sekarang, kamu hanya perlu menunggu dengan di rumah aja~',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.dp14(context),
                  color: Colors.blue[400],
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            SizedBox(height: Sizes.dp25(context)),
            SizedBox(
              width: Sizes.width(context) / 1.8,
              child: FlatButton(
                color: Colors.blue[400],
                onPressed: () {
                  Navigation.intentWithoutBack(context, null);
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Text(
                    "Belanja lagi",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.dp16(context),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
