import 'package:needlecrew/modal/mypage/userJoinOutDialog.dart';
import 'package:needlecrew/screens/main/mainHome.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:needlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:needlecrew/widgets/myPage/mypageDropDown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class UserJoinOut extends StatefulWidget {
  const UserJoinOut({Key? key}) : super(key: key);

  @override
  State<UserJoinOut> createState() => _UserJoinOutState();
}

class _UserJoinOutState extends State<UserJoinOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(title: "회원탈퇴", icon: "", widget: MainHome(),appbar: AppBar()),
      body: Container(
        color: HexColor("#d5d5d5").withOpacity(0.3),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Colors.white,
              height: 300,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FontStyle(
                      text:
                          "더 나은 니들크루가 되기 위해 사용하시면서 불편하셨던\n점이나 불편사항을 알려주시면 적극 반영하여 앞으로의\n불편함을 해결하도록 노력하겠습니다.",
                      fontsize: "",
                      fontbold: "",
                      fontcolor: Colors.black,textdirectionright: false),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FontStyle(
                            text: "회원탈퇴 안내",
                            fontsize: "",
                            fontbold: "bold",
                            fontcolor: Colors.black,textdirectionright: false),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FontStyle(
                                text: "1. ",
                                fontsize: "",
                                fontbold: "bold",
                                fontcolor: Colors.black,textdirectionright: false),
                            Expanded(
                              child: Text("회원 탈퇴 시 고객님의 정보는 1년간 전자상거래 소비자 보호에 관한 법률에 의거한 고객 정보 보호정책에 따라 관리됩니다.")
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FontStyle(
                                text: "2. ",
                                fontsize: "",
                                fontbold: "bold",
                                fontcolor: Colors.black,textdirectionright: false),
                            Expanded(
                              child: Text("회원 탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가능하오니 신중하게 선택하시길 바랍니다.")
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "무엇이 불편하셨나요?",
                        fontsize: "",
                        fontbold: "bold",
                        fontcolor: Colors.black,textdirectionright: false),
                    MypageDropDown(
                      hintCheck: true,
                      selectNum: 2,
                      hint: "불편사항을 선택해주세요.",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: circleBtn(
              UserJoinOutDialog(
                titleText: "정말 회원 탈퇴하시겠습니까?",
              ),
              "탈퇴하기")),
    );
  }

  // 탈퇴하기 버튼
  Widget circleBtn(Widget widget, String btnText) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        shape: BoxShape.rectangle,
        color: Colors.black,
      ),
      child: TextButton(
        onPressed: () {
          Get.dialog(widget);
        },
        child: Text(
          btnText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
