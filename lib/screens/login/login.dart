import 'package:needlecrew/getxController/homeController.dart';
import 'package:needlecrew/widgets/baseAppbar.dart';
import 'package:needlecrew/widgets/circleBlackBtn.dart';
import 'package:needlecrew/widgets/circleIconBtn.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:needlecrew/db/wp-api.dart' as wp_api;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final HomeController homeController = Get.put(HomeController());

  ScrollController _scrollController = ScrollController();

  List<TextEditingController> controller = [];

  String currentField = "";

  @override
  void initState() {
    for (int i = 0; i < 2; i++) {
      controller.add(TextEditingController());
    }

    homeController.loginCheck.value = "";
    super.initState();
  }

  @override
  void dispose() {
    for (int i = 0; i < 2; i++) {
      controller[i].dispose();
    }
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState((){
          currentField = "";
        });
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
                        text: "??????????????? ??????",
                        fontsize: "lg",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                    FontStyle(
                        text: "???????????????????",
                        fontsize: "lg",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                  ],
                ),
              ),
              SizedBox(
                height: 42,
              ),
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    loginTextField("????????? ??????", controller[0], '????????? ????????? ??????????????????.'),
                    SizedBox(
                      height: 24,
                    ),
                    loginTextField("????????????", controller[1], '??????????????? ??????????????????.'),
                    SizedBox(
                      height: 24,
                    ),
                    submitBtn("?????????"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "???????????? ????????? ????????????????",
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/join');
                    },
                    child: Text(
                      "????????????",
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

  // textfield custom
  Widget loginTextField(
      String titleText, TextEditingController controller, String hintText) {

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Container(
            child: TextField(
              onChanged: (value) {
                setState(() {});
              },
              onTap: (){
                setState((){
                  currentField = titleText;
                });
              },
              onEditingComplete: (){
                setState((){
                  currentField = "";
                });
                FocusScope.of(context).unfocus();
              },
              controller: controller,
              obscureText: titleText == "????????????" ? true : false,
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
                suffixIcon: controller.text.isNotEmpty && currentField == titleText
                    ? IconButton(
                        onPressed: () {
                          controller.clear();
                          setState(() {});
                        },
                        icon:
                            SvgPicture.asset("assets/icons/xmarkIcon_full.svg"))
                    : Container(height: 0, width: 0,),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(() {
            if (homeController.isInitialized.value) {
              return homeController.loginCheck != "" &&
                      titleText == "????????? ??????" &&
                      homeController.loginCheck.indexOf('?????????') != -1
                  ? Text(
                      homeController.loginCheck.value,
                      style: TextStyle(color: Colors.red),
                    )
                  : Container(
                      height: 0,
                    );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
          Obx(() {
            if (homeController.isInitialized.value) {
              return homeController.loginCheck != "" &&
                      titleText == "????????????" &&
                      homeController.loginCheck.indexOf('????????????') != -1
                  ? Text(
                      homeController.loginCheck.value,
                      style: TextStyle(color: Colors.red),
                    )
                  : Container(
                      height: 0,
                    );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ],
      ),
    );
  }

  // btn style
  Widget submitBtn(String btnText) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        shape: BoxShape.rectangle,
        color: Colors.black,
      ),
      child: TextButton(
        onPressed: () {
          if (btnText == "?????????") {
            if (controller[0].text.length > 0 &&
                controller[1].text.length > 0) {
              homeController.loginUser(controller[0].text, controller[1].text);
              homeController.LoginUs(homeController.userEmail.value,
                  homeController.userPassword.value);
              print("logincheck this    " + homeController.loginCheck.value);
            } else {
              Get.snackbar('?????????', '????????? ????????? ??????????????? ??????????????????');
            }
          }
        },
        child: Text(
          btnText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
