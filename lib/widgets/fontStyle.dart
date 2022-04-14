import 'package:flutter/material.dart';

class FontStyle extends StatelessWidget {
  final String text;
  final String fontsize; // lg(26) = title , md(16) = subtitle, sm(10)
  final String fontbold;
  final Color fontcolor;

  const FontStyle(
      {Key? key,
      required this.text,
      required this.fontsize,
      required this.fontbold,
      required this.fontcolor,
      fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize == "lg"
            ? 24
            : fontsize == "md"
                ? 16
                : fontsize == "sm"
                    ? 10
                    : 14,
        fontWeight: fontbold == "bold" ? FontWeight.bold : null,
        color: fontcolor,
      ),
    );
  }
}
