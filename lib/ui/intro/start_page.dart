import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/ui/dashboard/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';
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
              height: Sizes.width(context) / 1.8,
              width: Sizes.width(context) / 1.8,
              child: Image.asset(StringImageAsset.logo)
            ),
            SizedBox(height: Sizes.dp25(context)),
            SizedBox(height: Sizes.dp25(context)),
            SizedBox(height: Sizes.dp25(context)),
            SizedBox(
              width: Sizes.width(context) / 1.8,
              child: Text(
                'Saat ini layanan hanya tersedia untuk daerah rumah saya',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.dp14(context),
                  color: Colors.blue[400],
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: Sizes.dp18(context)),
            SizedBox(
              width: Sizes.width(context) / 1.8,
              child: Text(
                'Jarak kamu: 2,4 KM',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: Sizes.dp20(context),
                  color: Colors.blue[400],
                  fontFamily: 'Quicksand',
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
                  Navigation.intentWithoutBack(context, DashBoardPage());
                },
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                  child: Text(
                    "LANJUT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.dp20(context),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
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
