import 'package:amuz_nidlecrew/screens/main/myPage/announcementInfo.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/directQuestion.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/myPayInfo.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/mysizeInfo.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/nameUpdate.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/serviceCenterInfo.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/servicePolicyInfo.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'myPage/userInfo.dart';

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        FontStyle(
                            text: "My",
                            fontsize: "md",
                            fontbold: "bold",
                            fontcolor: Colors.black,textdirectionright: false),
                        iconStyle("alramIcon.svg", "main", Colors.black),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FontStyle(
                            text: "신응수님",
                            fontbold: "bold",
                            fontsize: "lg",
                            fontcolor: Colors.black,textdirectionright: false),
                        Text("니들크루와 함께"),
                        Text("일상의 작은 변화를 만들어봐요!"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        iconwrapBtn('userwrapIcon.svg', "main", "회원 정보", UserInfo()),
                        iconwrapBtn('mysizeIcon.svg', "main", "내 치수", MySizeInfo()),
                        iconwrapBtn('payinfoIcon.svg', "main", "결제 내역", MypayInfo()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            listLine(8, double.infinity, HexColor("#d5d5d5"), 0.5),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    MypageMenu(listTitle: "1:1 문의 내역", widget: DirectQuestion()),
                    MypageMenu(listTitle: "고객센터", widget: ServiceCenterInfo()),
                    MypageMenu(listTitle: "서비스 정책", widget: ServicePolicyInfo()),
                    MypageMenu(listTitle: "공지사항", widget: AnnouncementInfo()),
                    MypageMenu(listTitle: "로그아웃", widget: NameUpdate()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // appbar icon style 설정
  Widget iconStyle(String icon, String filename, Color iconColor) {
    return SvgPicture.asset(
      "assets/icons/" + filename + "/" + icon,
      width: 25,
      height: 25,
      color: iconColor,
    );
  }

  // icon 버튼
  Widget iconwrapBtn(String icon, String fileName, String btnText, Widget widget) {
    return Container(
      width: 70,
      child: InkWell(
        onTap: (){
          Get.to(widget);
        },
        child: Column(
          children: [
            SvgPicture.asset("assets/icons/" + fileName + "/" + icon),
            Text(btnText),
          ],
        ),
      ),
    );
  }

  // list 구별 선
  Widget listLine(
      double height, double width, Color lineColor, double opacity) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      height: height,
      width: width,
      decoration: BoxDecoration(color: lineColor.withOpacity(opacity)),
    );
  }

}
