import 'package:diantaraja_mobile/common/colors.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Future<bool> showAlert(
  {
    @required BuildContext context,
    @required AlertType alertType,
    @required String title,
    @required String desc,
    @required List<DialogButton> dialogs,
    bool isButtonVisible = true,
    bool isCloseButton = true,
  }){
  return Alert(
    context: context,
    type: alertType,
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
      isButtonVisible: isButtonVisible,
      isCloseButton: isCloseButton
    ),
    title: title,
    desc: desc,
    buttons: [
      ...dialogs
    ],
  ).show();
}