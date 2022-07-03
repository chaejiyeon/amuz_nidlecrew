import 'dart:async';

import 'package:amuz_nidlecrew/getxController/homeController.dart';
import 'package:amuz_nidlecrew/widgets/baseAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:amuz_nidlecrew/db/wp-api.dart' as wp_api;

class UserPhoneInsert extends StatefulWidget {
  const UserPhoneInsert({Key? key}) : super(key: key);

  @override
  State<UserPhoneInsert> createState() => _UserPhoneInsertState();
}

class _UserPhoneInsertState extends State<UserPhoneInsert> {
  final HomeController homeController = Get.put(HomeController());
  ScrollController _scrollController = ScrollController();
  List editingcontroller = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool sendMessage = false;

  late Timer timer;

  int limitTime = 180;

  String time = "";

  String confirmAuth = "인증번호가 발송되었습니다.";

  void setTime() {
    double minute;
    int second;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (limitTime <= 0) {
          timer.cancel();
          limitTime = 180;
          time = "";
        } else {
          limitTime -= 1;
          minute = (limitTime % 3600) / 60;
          second = (limitTime % 60) % 60;

          if (second < 10) {
            time = minute.floor().toString() + " : 0" + second.toString();
          } else {
            time = minute.floor().toString() + " : " + second.toString();
          }
          // time = limitTime.toString();
        }
      });
    });
  }

  @override
  void initState() {
    for (int i = 0; i < 2; i++) {
      editingcontroller.add(TextEditingController());
    }
    super.initState();
  }

  @override
  void dispose() {
    for (int i = 0; i < 2; i++) {
      editingcontroller[i].dispose();
    }
    _scrollController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: BaseAppBar(
          appbar: AppBar(),
        ),
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
                        text: "고객님의 정보를",
                        fontsize: "lg",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                    FontStyle(
                        text: "입력해주세요",
                        fontsize: "lg",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      phoneNumInsert(
                          "휴대폰 번호", "'-'구분없이 입력", "인증요청", editingcontroller[0]),
                      phoneNumInsert(
                          "인증번호", "인증번호 입력", "확인", editingcontroller[1]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 100,
          padding: EdgeInsets.only(right: 24, bottom: 15),
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: () {
              wp_api.joinUs(
                  homeController.userJoin[0],
                  homeController.userJoin[1],
                  homeController.userJoin[2],
                  editingcontroller[0].text);
              print("join user this " +
                  homeController.userJoin.toString() +
                  editingcontroller[0].text);

              // 문자 인증 성공시 메인화면으로 이동
              if(confirmAuth == "인증이 완료되었습니다."){}
              Get.toNamed("/mainHome");
            },
            child: SvgPicture.asset(
              'assets/icons/floatingNext.svg',
              color: editingcontroller[0].text.length > 0 &&
                      editingcontroller[1].text.length > 0
                  ? HexColor("fd9a03")
                  : HexColor("#d5d5d5"),
            ),
          ),
        ),
      ),
    );
  }

  // textfield custom
  Widget phoneNumInsert(String titleText, String hintText, String btnText,
      TextEditingController controller) {
    return Container(
      padding: EdgeInsets.only(bottom: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          titleText,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                child: TextFormField(
                  validator: (value) {},
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                  },
                  keyboardType: TextInputType.number,
                  controller: controller,
                  onTap: () {
                    _scrollController.animateTo(120.0,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor("#d5d5d5"),
                      ),
                    ),
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: HexColor("#d5d5d5"),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                if (btnText == "인증요청" || btnText == "재요청") {
                  setState(() {
                    sendMessage = true;
                  });
                  setTime();
                }
                if (btnText == "확인") {

                }
              },
              child: Container(
                alignment: Alignment.center,
                width: 87,
                height: 36,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: HexColor("#d5d5d5"))),
                child: Text(
                    sendMessage == true && btnText == "인증요청" ? "재요청" : btnText),
              ),
            ),
          ],
        ),
        sendMessage == true && titleText == "인증번호"
            ? Container(
                padding: EdgeInsets.only(top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    time != ""
                        ? Text(
                            confirmAuth,
                            style: TextStyle(color: confirmAuth == "인증이 완료되었습니다." ? HexColor("#fd9a03") : Colors.red, fontSize: 13),
                          )
                        : Container(
                            height: 0,
                          ),
                    Container(
                        padding: EdgeInsets.only(right: 105),
                        child: Text(
                          time,
                          style: TextStyle(color: Colors.red, fontSize: 13),
                        )),
                  ],
                ),
              )
            : Container(
                height: 0,
              ),
      ]),
    );
  }
}
