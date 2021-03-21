import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/ui/dashboard/dashboard_page.dart';
import 'package:diantaraja_mobile/widget/button/custom_button.dart';
import 'package:diantaraja_mobile/widget/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}
class _StartPageState extends State<StartPage> {
  // Maps
  Completer<GoogleMapController> _controller = Completer();
  LocationData _currentLocation;
  var _location = new Location();
  static LatLng _initialPosition;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<LatLng> _getStartingLocation() async {
    _currentLocation = await _location.getLocation();
    return LatLng(_currentLocation.latitude, _currentLocation.longitude);
  }

  @override
  void initState() {
    super.initState();
    _getStartingLocation().then((value) {
      setState(() {
        _initialPosition = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: Sizes.dp72(context),
              width: Sizes.dp72(context),
              child: Image.asset(StringImageAsset.logo)
            ),
            SizedBox(height: Sizes.dp36(context)),
            SizedBox(
              width: Sizes.dp72(context),
              child: MontserratText(
                'Saat ini layanan hanya tersedia untuk daerah rumah saya',
                textAlign: TextAlign.center,
                fontSize: Sizes.dp14(context),
                textColor: Colors.blue[400],
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: Sizes.dp18(context)),
            SizedBox(
              width: Sizes.dp72(context),
              child: MontserratText(
                'Jarak kamu: 2,4 KM',
                textAlign: TextAlign.center,
                fontSize: Sizes.dp20(context),
                textColor: Colors.blue[400],
                fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: Sizes.dp25(context)),
            FullFlatButton(
              backgroundColor: Colors.blue[400],
              margin: EdgeInsets.only(
                left: Sizes.dp16(context),
                top: Sizes.dp16(context),
                right: Sizes.dp16(context)
              ),
              child: MontserratText(
                "LANJUT",
                textColor: Colors.white,
                fontSize: Sizes.dp20(context),
                fontWeight: FontWeight.bold,
              ),
              onPressed: () {
                Navigation.intentWithoutBack(context, DashBoardPage());
              },
            ),
          ],
        ),
      ),
    );
  }
}
