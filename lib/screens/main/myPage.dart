import 'package:needlecrew/getxController/homeController.dart';
import 'package:needlecrew/modal/mypage/userLogoutYesNo.dart';
import 'package:needlecrew/screens/main/mainHome.dart';
import 'package:needlecrew/screens/main/myPage/announcementInfo.dart';
import 'package:needlecrew/screens/main/myPage/directQuestion.dart';
import 'package:needlecrew/screens/main/myPage/myPayInfo.dart';
import 'package:needlecrew/screens/main/myPage/mysizeInfo.dart';
import 'package:needlecrew/screens/main/myPage/serviceCenterInfo.dart';
import 'package:needlecrew/screens/main/myPage/servicePolicyInfo.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:needlecrew/widgets/myPage/mypageMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'myPage/userInfo.dart';
import 'package:needlecrew/db/wp-api.dart' as wp_api;

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String? name = "";

  Future<void> username() async {
    name = await wp_api.storage.read(key: 'username');
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

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
                            fontcolor: Colors.black,
                            textdirectionright: false),
                        iconStyle("alramIcon.svg", "main", Colors.black),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder(
                            future: username(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                return FontStyle(
                                    text: controller.user.lastName.toString() +
                                        controller.user.firstName.toString() +
                                        "???",
                                    fontbold: "bold",
                                    fontsize: "lg",
                                    fontcolor: Colors.black,
                                    textdirectionright: false);
                              } else {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                            }),
                        // Obx(() {
                        //   if (controller.isInitialized.value) {
                        //     return FontStyle(
                        //         text: controller.user.lastName.toString() +
                        //             controller.user.firstName.toString() +
                        //             "???",
                        //         fontbold: "bold",
                        //         fontsize: "lg",
                        //         fontcolor: Colors.black,
                        //         textdirectionright: false);
                        //   } else {
                        //     return Center(
                        //       child: CircularProgressIndicator(),
                        //     );
                        //   }
                        // }),
                        Text("??????????????? ??????"),
                        Text("????????? ?????? ????????? ???????????????!"),
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
                        iconwrapBtn(
                            'userwrapIcon.svg', "main", "?????? ??????", UserInfo()),
                        iconwrapBtn(
                            'mysizeIcon.svg', "main", "??? ??????", MySizeInfo()),
                        iconwrapBtn(
                            'payinfoIcon.svg', "main", "?????? ??????", MypayInfo()),
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
                padding: EdgeInsets.only(top: 10, left: 24, right: 24),
                child: Column(
                  children: [
                    MypageMenu(listTitle: "????????????", widget: ServiceCenterInfo()),
                    MypageMenu(
                        listTitle: "????????? ??????", widget: ServicePolicyInfo()),
                    MypageMenu(listTitle: "?????? ??????", widget: DirectQuestion()),
                    MypageMenu(listTitle: "????????????", widget: AnnouncementInfo()),
                    MypageMenu(
                        listTitle: "????????????",
                        widget: UserLogoutYesNo(
                          titleText: "???????????? ???????????????????",
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // appbar icon style ??????
  Widget iconStyle(String icon, String filename, Color iconColor) {
    return SvgPicture.asset(
      "assets/icons/" + filename + "/" + icon,
      width: 25,
      height: 25,
      color: iconColor,
    );
  }

  // icon ??????
  Widget iconwrapBtn(
      String icon, String fileName, String btnText, Widget widget) {
    return Container(
      width: 70,
      child: GestureDetector(
        onTap: () {
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

  // list ?????? ???
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
