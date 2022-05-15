import 'package:amuz_nidlecrew/bottomsheet/fixSizeGuideSheet.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/subtitle.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle1;
  final String subtitle2;
  final bool question;
  final String btnIcon;
  final String btnText;
  final Widget widget;
  final String imgPath;
  final double bottomPadding;

  const Header(
      {Key? key,
      required this.title,
      required this.subtitle1,
      required this.subtitle2,
      required this.question,
      required this.btnIcon,
      required this.btnText,
      required this.widget,
      required this.imgPath,
      required this.bottomPadding})
      : super(key: key);


  void bottomsheetOpen(BuildContext context) {
      showFlexibleBottomSheet(
        minHeight: 0,
        initHeight: 0.9,
        maxHeight: 0.9,
        context: context,
        bottomSheetColor: HexColor("#909090").withOpacity(0.2),
        decoration: BoxDecoration(
          color: HexColor("#f5f5f5"),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        builder: (context, controller, offset) {
          return FixSizeQuideSheet();
        },
      );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.only(left: 24,right: 24, top: 20, bottom: bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FontStyle(
                  text: title,
                  fontsize: "lg",
                  fontbold: "bold",
                  fontcolor: Colors.black,textdirectionright: false),
             question == true ?  InkWell(
               onTap: (){
                 btnText == "치수 측정 가이드" ?  bottomsheetOpen(context) :
                 Get.to(widget);
               },
                child: Row(
                  children: [
                    imgPath != "" ? SvgPicture.asset(
                      "assets/icons/" + imgPath +"/" + btnIcon,
                      color: Colors.black,
                    ) : SvgPicture.asset(
                      "assets/icons/" + btnIcon,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(btnText),
                  ],
                ),
              ) : Container(),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          subtitle1 !="" ? SubtitleText(text: subtitle1) : Container(),
          subtitle2 !="" ? SubtitleText(text: subtitle2) : Container(),
        ],
      ),
    );
  }
}
