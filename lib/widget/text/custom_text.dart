import 'package:diantaraja_mobile/common/colors.dart';
import 'package:diantaraja_mobile/common/sizes.dart';
import 'package:flutter/cupertino.dart';

class MontserratText extends StatelessWidget{
  final String text;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry margin;
  final TextAlign textAlign;
  final FontStyle fontStyle;
  final TextDecoration textDecoration;

  MontserratText(
    this.text,
    {
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.margin,
      this.textAlign,
      this.fontStyle,
      this.textDecoration,
    }
  );

  @override
  Widget build(BuildContext context){
    return Container(
      margin: margin == null ? EdgeInsets.zero : margin,
      child: Text(
        text,
        textAlign: textAlign == null ? TextAlign.start : textAlign,
        style: TextStyle(
          color: textColor == null ? ColorPalette.textLoginBlack : textColor, 
          fontFamily: 'Montserrat', 
          fontSize: fontSize == null ? Sizes.dp16(context) : fontSize, 
          fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
          fontStyle: fontStyle == null ? FontStyle.normal : fontStyle,
          decoration: textDecoration == null ? TextDecoration.none : textDecoration
        ),
      ),
    );
  }
}