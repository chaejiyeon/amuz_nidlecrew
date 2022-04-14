import 'package:amuz_nidlecrew/main.dart';
import 'package:amuz_nidlecrew/screens/join/chooseGender.dart';
import 'package:amuz_nidlecrew/widgets/baseAppbar.dart';
import 'package:amuz_nidlecrew/widgets/circleCheckBtn.dart';
import 'package:amuz_nidlecrew/widgets/floatingNextBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AgreeTerms extends StatefulWidget {
  const AgreeTerms({Key? key}) : super(key: key);

  @override
  State<AgreeTerms> createState() => _AgreeTermsState();
}

class _AgreeTermsState extends State<AgreeTerms> {
  bool whole_checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appbar: AppBar(),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontStyle(
                      text: "환영합니다 :D",
                      fontbold: "bold",
                      fontcolor: Colors.black,
                      fontsize: "lg"),
                  FontStyle(
                      text: "니들크루 서비 이용에 필요한 사항을",
                      fontbold: "",
                      fontcolor: HexColor("#606060"),
                      fontsize: "md"),
                  FontStyle(
                    text: "안내해드릴께요.",
                    fontbold: "",
                    fontcolor: HexColor("#606060"),
                    fontsize: "md",
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 72),
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                shape: BoxShape.rectangle,
                border: Border.all(
                  width: 1,
                  color: HexColor("#d5d5d5"),
                ),
              ),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    whole_checked = true;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.checkmark_alt,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "약관 전체동의",
                      style: TextStyle(
                        color: HexColor("#404040"),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 370,
              margin: EdgeInsets.only(top: 41),
              child: Column(
                children: [
                  CircleCheckBtn(
                      list: "개인정보 처리방침(필수)",
                      listInfo: MyApp(),
                      checked: whole_checked),
                  CircleCheckBtn(
                      list: "서비스 이용 약관(필수)",
                      listInfo: MyApp(),
                      checked: whole_checked),
                  CircleCheckBtn(
                      list: "혜택 정보 앱 푸시 알림 수신(선택)",
                      listInfo: MyApp(),
                      checked: whole_checked),
                  CircleCheckBtn(
                      list: "개인정보 처리방침(필수)",
                      listInfo: MyApp(),
                      checked: whole_checked),
                ],
              ),
            ),
            SizedBox(
              height: 130,
            ),
            FloatingNextBtn(page: ChooseGender()),
          ],
        ),
      ),
    );
  }
}
