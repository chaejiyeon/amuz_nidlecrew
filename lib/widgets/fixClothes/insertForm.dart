import 'package:amuz_nidlecrew/screens/main/fixClothes/imageUpload.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/circleLineTextField.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class InsertForm extends StatefulWidget {
  final String titleText;
  final String iconImage;
  final String hintText;

  const InsertForm(
      {Key? key,
      required this.titleText,
      required this.iconImage,
      required this.hintText})
      : super(key: key);

  @override
  State<InsertForm> createState() => _InsertFormState();
}

class _InsertFormState extends State<InsertForm> {
  int maxLines = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FontStyle(
              text: widget.titleText,
              fontsize: "lg",
              fontbold: "bold",
              fontcolor: Colors.black,textdirectionright: false),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FontStyle(
                    text: "사진 업로드",
                    fontsize: "md",
                    fontbold: "bold",
                    fontcolor: Colors.black,textdirectionright: false),
                SizedBox(
                  height: 20,
                ),
                ImageUpload(icon: widget.iconImage, isShopping: false),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontStyle(
                      text: "문의 내용",
                      fontsize: "md",
                      fontbold: "bold",
                      fontcolor: Colors.black,textdirectionright: false),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: CircleLineTextField(
                        maxLines: maxLines,
                        hintText: widget.hintText,
                        hintTextColor: HexColor("#909090"),
                        borderRadius: 10,
                        borderSideColor: HexColor("#d5d5d5"),
                        widthOpacity: true),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
