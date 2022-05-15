import 'package:amuz_nidlecrew/db/wp-api.dart';
import 'package:amuz_nidlecrew/main.dart';
import 'package:amuz_nidlecrew/screens/login/startPage.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class MypageMenu extends StatelessWidget {
  final String listTitle;
  final Widget widget;

  const MypageMenu({Key? key, required this.listTitle, required this.widget})
      : super(key: key);
  
  
  // void logout(context){
  //   int count = 0;
  //   FlutterNaverLogin.logOut();
  //   Navigator.popUntil(context, (route) {
  //     return count++ == 3;
  //   });
  //   print("로그아웃");
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if(listTitle == "로그아웃"){
          logOut();
        }else{
          Get.to(widget);
        }
      },
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 3),
                    child: Text(
                      listTitle,
                    )),
                SvgPicture.asset(
                  "assets/icons/nextIcon.svg",
                  color: HexColor("#909090"),
                  height: 16,
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            listTitle != "로그아웃" && listTitle != "회원 탈퇴"
                ? ListLine(
                    height: 1,
                    width: double.infinity,
                    lineColor: HexColor("#d5d5d5"),
                    opacity: 1.0)
                : Container(),
          ],
        ),
      ),
    );
  }
}
