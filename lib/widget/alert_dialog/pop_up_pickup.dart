import 'package:flutter/material.dart';
import 'package:diantaraja_mobile/common/sizes.dart';

class PopUpPickUp extends StatelessWidget {

  final GestureTapCallback onTapOne, onTapTwo, onTapThree;

  const PopUpPickUp({Key key, @required this.onTapOne, @required this.onTapTwo, @required this.onTapThree}) : super(key: key);

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
              "PICK UP",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.dp18(context)),
            ),
            Padding(
              padding: EdgeInsets.only(top:10, bottom:10),
              child: Text(
                "I will pickup within...",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: Sizes.dp14(context)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top:10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        color: Colors.yellow,
                        child: Text(
                          "15 Minutes",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Sizes.dp14(context)),
                        ),
                        onPressed: onTapOne,
                      ),
                      RaisedButton(
                        color: Colors.yellow,
                        child: Text(
                          "30 Minutes",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Sizes.dp14(context)),
                        ),
                        onPressed: onTapTwo,
                      )
                    ],
                  ),
                  RaisedButton(
                    color: Colors.yellow,
                    child: Text(
                      "1 Hour",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: Sizes.dp14(context)),
                    ),
                    onPressed: onTapThree,
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}