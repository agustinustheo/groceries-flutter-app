import 'package:flutter/material.dart';

class Navigation {

  // This method to used navigation with adding back button arrow and can back
  // to previous page
  static intent(BuildContext context, Widget child) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => child));
  }

  // This method to used navigation without adding back button arrow and can't back
  // to previous page
  static intentWithoutBack(BuildContext context, Widget child) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => child));
  }

  // This method to handle back as programmatically
  static back(BuildContext context) {
    Navigator.pop(context);
  }

  // This method to handle back as programmatically
  static pushAndRemoveUntil(BuildContext context, Widget child, String routeName) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => child),
      ModalRoute.withName(routeName),
    );
  }

}