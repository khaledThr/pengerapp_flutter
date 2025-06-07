import 'package:flutter/material.dart';

class Appstyles {
  static titlex({double size = 64, Color color = Colors.black}) {
    return TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: size);
  }

  static title1({double size = 32, Color color = Colors.black}) {
    return TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: size);
  }

  static title2({double size = 18}) {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: size);
  }

  static regular1({double size = 16, Color color = Colors.black}) {
    return TextStyle(color: color, fontSize: size);
  }
}
