import 'package:amuz_nidlecrew/screens/main/fixClothes.dart';
import 'package:amuz_nidlecrew/screens/main/useInfo.dart';
import 'package:amuz_nidlecrew/screens/mainPage.dart';
import 'package:flutter/material.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyUseInfo extends StatefulWidget {
  const MyUseInfo({Key? key}) : super(key: key);

  @override
  State<MyUseInfo> createState() => _MyUseInfoState();
}

class _MyUseInfoState extends State<MyUseInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24,right: 24, top: 25, bottom: 53),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FontStyle(
              text: "나의 이용내역",
              fontsize: "md",
              fontbold: "bold",
              fontcolor: Colors.black,textdirectionright: false),
          SizedBox(height: 34,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              iconInfo("assets/icons/main/writeIcon.svg", 0, "작성 중", "/fixClothes"),
              iconInfo("assets/icons/main/chartIcon.svg", 0, "진행 중", "/useInfo"),
              iconInfo("assets/icons/main/clothesIcon.svg", 4, "수선 완료", ""),
            ],
          ),
        ],
      ),
    );
  }


  // 이용 내역 아이콘 버튼
  Widget iconInfo(String img, int count, String comment, String widget){
    return InkWell(
      onTap: (){
        Get.toNamed(widget);
      },
      child: Container(
        child: Column(
          children: [
            SvgPicture.asset(img),
            SizedBox(height: 14,),
            Text(count.toString() + "건"),
            SizedBox(height: 3,),
            Text(comment),
          ],
        ),
      ),
    );
  }
}
