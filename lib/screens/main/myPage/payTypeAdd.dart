import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/mainhome/priceInfo/priceDropdown.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageDropDown.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PayTypeAdd extends StatefulWidget {
  const PayTypeAdd({Key? key}) : super(key: key);

  @override
  State<PayTypeAdd> createState() => _PayTypeAddState();
}

class _PayTypeAddState extends State<PayTypeAdd> {


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: MypageAppBar(title: "결제 수단 추가 등록", icon: "", widget: MainHome(), appbar: AppBar()),
        body: Container(
          child: Column(
            children: [

              // 이름 입력
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "이름",
                        fontsize: "",
                        fontbold: "",
                        fontcolor: Colors.black,textdirectionright: false),
                    SizedBox(
                      height: 10,
                    ),
                    textForm(""),
                  ],
                ),
              ),

              // 이메일 입력
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "이메일",
                        fontsize: "",
                        fontbold: "",
                        fontcolor: Colors.black,textdirectionright: false),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: textForm(""),
                        ),
                        Container(
                            width: 150,
                            child: MypageDropDown(
                              selectNum: 4,
                              hintCheck: true,
                              hint: "직접입력",
                            )),
                      ],
                    ),
                  ],
                ),
              ),

              // 카드번호 입력
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "카드 번호",
                        fontsize: "",
                        fontbold: "",
                        fontcolor: Colors.black,textdirectionright: false),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(width: 80, child: textForm("")),
                        Container(width: 80, child: textForm("")),
                        Container(width: 80, child: textForm("")),
                        Container(width: 80, child: textForm("")),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // 유효기간
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FontStyle(
                              text: "유효기간",
                              fontsize: "",
                              fontbold: "",
                              fontcolor: Colors.black,textdirectionright: false),
                          SizedBox(height: 10,),
                          textForm("MM/YY"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 170,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FontStyle(
                              text: "비밀번호 앞 두자리",
                              fontsize: "",
                              fontbold: "",
                              fontcolor: Colors.black,textdirectionright: false),
                          SizedBox(height: 10,),
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
                                  fontcolor: Colors.black,textdirectionright: false),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 10,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(text: "생년월일 6자리", fontsize: "", fontbold: "", fontcolor: Colors.black,textdirectionright: false),
                    SizedBox(height: 10,),
                    textForm("-빼고 입력해주세요."),
                  ],
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: Container(
            padding: EdgeInsets.all(20),
            child: CircleBlackBtn(btnText: "등록하기", pageName: "payTypeAddConfirm")),
      ),
    );
  }

  Widget textForm(String hinttxt) {
    return TextField(
      textAlign: hinttxt == "MM/YY" ? TextAlign.center : TextAlign.left,
      decoration: InputDecoration(
        hintText: hinttxt != "" ? hinttxt : "",
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: HexColor("#d5d5d5")),
        ),
      ),
    );
  }
}
