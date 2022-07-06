import 'package:needlecrew/screens/main/mainHome.dart';
import 'package:needlecrew/widgets/fixClothes/listLine.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:needlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class MypayInfo extends StatefulWidget {
  const MypayInfo({Key? key}) : super(key: key);

  @override
  State<MypayInfo> createState() => _MypayInfoState();
}

class _MypayInfoState extends State<MypayInfo> {
  final int currentPage = 0;

  // 현재 년도 가져오기
  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy');
    String strToday = formatter.format(now);
    return strToday;
  }

  List<String> month = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(title: "결제 내역", icon: "", widget: MainHome(), appbar: AppBar()),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.chevron_back,
                      color: HexColor("#909090"),
                      size: 20,
                    ),
                  ),
                  Row(
                    children: [
                      FontStyle(
                          text: getToday() + "년 ",
                          fontsize: "md",
                          fontbold: "",
                          fontcolor: Colors.black,textdirectionright: false),
                      FontStyle(
                          text: month[currentPage] + "월",
                          fontsize: "md",
                          fontbold: "",
                          fontcolor: Colors.black,textdirectionright: false),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.forward,
                      color: HexColor("#909090"),
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListLine(
                height: 1,
                width: double.infinity,
                lineColor: HexColor("#d5d5d5"),
                opacity: 0.5),
            Expanded(
              child: ListView(
                children: [
                  ListItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ListItem() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Container(padding: EdgeInsets.all(10),child: SvgPicture.asset("assets/icons/myPage/pantsIcon.svg")),
          SizedBox(width: 10,),
          Expanded(
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: HexColor("#d5d5d5"),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontStyle(
                      text: "2022.01.01",
                      fontsize: "",
                      fontbold: "",
                      fontcolor: HexColor("#909090"),textdirectionright: false),
                  Container(
                    padding: EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FontStyle(
                            text: "하의-일반바지",
                            fontsize: "",
                            fontbold: "bold",
                            fontcolor: Colors.black,textdirectionright: false),

                        GestureDetector(
                          child: Row(
                            children: [
                              FontStyle(
                                  text: "11,000",
                                  fontsize: "",
                                  fontbold: "bold",
                                  fontcolor: Colors.black,textdirectionright: false),
                              FontStyle(
                                  text: "원",
                                  fontsize: "",
                                  fontbold: "",
                                  fontcolor: Colors.black,textdirectionright: false),
                              SizedBox(width: 10,),
                              Icon(CupertinoIcons.chevron_down, size: 20, color: HexColor("#909090"),),
                            ],
                          ),
                        ),
                      ],
                    ),
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
