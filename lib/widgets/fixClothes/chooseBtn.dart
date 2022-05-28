import 'package:amuz_nidlecrew/models/chooseClothes.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseBtn extends StatefulWidget{
  final ChooseClothes clothes;
  final int stepNum;
  final PageController controller;

  const ChooseBtn({Key? key, required this.clothes, required this.stepNum, required this.controller})
      : super(key: key);

  @override
  State<ChooseBtn> createState() => _ChooseBtnState();
}

class _ChooseBtnState extends State<ChooseBtn> {
  @override
  Widget build(BuildContext context) {
    print("stepNum : ${widget.stepNum}");
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      alignment: Alignment.center,
      child: ChooseCircleBtn(double.infinity, HexColor("#d5d5d5"),
          widget.clothes.chooseItem, "md", Colors.black),
    );
  }

  Widget ChooseCircleBtn(double fontboxwidth, Color bordercolor, String btnText,
      String fontsize, Color fontcolor) {
    return Container(
      width: fontboxwidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 1,
          color: bordercolor,
        ),
      ),
      child: TextButton(
        onPressed: () {
            widget.controller.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.easeIn);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnText,
              style: TextStyle(
                fontSize: fontsize == "md" ? 15 : null,
                color: fontcolor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
