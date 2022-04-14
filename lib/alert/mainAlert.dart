import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

void MainDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          // backgroundColor: HexColor("#000"),
        );
      });
}
