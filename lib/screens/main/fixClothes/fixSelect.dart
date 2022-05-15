import 'package:amuz_nidlecrew/modal/fixSelectModal.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/addressInsert.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/fixQuestion.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/imageUpload.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/checkBtn.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/circleLineTextField.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/header.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/progressbar.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class FixSelect extends StatefulWidget {
  const FixSelect({Key? key}) : super(key: key);

  @override
  State<FixSelect> createState() => _FixSelectState();
}

class _FixSelectState extends State<FixSelect> {
  final maxLines = 10;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: FixClothesAppBar(
          appbar: AppBar(),
        ),
        body: Container(
          child: ListView(
            children: [
              // progressbar
              Container(
                alignment: Alignment.topLeft,
                child: ProgressBar(progressImg: "fixProgressbar_2.svg"),
              ),

              // header
              Header(
                title: "수선 선택",
                subtitle1: "",
                subtitle2: "",
                question: true,
                btnIcon: "rollIcon.svg",
                btnText: "치수 측정 가이드",
                widget: FixQuestion(),
                imgPath: "fixClothes",
                bottomPadding: 35  ,
              ),

              // 일반 바지
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "일반 바지",
                        fontsize: "md",
                        fontbold: "bold",
                        fontcolor: Colors.black,textdirectionright: false),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FontStyle(
                            text: "총 기장 줄임",
                            fontsize: "",
                            fontbold: "",
                            fontcolor: Colors.black,textdirectionright: false),
                        Row(
                          children: [
                            FontStyle(
                                text: "5,000",
                                fontsize: "md",
                                fontbold: "bold",
                                fontcolor: HexColor("#fd9a03"),textdirectionright: false),
                            FontStyle(
                                text: "원",
                                fontsize: "",
                                fontbold: "",
                                fontcolor: Colors.black,textdirectionright: false),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // 의뢰 방법
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "의뢰 방법",
                        fontsize: "md",
                        fontbold: "bold",
                        fontcolor: Colors.black,textdirectionright: false),
                    CheckBtn(list: "원하는 총 기장 길이 입력"),
                    CheckBtn(list: "줄이고 싶은 만큼 치수 입력"),
                    CheckBtn(list: "잘 맞는 옷을 함께 보낼게요."),
                  ],
                ),
              ),

              // 치수 입력
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FontStyle(
                            text: "치수 입력",
                            fontsize: "md",
                            fontbold: "bold",
                            fontcolor: Colors.black,textdirectionright: false),
                        mysizeInsert(),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "줄이고 싶은 만큼의 치수를 입력해주세요.",
                          hintStyle: TextStyle(
                              color: HexColor("#909090").withOpacity(0.7)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: HexColor("#d5d5d5"),
                            ),
                          )),
                    ),
                  ],
                ),
              ),

              // 사진 업로드
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "사진 업로드",
                        fontsize: "md",
                        fontbold: "bold",
                        fontcolor: Colors.black,textdirectionright: false),
                    SizedBox(
                      height: 10,
                    ),
                    ImageUpload(icon: "cameraIcon.svg"),
                  ],
                ),
              ),

              // 추가 설명
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "추가 설명",
                        fontsize: "md",
                        fontbold: "bold",
                        fontcolor: Colors.black,textdirectionright: false),
                    SizedBox(
                      height: 10,
                    ),

                    CircleLineTextField(maxLines: maxLines, hintText: "추가로 설명할 부분을 입력해주세요.", hintTextColor: HexColor("#909090"), borderRadius: 10, borderSideColor: HexColor("#d5d5d5"), widthOpacity: true),
                  ],
                ),
              ),

              // 추가 옵션
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "추가 옵션",
                        fontsize: "md",
                        fontbold: "bold",
                        fontcolor: Colors.black,textdirectionright: false),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CheckBtn(list: "밑통 수선"),
                        Row(
                          children: [
                            FontStyle(
                                text: "+15,000",
                                fontsize: "md",
                                fontbold: "bold",
                                fontcolor: Colors.black,textdirectionright: false),
                            FontStyle(
                                text: "원",
                                fontsize: "md",
                                fontbold: "",
                                fontcolor: Colors.black,textdirectionright: false),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // 고정 bottom navigation
        bottomNavigationBar: InkWell(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: HexColor("#d5d5d5").withOpacity(0.1),
                  spreadRadius: 10,
                  blurRadius: 5,
                ),
              ],
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    FontStyle(
                        text: "예상비용 : ",
                        fontsize: "md",
                        fontbold: "bold",
                        fontcolor: Colors.black,textdirectionright: false),
                    FontStyle(
                        text: "5,000",
                        fontsize: "md",
                        fontbold: "bold",
                        fontcolor: Colors.black,textdirectionright: false),
                    FontStyle(
                        text: "원",
                        fontsize: "md",
                        fontbold: "",
                        fontcolor: Colors.black,textdirectionright: false),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      CupertinoIcons.question_circle,
                      size: 20,
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    Get.to(AddressInsert());
                  },
                  child: SvgPicture.asset("assets/icons/floatingNext.svg"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 내 치수 불러오기 버튼
  Widget mysizeInsert() {
    return InkWell(
      onTap: () {
        Get.dialog(FixSelectModal());
      },
      child: Row(
        children: [
          FontStyle(
              text: "내 치수 불러오기",
              fontsize: "",
              fontbold: "",
              fontcolor: Colors.black,textdirectionright: false),
          Icon(
            CupertinoIcons.chevron_forward,
            size: 16,
          ),
        ],
      ),
    );
  }
}
