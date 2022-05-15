import 'package:amuz_nidlecrew/screens/mainPage.dart';
import 'package:amuz_nidlecrew/widgets/circleLineBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// 장바구니가 비었을 때
class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Icon(CupertinoIcons.xmark_circle),
          FontStyle(
              text: "담겨있는 장바구니가 없습니다.",
              fontsize: "",
              fontbold: "",
              fontcolor: HexColor("#909090"),textdirectionright: false),
          CircleLineBtn(
            btnText: "돌아가기",
            fontboxwidth: 100,
            fontboxheight: "",
            bordercolor: HexColor("#d5d5d5"),
            fontcolor: Colors.black,
            fontsize: "sm",
            btnIcon: "xmarkIcon.svg",
            btnColor: Colors.transparent,
            widgetName: MainPage(pageNum: 0),
            iswidget: true,
          ),
        ],
      ),
    );
  }
}
