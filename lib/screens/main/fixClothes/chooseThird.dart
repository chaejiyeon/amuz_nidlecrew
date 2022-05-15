import 'package:amuz_nidlecrew/screens/main/fixClothes/chooseDetail.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/fixQuestion.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/header.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/progressbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseThird extends StatefulWidget {
  final int optionNum;
  final String type;

  const ChooseThird({Key? key, required this.optionNum, required this.type})
      : super(key: key);

  @override
  State<ChooseThird> createState() => _ChooseThirdState();
}

class _ChooseThirdState extends State<ChooseThird> {
  @override
  Widget build(BuildContext context) {
    List<ChooseThirdSelect> step3 = [
      ChooseThirdSelect(1, "바지", "일반바지"),
      ChooseThirdSelect(1, "바지", "청바지"),
      ChooseThirdSelect(1, "바지", "트레이닝바지"),
      ChooseThirdSelect(1, "바지", "가죽/레자바"),
      ChooseThirdSelect(1, "바지", "직접입력"),
      ChooseThirdSelect(1, "스커트", "일반 스커트"),
      ChooseThirdSelect(1, "스커트", "푸리 스커트"),
      ChooseThirdSelect(1, "스커트", "트위드 스커트"),
      ChooseThirdSelect(1, "스커트", "청 스커트"),
      ChooseThirdSelect(1, "스커트", "쉬폰 스커트"),
      ChooseThirdSelect(1, "스커트", "가죽 스커트"),
      ChooseThirdSelect(1, "스커트", "직접입력"),
      ChooseThirdSelect(2, "점퍼", "일반점퍼"),
      ChooseThirdSelect(2, "점퍼", "패딩점퍼"),
      ChooseThirdSelect(2, "점퍼", "다운점퍼"),
      ChooseThirdSelect(2, "점퍼", "플리스점퍼"),
      ChooseThirdSelect(2, "점퍼", "직접입력"),
    ];

    return Scaffold(
      appBar: FixClothesAppBar(
        appbar: AppBar(),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBar(progressImg: "fixProgressbar_1.svg"),
            Header(
              title: "의류 선택",
              subtitle1: "어떤 옷을 수선하고 싶으세요?",
              subtitle2: "",
              question: true,
              btnIcon: "chatIcon.svg",
              btnText: "수선 문의하기",
              widget: FixQuestion(),
              imgPath: "fixClothes",
              bottomPadding: 50,
            ),

            // choose 버튼 (step별)
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 24, right: 24, bottom: 167),
                child: ListView(
                  children: List.generate(
                    step3.length,
                    (index) => ChooseBtn(step3[index]),
                  ),
                ),
              ),
            ),
            // currentPage == 0
            //     ? Container(height: 100, child: FooterBtn())
            //     : Container(),
          ],
        ),
      ),
      // floatingActionButton: currentPage == 2
      //     ? Container(
      //         padding: EdgeInsets.only(bottom: 50),
      //         child: FloatingNextBtn(page: ChooseSecond()),
      //       )
      //     : Container(),
    );
  }

  Widget ChooseBtn(ChooseThirdSelect clothes) {
    return widget.type == clothes.optionType
        ? InkWell(
            onTap: () {
              Get.to(ChooseDetail());
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 1,
                  color: HexColor("#d5d5d5"),
                ),
              ),
              child: Text(
                clothes.optionName,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        : Container();
  }
}

class ChooseThirdSelect {
  final int optionNum;
  final String optionType;
  final String optionName;

  ChooseThirdSelect(this.optionNum, this.optionType, this.optionName);
}
