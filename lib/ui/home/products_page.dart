import 'dart:async';
import 'package:bloc/bloc/home/list_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:diantaraja_mobile/common/navigation.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:diantaraja_mobile/widget/alert_dialog/pop_up_banner.dart';
import 'package:diantaraja_mobile/widget/app_bar/app_bar_home.dart';
import 'package:diantaraja_mobile/widget/banner/banner_home.dart';
import 'package:diantaraja_mobile/widget/card/card_list_shop.dart';
import 'package:diantaraja_mobile/widget/header/space_header.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:network/model/list_product.dart';
import 'package:network/network.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
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

  final bloc_product = ListProductBloc();

  @override
  void initState() {
    super.initState();
    _getStartingLocation().then((value) {
      setState(() {
        _initialPosition = value;
      });
    });
    bloc_product.fetchAllReview();
  }

  @override
  void dispose() {
    bloc_product.fetchAllReview();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarColor: Colors.blue[400],
        addBackButton: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: Sizes.dp28(context),
          left: Sizes.dp28(context),
          right: Sizes.dp28(context)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: Sizes.dp16(context)),
              padding: EdgeInsets.all(Sizes.dp12(context)),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300],
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: Sizes.dp8(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(
                          'https://d25rq8gxcq0p71.cloudfront.net/dictionary-images/324/small.jpg',
                          fit: BoxFit.cover,
                          width: Sizes.width(context) / 8,
                          height: Sizes.width(context) / 8,
                        ),
                      ),
                      SizedBox(
                        width: Sizes.dp12(context),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Dog',
                              style: TextStyle(
                                fontSize: Sizes.dp14(context),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              '1 dog',
                              style: TextStyle(
                                fontSize: Sizes.dp12(context),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Rp30000,-',
                        style: TextStyle(
                          fontSize: Sizes.dp12(context),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[400]
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.dp8(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          width: Sizes.dp24(context),
                          height: Sizes.dp24(context),
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            shape: BoxShape.circle
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.dp20(context),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Sizes.dp4(context),
                      ),
                      Container(
                        width: Sizes.dp28(context),
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '0',
                            counterText: "",
                            isDense: true
                          ),                                 
                          style: TextStyle(
                            fontSize: Sizes.dp12(context)                
                          )
                        ),
                      ),
                      SizedBox(
                        width: Sizes.dp4(context),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          width: Sizes.dp24(context),
                          height: Sizes.dp24(context),
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            shape: BoxShape.circle
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.dp20(context),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
            Container(
              margin: EdgeInsets.only(bottom: Sizes.dp16(context)),
              padding: EdgeInsets.all(Sizes.dp12(context)),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[300],
                ),
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: Sizes.dp8(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25.0),
                        child: Image.network(
                          'https://d25rq8gxcq0p71.cloudfront.net/dictionary-images/324/small.jpg',
                          fit: BoxFit.cover,
                          width: Sizes.width(context) / 8,
                          height: Sizes.width(context) / 8,
                        ),
                      ),
                      SizedBox(
                        width: Sizes.dp12(context),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Dog',
                              style: TextStyle(
                                fontSize: Sizes.dp14(context),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              '1 dog',
                              style: TextStyle(
                                fontSize: Sizes.dp12(context),
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w600,
                                color: Colors.grey
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Rp30000,-',
                        style: TextStyle(
                          fontSize: Sizes.dp12(context),
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[400]
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Sizes.dp8(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          width: Sizes.dp24(context),
                          height: Sizes.dp24(context),
                          decoration: BoxDecoration(
                            color: Colors.red[400],
                            shape: BoxShape.circle
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "-",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.dp20(context),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Sizes.dp4(context),
                      ),
                      Container(
                        width: Sizes.dp28(context),
                        child: TextField(
                          textAlign: TextAlign.center,
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: '0',
                            counterText: "",
                            isDense: true
                          ),                                 
                          style: TextStyle(
                            fontSize: Sizes.dp12(context)                
                          )
                        ),
                      ),
                      SizedBox(
                        width: Sizes.dp4(context),
                      ),
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          width: Sizes.dp24(context),
                          height: Sizes.dp24(context),
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            shape: BoxShape.circle
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "+",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Sizes.dp20(context),
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
