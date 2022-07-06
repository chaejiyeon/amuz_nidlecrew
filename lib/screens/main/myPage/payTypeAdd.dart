import 'package:needlecrew/getxController/fixClothes/CartController.dart';
import 'package:needlecrew/screens/main/mainHome.dart';
import 'package:needlecrew/widgets/circleBlackBtn.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:needlecrew/widgets/mainhome/priceInfo/priceDropdown.dart';
import 'package:needlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:needlecrew/widgets/myPage/mypageDropDown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class PayTypeAdd extends StatefulWidget {
  final bool isFirst;

  const PayTypeAdd({Key? key, required this.isFirst}) : super(key: key);

  @override
  State<PayTypeAdd> createState() => _PayTypeAddState();
}

class _PayTypeAddState extends State<PayTypeAdd> {
  late ScrollController scrollController = ScrollController();

  @override
  void initState(){
    super.initState();
  }




  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        scrollController.animateTo(0, duration: Duration(milliseconds: 1), curve: Curves.linear);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: MypageAppBar(
            title: widget.isFirst == true ? "결제 수단 등록" : "결제 수단 추가 등록",
            icon: "",
            widget: MainHome(),
            appbar: AppBar()),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 24, right: 24, top: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 이름 입력
                FontStyle(
                    text: "이름",
                    fontsize: "",
                    fontbold: "",
                    fontcolor: Colors.black,
                    textdirectionright: false),
                SizedBox(
                  height: 10,
                ),
                textForm(""),
                SizedBox(
                  height: 10,
                ),

                // 이메일 입력
                FontStyle(
                    text: "이메일",
                    fontsize: "",
                    fontbold: "",
                    fontcolor: Colors.black,
                    textdirectionright: false),
                SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: textForm(""),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        width: 113,
                        child: MypageDropDown(
                          selectNum: 4,
                          hintCheck: true,
                          hint: "직접입력",
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                // 카드번호 입력
                FontStyle(
                    text: "카드 번호",
                    fontsize: "",
                    fontbold: "",
                    fontcolor: Colors.black,
                    textdirectionright: false),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(width: 74, child: textForm("")),
                    Container(width: 74, child: textForm("")),
                    Container(width: 74, child: textForm("")),
                    Container(width: 74, child: textForm("")),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                // 유효기간
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FontStyle(
                              text: "유효기간",
                              fontsize: "",
                              fontbold: "",
                              fontcolor: Colors.black,
                              textdirectionright: false),
                          SizedBox(
                            height: 10,
                          ),
                          textForm("MM/YY"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FontStyle(
                              text: "비밀번호 앞 두자리",
                              fontsize: "",
                              fontbold: "",
                              fontcolor: Colors.black,
                              textdirectionright: false),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(width: 80, child: textForm("")),
                              SizedBox(
                                width: 10,
                              ),
                              FontStyle(
                                  text: "**",
                                  fontsize: "",
                                  fontbold: "",
                                  fontcolor: HexColor("#909090"),
                                  textdirectionright: false),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),

                // 생년월일
                FontStyle(
                    text: "생년월일 6자리",
                    fontsize: "",
                    fontbold: "",
                    fontcolor: Colors.black,
                    textdirectionright: false),
                SizedBox(
                  height: 10,
                ),
                textForm("-빼고 입력해주세요."),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
            padding: EdgeInsets.all(20),
            child: widget.isFirst == true
                ? CircleBlackBtn(btnText: "완료", pageName: "payTypeAddConfirmFirst")
                : CircleBlackBtn(
                    btnText: "등록하기", pageName: "payTypeAddConfirm")),
      ),
    );
  }

  // textfield form
  Widget textForm(String hinttxt) {
    return TextField(
      onTap: () {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      },
      textAlign: hinttxt == "MM/YY" ? TextAlign.center : TextAlign.left,
      decoration: InputDecoration(
        hintText: hinttxt != "" ? hinttxt : "",
        hintStyle: TextStyle(color: HexColor("#909090")),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: HexColor("#ededed")),
        ),
      ),
    );
  }

}

