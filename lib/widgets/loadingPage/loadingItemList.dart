import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/material.dart';

class LoadingItem extends StatelessWidget {
  final String img;
  final String text1;
  final String text2;

  const LoadingItem(
      {Key? key, required this.img, required this.text1, required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: 308, child: Image.asset(img)),
          Column(
            children: [
              FontStyle(
                  text: text1,
                  fontsize: "lg",
                  fontbold: "bold",
                  fontcolor: Colors.black,
                  textdirectionright: false),
              FontStyle(
                  text: text2,
                  fontsize: "lg",
                  fontbold: "bold",
                  fontcolor: Colors.black,
                  textdirectionright: false),
            ],
          ),
        ],
      ),
    );
  }
}
