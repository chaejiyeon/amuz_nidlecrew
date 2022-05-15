import 'package:amuz_nidlecrew/screens/main/fixClothes/chooseFirst.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/fixQuestion.dart';
import 'package:amuz_nidlecrew/widgets/circleLineBtn.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/footerBtn.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/header.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/progressbar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseClothes extends StatefulWidget {
  const ChooseClothes({Key? key}) : super(key: key);

  @override
  State<ChooseClothes> createState() => _ChooseClothesState();
}

class _ChooseClothesState extends State<ChooseClothes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixClothesAppBar(
        appbar: AppBar(),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // progress bar
            ProgressBar(progressImg: "fixProgressbar.svg"),
            Header(
              title: "의류 선택",
              subtitle1: "수선하고자 하는 성별의 의류를",
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
                      iswidget: true,
                      btnText: "여성복",
                      fontboxwidth: double.infinity,
                      bordercolor: HexColor("#d5d5d5"),
                      fontcolor: Colors.black,
                      fontsize: "md",
                      btnIcon: "",
                      btnColor: Colors.transparent,
                      widgetName: ChooseFirst(
                        stepNum: 1,
                      ),
                      fontboxheight: ""),
                  SizedBox(
                    height: 10,
                  ),
                  CircleLineBtn(
                      iswidget: true,
                      btnText: "남성복",
                      fontboxwidth: double.infinity,
                      bordercolor: HexColor("#d5d5d5"),
                      fontcolor: Colors.black,
                      fontsize: "md",
                      btnIcon: "",
                      btnColor: Colors.transparent,
                      widgetName: ChooseFirst(
                        stepNum: 1,
                      ),
                      fontboxheight: "")
                ],
              ),
            ),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
      bottomNavigationBar: FooterBtn(),
    );
  }
}
