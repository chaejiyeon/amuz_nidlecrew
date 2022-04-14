import 'package:amuz_nidlecrew/screens/join/userInfoInsert.dart';
import 'package:amuz_nidlecrew/widgets/baseAppbar.dart';
import 'package:amuz_nidlecrew/widgets/circleLineBtn.dart';
import 'package:amuz_nidlecrew/widgets/floatingNextBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseGender extends StatefulWidget {
  const ChooseGender({Key? key}) : super(key: key);

  @override
  State<ChooseGender> createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(appbar: AppBar(),),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontStyle(text: "성별선택", fontsize: "lg", fontbold: "bold", fontcolor: Colors.black),
                  FontStyle(text: "고객님의 성별을 선택해주세요", fontsize: "md", fontbold: "", fontcolor: HexColor("#606060")),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 96,),
              child: Column(
                children: [
                  CircleLineBtn(btnText: "여성", fontboxwidth: 340.0, bordercolor: HexColor("#d5d5d5"), fontcolor: Colors.black, fontsize: "md", btnIcon: "", btnColor: Colors.white,),
                  SizedBox(height: 10,),
                  CircleLineBtn(btnText: "남성", fontboxwidth: 340.0, bordercolor: HexColor("#d5d5d5"), fontcolor: Colors.black, fontsize: "md", btnIcon: "", btnColor: Colors.white,),
                ],
              ),
            ),
            SizedBox(height: 302,),
            FloatingNextBtn(page: UserInfoInsert()),
          ],
        ),
      ),
    );
  }
}
