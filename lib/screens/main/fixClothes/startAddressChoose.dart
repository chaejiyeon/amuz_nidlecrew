import 'package:amuz_nidlecrew/screens/main/fixClothes/addressInfo.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/fixQuestion.dart';
import 'package:amuz_nidlecrew/widgets/circleLineBtn.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/header.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class StartAddressChoose extends StatefulWidget {
  const StartAddressChoose({Key? key}) : super(key: key);

  @override
  State<StartAddressChoose> createState() => _StartAddressState();
}

class _StartAddressState extends State<StartAddressChoose> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // progress bar
          Container(
            padding: EdgeInsets.only(top: 20, left: 25, bottom: 20),
            child: Row(
              children: [
                SvgPicture.asset("assets/icons/fixClothes/scissorsIcon.svg"),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: ListLine(
                        height: 2,
                        width: 300,
                        lineColor: HexColor("#909090"),
                        opacity: 0.5),
                  ),
                ),
              ],
            ),
          ),

          Header(
            title: "출발지 선택",
            subtitle1: "고객님의 의류의 출발지를",
            subtitle2: "선택해주세요.",
            question: true,
            btnIcon: "chatIcon.svg",
            btnText: "수선 문의하기",
            widget: FixQuestion(),
            imgPath: "fixClothes",
            bottomPadding: 50,
          ),

          // choose button
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Column(
              children: [
                CircleLineBtn(
                  btnText: "쇼핑몰에서 보낼래요",
                  fontboxwidth: double.infinity,
                  bordercolor: HexColor("#d5d5d5"),
                  fontcolor: Colors.black,
                  fontsize: "md",
                  btnIcon: "",
                  btnColor: Colors.transparent,
                  widgetName: AddressInfo(),
                  fontboxheight: "",
                  iswidget: true,
                ),
                SizedBox(
                  height: 10,
                ),
                CircleLineBtn(
                  btnText: "우리집에서 보내요",
                  fontboxwidth: double.infinity,
                  bordercolor: HexColor("#d5d5d5"),
                  fontcolor: Colors.black,
                  fontsize: "md",
                  btnIcon: "",
                  btnColor: Colors.transparent,
                  widgetName: AddressInfo(),
                  fontboxheight: "",
                  iswidget: true,
                )
              ],
            ),
          ),

          SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}
