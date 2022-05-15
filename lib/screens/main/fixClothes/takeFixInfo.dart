import 'package:amuz_nidlecrew/bottomsheet/takeFixInfoBottomSheet.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/progressbar.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class TakeFixInfo extends StatelessWidget {
  const TakeFixInfo({Key? key}) : super(key: key);

  // 수거 가이드 bottomsheet
  void bottomsheetOpen(BuildContext context) {
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.8,
      maxHeight: 0.8,
        bottomSheetColor: Colors.transparent,
        decoration: BoxDecoration(
          color: HexColor("#f5f5f5"),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
      context: context,
      builder: (context, controller, offset) => TakeFixInfoBottomSheet(controller: controller),
      isExpand: false
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixClothesAppBar(appbar: AppBar()),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBar(progressImg: "fixProgressbar_5.svg"),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontStyle(
                      text: "의류 수거는 접수일로부터\n1~2일 소요됩니다.",
                      fontsize: "lg",
                      fontbold: "bold",
                      fontcolor: Colors.black,
                      textdirectionright: false),
                  SizedBox(
                    height: 5,
                  ),
                  FontStyle(
                      text: "수선 확정 후 2~3일 뒤 수선이 완료되며\n이후 수령지로 의류가 발송됩니다.",
                      fontsize: "",
                      fontbold: "",
                      fontcolor: Colors.black,
                      textdirectionright: false),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Image.asset(
                  "assets/images/loadingpage_1.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // 수거 가이드 btn
            InkWell(
              onTap: () {
                bottomsheetOpen(context);
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: HexColor("#fd9a03")),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.info,
                      color: HexColor("#fd9a03"),
                    ),
                    FontStyle(
                        text: "수거 가이드",
                        fontsize: "",
                        fontbold: "",
                        fontcolor: HexColor("#fd9a03"),
                        textdirectionright: false),
                  ],
                ),
              ),
            ),

            // next btn
            InkWell(
              child: SvgPicture.asset("assets/icons/floatingNext.svg"),
            )
          ],
        ),
      ),
    );
  }
}