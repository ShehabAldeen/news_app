import 'package:flutter/material.dart';

class CustomAppBarShape {
  static ShapeBorder appBareShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(48.0),
      ),
    );
  }
}
