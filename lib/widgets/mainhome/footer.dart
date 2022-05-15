import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/images/loadingpage_1.png")),
                SizedBox(
                  height: 65,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                rowText("니들크루", "대표 : 홍길동"),
                SizedBox(
                  height: 5,
                ),
                FontStyle(
                    text: "통신판매신고 : 제 2022-서울강서-2020호",
                    fontsize: "sm",
                    fontbold: "",
                    fontcolor: HexColor("#909090"),textdirectionright: false),
                SizedBox(
                  height: 5,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(text: "주소 : ", fontsize: "sm", fontbold: "", fontcolor: HexColor("#909090"),textdirectionright: false),
                    Column(
                      children: [
                        FontStyle(text: "부산광역시 강서구 명지동 50길 21", fontsize: "sm", fontbold: "", fontcolor: HexColor("#909090"),textdirectionright: false),
                        FontStyle(text: "(우편번호 : 01234)", fontsize: "sm", fontbold: "", fontcolor: HexColor("#909090"),textdirectionright: false),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                rowText("사업자 등록번호 : 123-12-12300", "고객센터 : 1588-1588"),
                SizedBox(
                  height: 5,
                ),
                FontStyle(
                    text: "Copyright 2022 needlecrew All rights reserved.",
                    fontsize: "sm",
                    fontbold: "",
                    fontcolor: HexColor("#909090"),textdirectionright: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowText(String text1, String text2) {
    return Row(
      children: [
        FontStyle(
            text: text1,
            fontsize: "sm",
            fontbold: "",
            fontcolor: HexColor("#909090"),textdirectionright: false),
        FontStyle(
            text: " | ",
            fontsize: "sm",
            fontbold: "",
            fontcolor: HexColor("#909090"),textdirectionright: false),
        FontStyle(
            text: text2,
            fontsize: "sm",
            fontbold: "",
            fontcolor: HexColor("#909090"),textdirectionright: false),
      ],
    );
  }
}
