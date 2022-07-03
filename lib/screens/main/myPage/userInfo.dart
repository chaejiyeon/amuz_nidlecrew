import 'package:amuz_nidlecrew/getxController/homeController.dart';
import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/userUpdate.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:amuz_nidlecrew/widgets/myPage/userInfoMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(
          title: "회원 정보",
          icon: "updateIcon.svg",
          widget: UserUpdate(),
          appbar: AppBar()),
      body: SafeArea(
        child: Obx(() {
          if (controller.isInitialized.value) {
            return Container(
              padding: EdgeInsets.all(30),
              color: Colors.white,
              child: Column(
                children: [
                  UserInfoMenu(
                      appTitle: "회원 정보",
                      title: "이름",
                      info: controller.user.lastName.toString() +
                          controller.user.firstName.toString(),
                      line: true),
                  UserInfoMenu(
                      appTitle: "회원 정보",
                      title: "전화번호",
                      info: controller.user.phoneNum != null ? controller.user.phoneNum.toString() : "",
                      line: true),
                  UserInfoMenu(
                      appTitle: "회원 정보",
                      title: "주소",
                      info: controller.user.defaultAddress != null
                          ? controller.user.defaultAddress.toString()
                          : "",
                      line: true),
                  UserInfoMenu(
                      appTitle: "회원 정보",
                      title: "결제 수단",
                      info: "롯데카드(4892)",
                      line: false),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}
