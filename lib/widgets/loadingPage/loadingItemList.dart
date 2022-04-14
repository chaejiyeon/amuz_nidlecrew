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
        children: [
          Container(height: 300, child: Image.asset(img)),
          SizedBox(height: 52,),
          FontStyle(
              text: text1,
              fontsize: "lg",
              fontbold: "bold",
              fontcolor: Colors.black),
          FontStyle(
              text: text2,
              fontsize: "lg",
              fontbold: "bold",
              fontcolor: Colors.black)
        ],
      ),
    );
  }
}
