import 'package:amuz_nidlecrew/screens/main/fixClothes.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/startAddressChoose.dart';
import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/widgets/circleLineBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainHomeModal extends StatelessWidget {
  const MainHomeModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.only(top: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      CupertinoIcons.xmark_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FontStyle(
                      text: "반가워요, 신응수님!",
                      fontsize: "lg",
                      fontbold: "bold",
                      fontcolor: Colors.white,textdirectionright: false),
                  FontStyle(
                      text: "지금 바로 니들크루 수선의뢰를",
                      fontsize: "md",
                      fontbold: "",
                      fontcolor: Colors.white,textdirectionright: false),
                  FontStyle(
                      text: "이용해 보시겠어요?",
                      fontsize: "md",
                      fontbold: "",
                      fontcolor: Colors.white,textdirectionright: false),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleLineBtn(
                    btnText: "이용하기",
                    fontboxwidth: 100,
                    bordercolor: Colors.white,
                    fontcolor: Colors.white,
                    fontsize: "",
                    btnIcon: "",
                    btnColor: Colors.transparent,
                    widgetName: FixClothes(),
                    fontboxheight: "",
                    iswidget: true,
                  ),
                  Expanded(child: SvgPicture.asset("assets/images/mainInfo.svg")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
