import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class FixInfoSheet extends StatelessWidget {

  const FixInfoSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "guideImage_1.png",
      "sample_2.jpeg",
      "sample_3.jpeg",
    ];

    List deliverinfo = [
      ["수령인", "신응수"],
      ["연락처", "010-9282-2434"],
      ["배송지", "부산광역시 강서구 명지국제3로 97\n(명지동, 삼정그린코아 더베스트)\n105동 2215호"],
      ["수거 희망일", "2022년 2월 15일"],
    ];

    List priceinfo = [
      ["의뢰 예상 비용", 5000],
      ["배송 비용", 6000],
    ];

    List payinfo = [
      ["신용카드", ""],
      ["롯데(4892)", "자세히보기"],
    ];
    return Container(
      child: ListView(
        shrinkWrap: true,
        children: [

          Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 24, right: 24, bottom: 30),
                  // height: 400,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: HexColor("#f5f5f5").withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 7,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FontStyle(
                            text: "일반바지(A1123)",
                            fontsize: "md",
                            fontbold: "bold",
                            fontcolor: Colors.black,
                            textdirectionright: false),
                        SizedBox(
                          height: 10,
                        ),
                        ListLine(
                            height: 1,
                            width: double.infinity,
                            lineColor: HexColor("#909090"),
                            opacity: 0.5),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            height: 120,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(images.length,
                                    (index) => ImageItem(images[index])))),
                        SizedBox(
                          height: 10,
                        ),
                        FontStyle(
                            text: "기장 수선-총 기장 줄임",
                            fontsize: "md",
                            fontbold: "bold",
                            fontcolor: Colors.black,
                            textdirectionright: false),
                        SizedBox(
                          height: 10,
                        ),
                        fixInfo("바지 안쪽기장", 101.5, "시접 여유분 충분히 남겨주세요."),
                        SizedBox(
                          height: 20,
                        ),
                        ListLine(
                            height: 1,
                            width: double.infinity,
                            lineColor: HexColor("#d5d5d5").withOpacity(0.1),
                            opacity: 0.9),
                        SizedBox(
                          height: 20,
                        ),
                        priceInfo("의뢰 예상 비용", 5000),
                        priceInfo("배송 비용", 6000),
                      ],
                    ),
                  ),
                ),
                info(
                  false,
                  "배송지 정보",
                  (() => deliverinfo),
                ),
                SizedBox(
                  height: 20,
                ),
                info(
                  true,
                  "총 의뢰 예상 비용",
                  (() => priceinfo),
                ),
                SizedBox(
                  height: 20,
                ),
                info(
                  false,
                  "결제 정보",
                  (() => payinfo),
                ),
              ],
            ),
        ],
      ),
    );
  }

  // slider Image Item
  Widget ImageItem(String image) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(10),
        width: 120,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/" + image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  // 수선 정보
  Widget fixInfo(String fixtype, double size, String recomend) {
    return Column(
      children: [
        Row(
          children: [
            FontStyle(
                text: "표기: ",
                fontsize: "",
                fontbold: "bold",
                fontcolor: Colors.black,
                textdirectionright: false),
            FontStyle(
                text: fixtype + " / ",
                fontsize: "",
                fontbold: "",
                fontcolor: Colors.black,
                textdirectionright: false),
            FontStyle(
                text: "치수: ",
                fontsize: "",
                fontbold: "bold",
                fontcolor: Colors.black,
                textdirectionright: false),
            FontStyle(
                text: size.toString(),
                fontsize: "",
                fontbold: "",
                fontcolor: Colors.black,
                textdirectionright: false),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            FontStyle(
                text: "추가 설명: ",
                fontsize: "",
                fontbold: "bold",
                fontcolor: Colors.black,
                textdirectionright: false),
            FontStyle(
                text: recomend + "",
                fontsize: "",
                fontbold: "",
                fontcolor: Colors.black,
                textdirectionright: false),
          ],
        ),
      ],
    );
  }

  // 수선 비용
  Widget priceInfo(String costtitle, int price) {
    final priceformat = NumberFormat('###,###,###,###').format(price);

    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Row(
                  children: [
                    FontStyle(
                        text: costtitle,
                        fontsize: "bold",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      CupertinoIcons.question_circle,
                      color: HexColor("#909090"),
                      size: 20,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  FontStyle(
                      text: priceformat,
                      fontsize: priceformat,
                      fontbold: "bold",
                      fontcolor: Colors.black,
                      textdirectionright: false),
                  FontStyle(
                      text: "원",
                      fontsize: "",
                      fontbold: "",
                      fontcolor: Colors.black,
                      textdirectionright: false),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 총 의뢰 예상 비용
  String totalPrice(int expectPrice, int deliverPrice) {
    return NumberFormat('###,###,###,###').format(expectPrice + deliverPrice);
  }

  // 입력된 정보 리스트
  Widget info(
    bool isprice,
    String title,
    List list(),
  ) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: HexColor("#f5f5f5").withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 7,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isprice == true // 비용일 경우 타이틀에 총 금액 표시
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FontStyle(
                        text: title,
                        fontsize: "",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                    Row(
                      children: [
                        FontStyle(
                            text: totalPrice(list()[0][1], list()[1][1]),
                            fontsize: "",
                            fontbold: "bold",
                            fontcolor: HexColor("#fd9a03"),
                            textdirectionright: false),
                        FontStyle(
                            text: "원",
                            fontsize: "",
                            fontbold: "",
                            fontcolor: Colors.black,
                            textdirectionright: false),
                      ],
                    ),
                  ],
                )
              : FontStyle(
                  text: title,
                  fontsize: "",
                  fontbold: "bold",
                  fontcolor: Colors.black,
                  textdirectionright: false),
          SizedBox(
            height: 10,
          ),
          ListLine(
              height: 1,
              width: double.infinity,
              lineColor: HexColor("#d5d5d5").withOpacity(0.1),
              opacity: 0.5),
          SizedBox(
            height: 10,
          ),

          // 리스트 값만큼 뿌려줌
          for (int i = 0; i < list().length; i++)
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FontStyle(
                      text: list()[i][0].toString(),
                      fontsize: "",
                      fontbold: "",
                      fontcolor: Colors.black,
                      textdirectionright: false),
                  title == "결제 정보" // 결제 정보일 경우 아이콘 표시
                      ? InkWell(
                          child: Row(
                            children: [
                              FontStyle(
                                  text: list()[i][1].toString(),
                                  fontsize: "",
                                  fontbold: "",
                                  fontcolor: Colors.black,
                                  textdirectionright: false),
                              list()[i][1] != ""
                                  ? Icon(
                                      CupertinoIcons.forward,
                                      size: 20,
                                      color: HexColor("#909090"),
                                    )
                                  : Container()
                            ],
                          ),
                        )
                      : isprice == true // 비용일 경우
                          ? Row(
                              children: [
                                FontStyle(
                                    text: NumberFormat('###,###,###,###')
                                        .format(list()[i][1])
                                        .toString(),
                                    fontsize: "",
                                    fontbold: "",
                                    fontcolor: Colors.black,
                                    textdirectionright: false),
                                FontStyle(
                                    text: "원",
                                    fontsize: "",
                                    fontbold: "",
                                    fontcolor: Colors.black,
                                    textdirectionright: false),
                              ],
                            )
                          : Align(
                              alignment: Alignment.centerRight,
                              child: FontStyle(
                                  text: list()[i][1].toString(),
                                  fontsize: "",
                                  fontbold: "",
                                  fontcolor: Colors.black,
                                  textdirectionright: true),
                            ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
