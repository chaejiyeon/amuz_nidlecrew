import 'package:amuz_nidlecrew/screens/join/userInfoInsert.dart';
import 'package:amuz_nidlecrew/widgets/baseAppbar.dart';
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
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: BaseAppBar(
        appbar: AppBar(),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 32),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontStyle(
                      text: "성별선택",
                      fontsize: "lg",
                      fontbold: "bold",
                      fontcolor: Colors.black,
                      textdirectionright: false),
                  FontStyle(
                      text: "고객님의 성별을 선택해주세요",
                      fontsize: "md",
                      fontbold: "",
                      fontcolor: HexColor("#606060"),
                      textdirectionright: false),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 96,
                ),
                child: Column(
                  children: [
                    chooseGenderBtn(
                      "여성",
                      1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    chooseGenderBtn(
                      "남성",
                      2,
                    ),
                    SizedBox(
                      height: 250,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: value != 0 ? FloatingNextBtn(page: UserInfoInsert(), ischecked: true,) : FloatingNextBtn(page: UserInfoInsert(), ischecked: false),
    );
  }



  // 성별 선택 버튼 위젯
  Widget chooseGenderBtn(String btnText, int index){
    return Container(
      width: double.infinity,
      height: 54,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 1,
          color: value == index ? Colors.black : HexColor("#d5d5d5"),
        ),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            value = index;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnText,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
