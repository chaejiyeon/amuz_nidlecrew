import 'package:amuz_nidlecrew/widgets/baseAppbar.dart';
import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/circleIconBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
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
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar(appbar: AppBar()),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FontStyle(text: "니들크루를 함께", fontsize: "lg", fontbold: "bold", fontcolor: Colors.black),
                      FontStyle(text: "시작해볼까요?", fontsize: "lg", fontbold: "bold", fontcolor: Colors.black),
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
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 19, bottom: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                  padding: EdgeInsets.all(30),
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
          ),
        ),
      ),
    );
  }

}
