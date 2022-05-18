import 'package:amuz_nidlecrew/widgets/baseAppbar.dart';
import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/circleIconBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/loginTextField.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  ScrollController _scrollController = ScrollController();

  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    bool ischecked = false;


    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: BaseAppBar(appbar: AppBar()),
        body: Container(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FontStyle(
                          text: "니들크루를 함께",
                          fontsize: "lg",
                          fontbold: "bold",
                          fontcolor: Colors.black,
                          textdirectionright: false),
                      FontStyle(
                          text: "시작해볼까요?",
                          fontsize: "lg",
                          fontbold: "bold",
                          fontcolor: Colors.black,
                          textdirectionright: false),
                    ],
                  ),
                ),
                SizedBox(
                  height: 95,
                ),
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      LoginTextField(hintText: '휴대폰 번호 입력', btnText: "인증요청",scrollController: _scrollController),
                      SizedBox(
                        height: 24,
                      ),
                      LoginTextField(hintText: '인증번호 입력', btnText: "재 요청",scrollController: _scrollController),
                      SizedBox(
                        height: 50,
                      ),
                      CircleBlackBtn(btnText: "로그인", pageName: "main"),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "니들크루 회원이 아니신가요?",
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed('/join');
                      },
                      child:Text(
                        "회원가입",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 64, right: 63, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleIconBtn(
                        icon: "naver.png",
                        loginwith: "naver",
                      ),
                      CircleIconBtn(
                        icon: "kakao.png",
                        loginwith: "kakao",
                      ),
                      CircleIconBtn(
                        icon: "apple.png",
                        loginwith: "apple",
                      ),
                      CircleIconBtn(
                        icon: "googleIcon.png",
                        loginwith: "google",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
