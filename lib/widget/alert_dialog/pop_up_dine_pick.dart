import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';

class PopUpDinePick extends StatelessWidget {

  final GestureTapCallback onTapPickUp, onTapDineIn;

  const PopUpDinePick({Key key, @required this.onTapDineIn, @required this.onTapPickUp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "Advanced Available Here",
            style: TextStyle(
                color: Colors.black,
                fontSize: Sizes.dp14(context)),
          ),
          Padding(
            padding: EdgeInsets.only(top:15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  color: Colors.yellow,
                  child: Text(
                    "Dine In",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.dp14(context)),
                  ),
                  onPressed: onTapDineIn,
                ),
                RaisedButton(
                  color: Colors.yellow,
                  child: Text(
                    "Pick Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Sizes.dp14(context)),
                  ),
                  onPressed: onTapPickUp,
                )
              ],
            ),
          )
        ],
      )
    );
  }
}