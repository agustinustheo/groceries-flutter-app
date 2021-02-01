import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:diantaraja_mobile/common/string_image_asset.dart';

class ListFilterFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: Sizes.width(context) / 6,
            child: Column(
              children: <Widget>[
                Image.asset(
                  StringImageAsset.googleLogo,
                  width: Sizes.width(context) / 7,
                  height: Sizes.width(context) / 13,
                ),
                SizedBox(
                  height: Sizes.dp6(context),
                ),
                Text(
                  "แนะนำ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Sizes.width(context) / 6,
            child: Column(
              children: <Widget>[
                Image.asset(
                  StringImageAsset.googleLogo,
                  width: Sizes.width(context) / 7,
                  height: Sizes.width(context) / 13,
                ),
                SizedBox(
                  height: Sizes.dp6(context),
                ),
                Text(
                  "ใกล้เคียง",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Sizes.width(context) / 6,
            child: Column(
              children: <Widget>[
                Image.asset(
                  StringImageAsset.googleLogo,
                  width: Sizes.width(context) / 7,
                  height: Sizes.width(context) / 13,
                ),
                SizedBox(
                  height: Sizes.dp6(context),
                ),
                Text(
                  "คาเฟ่",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Sizes.width(context) / 6,
            child: Column(
              children: <Widget>[
                Image.asset(
                  StringImageAsset.googleLogo,
                  width: Sizes.width(context) / 7,
                  height: Sizes.width(context) / 13,
                ),
                SizedBox(
                  height: Sizes.dp6(context),
                ),
                Text(
                  "ปิ้งย่าง",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Sizes.width(context) / 6,
            child: Column(
              children: <Widget>[
                Image.asset(
                  StringImageAsset.googleLogo,
                  width: Sizes.width(context) / 7,
                  height: Sizes.width(context) / 13,
                ),
                SizedBox(
                  height: Sizes.dp6(context),
                ),
                Text(
                  "อาหารไทย",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Sizes.width(context) / 6,
            child: Column(
              children: <Widget>[
                Image.asset(
                  StringImageAsset.googleLogo,
                  width: Sizes.width(context) / 7,
                  height: Sizes.width(context) / 13,
                ),
                SizedBox(
                  height: Sizes.dp6(context),
                ),
                Text(
                  "อาหารญี่ปุ่น",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Sizes.width(context) / 6,
            child: Column(
              children: <Widget>[
                Image.asset(
                  StringImageAsset.googleLogo,
                  width: Sizes.width(context) / 7,
                  height: Sizes.width(context) / 13,
                ),
                SizedBox(
                  height: Sizes.dp6(context),
                ),
                Text(
                  "อาหารอีสาน",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                ),
              ],
            ),
          ),
          SizedBox(
            width: Sizes.width(context) / 6,
            child: Column(
              children: <Widget>[
                Image.asset(
                  StringImageAsset.googleLogo,
                  width: Sizes.width(context) / 7,
                  height: Sizes.width(context) / 13,
                ),
                SizedBox(
                  height: Sizes.dp6(context),
                ),
                Text(
                  "ก๋วยเตี๋ยว",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                      fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ListFilterFood2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
              width: Sizes.width(context) / 8,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: Sizes.dp4(context)),
                    child: Image.asset(StringImageAsset.googleLogo),
                  ),
                  Text(
                    "แนะนำ",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: Sizes.dp12(context),
                    ),
                  ),
                ],
              )),
          Container(
              width: Sizes.width(context) / 8,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: Sizes.dp4(context)),
                    child: Image.asset(StringImageAsset.googleLogo),
                  ),
                  Text(
                    "ใกล้เคียง",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                  ),
                ],
              )),
          Container(
              width: Sizes.width(context) / 8,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: Sizes.dp4(context)),
                    child: Image.asset(StringImageAsset.googleLogo),
                  ),
                  Text(
                    "คาเฟ่",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                  ),
                ],
              )),
          Container(
              width: Sizes.width(context) / 8,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: Sizes.dp4(context)),
                    child: Image.asset(StringImageAsset.googleLogo),
                  ),
                  Text(
                    "ปิ้งย่าง",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                  ),
                ],
              )),
          Container(
              width: Sizes.width(context) / 8,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: Sizes.dp4(context)),
                    child: Image.asset(StringImageAsset.googleLogo),
                  ),
                  Text(
                    "อาหารไทย",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                  ),
                ],
              )),
          Container(
              width: Sizes.width(context) / 8,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: Sizes.dp4(context)),
                    child: Image.asset(StringImageAsset.googleLogo),
                  ),
                  Text(
                    "อาหารญี่ปุ่น",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                  ),
                ],
              )),
          Container(
              width: Sizes.width(context) / 8,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: Sizes.dp4(context)),
                    child: Image.asset(StringImageAsset.googleLogo),
                  ),
                  Text(
                    "อาหารอีสาน",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                  ),
                ],
              )),
          Container(
              width: Sizes.width(context) / 8,
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(5),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: Sizes.dp4(context)),
                    child: Image.asset(StringImageAsset.googleLogo),
                  ),
                  Text(
                    "ก๋วยเตี๋ยว",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontFamily: 'Montserrat', fontSize: Sizes.dp12(context)),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
