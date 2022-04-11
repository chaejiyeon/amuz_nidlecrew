import 'package:amuz_nidlecrew/widgets/baseAppbar.dart';
import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/circleIconBtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../widgets/loginTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: BaseAppBar(appbar: AppBar()),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 24),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleText("니들크루를 함께"),
                titleText("시작해볼까요?"),
              ],
            ),
          ),
          SizedBox(
            height: 95,
          ),
          Container(
            child: Column(
              children: [
                LoginTextField(hintText: '휴대폰 번호 입력', btnText: "인증요청"),
                SizedBox(
                  height: 23,
                ),
                LoginTextField(hintText: '인증번호 입력', btnText: "재 요청"),
                Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 24, top: 19, bottom: 22),
                  child: Row(
                    children: [
                      Checkbox(
                        side: BorderSide(
                          color: HexColor("#d5d5d5"),
                        ),
                        value: ischecked,
                        onChanged: (value) {
                          setState(
                            () {
                              ischecked = value!;
                            },
                          );
                        },
                      ),
                      Text(
                        "로그인 상태 유지",
                        style: TextStyle(
                          color: HexColor("#606060"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          CircleBlackBtn(btnText: "로그인", pageName: "main"),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24, top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleIconBtn(
                  icon: "naver.png",
                ),
                CircleIconBtn(
                  icon: "kakao.png",
                ),
                CircleIconBtn(
                  icon: "facebook.png",
                ),
                CircleIconBtn(
                  icon: "google.png",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// titleText style
  Widget titleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
