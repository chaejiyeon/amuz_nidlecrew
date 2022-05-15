import 'package:amuz_nidlecrew/models/chooseClothes.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/chooseDetail.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/chooseThird.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/fixQuestion.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/header.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/progressbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseSecond extends StatefulWidget {
  final int optionNum;

  const ChooseSecond({Key? key, required this.optionNum}) : super(key: key);

  @override
  State<ChooseSecond> createState() => _ChooseSecondState();
}

class _ChooseSecondState extends State<ChooseSecond> {
  @override
  Widget build(BuildContext context) {
    List<ChooseClothes> step2 = [
      ChooseClothes(1, "바지"),
      ChooseClothes(1, "스커트"),
      ChooseClothes(1, "직접입력"),
      ChooseClothes(2, "티셔츠"),
      ChooseClothes(2, "맨투맨/후드티"),
      ChooseClothes(2, "니트/가디건"),
      ChooseClothes(2, "셔츠"),
      ChooseClothes(2, "블라우스"),
      ChooseClothes(2, "직접입력"),
      ChooseClothes(3, "점퍼"),
      ChooseClothes(3, "패딩"),
      ChooseClothes(3, "재킷"),
      ChooseClothes(3, "코트"),
      ChooseClothes(3, "직접입력"),
      ChooseClothes(4, "점퍼"),
      ChooseClothes(4, "푸리 원피스"),
      ChooseClothes(4, "정장 원피스"),
      ChooseClothes(4, "트위드 원피스"),
      ChooseClothes(4, "청 원피스"),
      ChooseClothes(4, "쉬폰 원피스"),
      ChooseClothes(4, "셔츠 원피스"),
      ChooseClothes(4, "직접입력"),
      ChooseClothes(5, "정장/교복재킷"),
      ChooseClothes(5, "정장/교복셔츠"),
      ChooseClothes(5, "정장/교복바지"),
      ChooseClothes(5, "직접입력"),
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
                    step2.length,
                    (index) => ChooseBtn(step2[index]),
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

  Widget ChooseBtn(ChooseClothes clothes) {
    print(widget.optionNum);
    return widget.optionNum == clothes.optionNum
        ? InkWell(
            onTap: () {
              widget.optionNum == 1 || widget.optionNum == 3 && clothes.chooseItem == "점퍼"
                  ? Get.to(ChooseThird(optionNum: widget.optionNum, type: clothes.chooseItem,))
                  : Get.to(ChooseDetail());
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
                clothes.chooseItem,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        : Container();
  }
}
