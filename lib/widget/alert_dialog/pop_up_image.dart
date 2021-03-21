import 'package:diantaraja_mobile/common/colors.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<bool> showImageAlert(
  {
    @required BuildContext context,
    @required Image image,
    @required String title,
    @required String desc,
    @required List<DialogButton> dialogs
  }){
  return Alert(
    context: context,
    image: image,
    style: AlertStyle(
      titleStyle: TextStyle(
        color: Colors.blue[400], 
        fontFamily: 'Montserrat', 
        fontSize: Sizes.dp20(context),
        fontWeight: FontWeight.bold
      ),
      descStyle: TextStyle(
        color: ColorPalette.textLoginBlack, 
        fontFamily: 'Montserrat', 
        fontSize: Sizes.dp14(context),
        fontWeight: FontWeight.w500
      ),
      isCloseButton: false
    ),
    title: title,
    desc: desc,
    buttons: [
      ...dialogs
    ],
  ).show();
}