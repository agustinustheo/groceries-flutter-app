import 'package:diantaraja_mobile/common/colors.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget{
  final TextEditingController _controller;
  final String hintText;
  final bool autocorrect;
  final bool obscureText;
  final Icon suffixIcon;
  final EdgeInsetsGeometry padding;

  CustomTextFormField(
    this._controller,
    {
      this.padding,
      this.hintText,
      this.autocorrect,
      this.obscureText,
      this.suffixIcon,
    }
  );

  TextStyle _getTextStyle(BuildContext context){
    return TextStyle(
      color: Colors.grey[800],
      fontSize: Sizes.dp18(context),
      fontWeight: FontWeight.normal,
      fontFamily: 'Quicksand',
    );
  }

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: padding == null ? EdgeInsets.zero : padding,
      child: TextFormField(
        autocorrect: autocorrect == null ? false : autocorrect,
        keyboardType: TextInputType.emailAddress,
        controller: _controller,
        obscureText: obscureText == null ? false : obscureText,
        style: _getTextStyle(context),
        decoration: InputDecoration(
          fillColor: Colors.white,
          contentPadding: EdgeInsets.fromLTRB(
            Sizes.dp20(context), 
            Sizes.dp14(context), 
            Sizes.dp20(context), 
            Sizes.dp14(context)
          ),
          suffixIcon: suffixIcon == null ? null : suffixIcon,
          hintText: hintText == null ? "" : hintText,
          hintStyle: _getTextStyle(context),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorPalette.activeBorder, width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorPalette.unActiveBorder, width: 2.0),
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
    );
  }
}