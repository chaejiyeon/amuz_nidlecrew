import 'package:needlecrew/getxController/homeController.dart';
import 'package:needlecrew/getxController/useInfo/useInfoController.dart';
import 'package:needlecrew/screens/join/userPhoneInsert.dart';
import 'package:needlecrew/screens/mainPage.dart';
import 'package:needlecrew/widgets/baseAppbar.dart';
import 'package:needlecrew/widgets/floatingNextBtn.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class UserInfoInsert extends StatefulWidget {
  const UserInfoInsert({Key? key}) : super(key: key);

  @override
  State<UserInfoInsert> createState() => _UserInfoInsertState();
}

class _UserInfoInsertState extends State<UserInfoInsert> {
  final HomeController homeController = Get.put(HomeController());
  ScrollController _scrollController = ScrollController();
  List<TextEditingController> editingcontroller = [];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool availablePassword = false;
  String passwordAlert = "";
  String currentField = "";

  @override
  void initState() {
    for (int i = 0; i < 4; i++) {
      editingcontroller.add(TextEditingController());
    }

    super.initState();
  }

  @override
  void dispose() {
    for (int i = 0; i < 4; i++) {
      editingcontroller[i].dispose();
    }
    _scrollController.dispose();
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
                        text: "???????????? ?????????",
                        fontsize: "lg",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                    FontStyle(
                        text: "??????????????????",
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        loginTextField("??????", "?????? ??????", editingcontroller[0]),
                        loginTextField(
                            "????????? ??????", "????????? ?????? ??????", editingcontroller[1]),
                        loginTextField("????????????", "??????/??????/???????????? ?????? 8~16??? ??????",
                            editingcontroller[2]),
                        loginTextField(
                            "???????????? ??????", "??????????????? ?????????????????????.", editingcontroller[3]),
                      ],
                    ),
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
              if (this._formKey.currentState!.validate()) {
                List keyList = ["user_name","email","password","checkPassword"];
                for (int i = 0; i < editingcontroller.length; i++) {
                  homeController.setUserInfo(keyList[i],editingcontroller[i].text);
                }
                Get.to(UserPhoneInsert());
              } else {
                Get.snackbar("????????????", "????????? ????????? ??????????????????!");
              }
            },
            child: SvgPicture.asset(
              'assets/icons/floatingNext.svg',
              color: editingcontroller[0].text.length > 0 &&
                      editingcontroller[1].text.length > 0 &&
                      editingcontroller[2].text.length > 0 &&
                      editingcontroller[3].text.length > 0
                  ? HexColor("fd9a03")
                  : HexColor("#d5d5d5"),
            ),
          ),
        ),
      ),
    );
  }

  // ???????????? ?????? ??????
  Widget loginTextField(
      String titleText, String hintText, TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(bottom: 24),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Container(
            child: TextFormField(
              validator: (value) {
                if (titleText == "??????") {
                  RegExp regExp = new RegExp(r'^([???-???|a-zA-Z])+$');

                  if (value!.length <= 2 || !regExp.hasMatch(value!)) {
                    return "????????? ????????? ??????????????????.";
                  }
                } else if (titleText == "????????? ??????") {
                  RegExp regExp = new RegExp(
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                  if (!regExp.hasMatch(value!)) {
                    return "????????? ????????? ???????????? ????????????.";
                  }
                } else if (titleText == "???????????? ??????") {
                  if (editingcontroller[2].text != value!) {
                    return "??????????????? ???????????? ????????????.";
                  } else {
                    return null;
                  }
                }
              },
              onEditingComplete: () {
                FocusScope.of(context).unfocus();
              },
              keyboardType:
                  titleText == "????????? ??????" ? TextInputType.emailAddress : null,
              obscureText:
                  titleText == "????????????" || titleText == "???????????? ??????" ? true : false,
              controller: controller,
              onTap: () {
                _scrollController.animateTo(120.0,
                    duration: Duration(milliseconds: 500), curve: Curves.ease);
                setState((){
                  currentField = titleText;
                });
              },
              onChanged: (value) {
                setState((){});
                if (titleText == "????????????") {
                  RegExp regExp = new RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$');
                  if(!regExp.hasMatch(value)){
                    setState(() {
                      passwordAlert = "??????/??????/????????????(?????? ??????) ?????? 8~16?????? ??????????????????.";
                      availablePassword = false;
                    });
                  }else{
                    setState(() {
                      passwordAlert = "??????????????? ???????????? ?????????.";
                      availablePassword = true;
                    });
                  }
                }
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
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.clear();
                    setState((){});
                  },
                  icon: controller.text.isNotEmpty && currentField == titleText
                      ? SvgPicture.asset("assets/icons/xmarkIcon_full.svg",)
                      : Container(),
                ),
              ),
            ),
          ),
          titleText == "????????????" && passwordAlert != ""
              ? Container(
                  child: Text(
                    passwordAlert,
                    style: TextStyle(
                        color: availablePassword == true
                            ? Colors.green
                            : Colors.red),
                  ),
                )
              : Container(
                  height: 0,
                ),
        ],
      ),
    );
  }
}
