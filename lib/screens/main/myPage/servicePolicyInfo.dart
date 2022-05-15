import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/directQuestion.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageMenu.dart';
import 'package:amuz_nidlecrew/widgets/myPage/userInfoMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ServicePolicyInfo extends StatefulWidget {
  const ServicePolicyInfo({Key? key}) : super(key: key);

  @override
  State<ServicePolicyInfo> createState() => _ServicePolicyInfoState();
}

class _ServicePolicyInfoState extends State<ServicePolicyInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(title: "서비스 정책", icon: "", widget: MainHome(),appbar: AppBar()),
      body: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    listMenu("서비스 이용 약관", true, DirectQuestion()),
                    listMenu("개인정보 처리 방침", false, DirectQuestion()),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }



  // list menu
  Widget listMenu(String listTitle, bool isLine, Widget widget){
    return InkWell(
      onTap: () {
        Get.to(widget);
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
                Icon(CupertinoIcons.forward, size: 20, color: HexColor("#909090"),),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            isLine == true
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
