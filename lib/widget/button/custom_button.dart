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

class SizedFlatButton extends StatelessWidget{
  final double width;
  final Color backgroundColor;
  final EdgeInsetsGeometry margin;
  final void Function() onPressed;
  final Widget child;

  SizedFlatButton({
    this.width,
    this.backgroundColor,
    this.margin,
    this.onPressed,
    this.child
  });

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: width == null ? Sizes.dp58(context) : width,
      child: Container(
        padding: margin == null ? EdgeInsets.zero : margin,
        child: FlatButton(
          color: backgroundColor == null ? Colors.white : backgroundColor,
          onPressed: onPressed == null ? (){} : onPressed,
          child: Padding(
            padding: EdgeInsets.only(
              top: Sizes.dp14(context),
              bottom: Sizes.dp14(context)
            ),
            child: child == null ? Container() : child,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Sizes.dp12(context)
            ),
          ),
        ),
      ),
    );
  }
}

class FullFlatButton extends StatelessWidget{
  final Color backgroundColor;
  final EdgeInsetsGeometry margin;
  final void Function() onPressed;
  final Widget child;

  FullFlatButton({
    this.backgroundColor,
    this.margin,
    this.onPressed,
    this.child
  });

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: Sizes.width(context),
      child: Container(
        padding: margin == null ? EdgeInsets.zero : margin,
        child: FlatButton(
          color: backgroundColor == null ? Colors.white : backgroundColor,
          onPressed: onPressed == null ? (){} : onPressed,
          child: Padding(
            padding: EdgeInsets.only(
              top: Sizes.dp14(context),
              bottom: Sizes.dp14(context)
            ),
            child: child == null ? Container() : child,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Sizes.dp12(context)
            ),
          ),
        ),
      ),
    );
  }
}