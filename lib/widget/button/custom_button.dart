import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';

class RaisedGradientButton extends StatelessWidget {

  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;
  final String text;

  const RaisedGradientButton({
    Key key,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    @required this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: Sizes.width(context) / 9,
      decoration: BoxDecoration(gradient: gradient, boxShadow: [
        BoxShadow(
          color: Colors.grey[500],
          offset: Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.dp16(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}