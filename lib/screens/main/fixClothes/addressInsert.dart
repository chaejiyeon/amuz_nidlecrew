import 'package:amuz_nidlecrew/bottomsheet/fixAddressBottomSheetHeader.dart';
import 'package:amuz_nidlecrew/bottomsheet/fixMyAddressList.dart';
import 'package:amuz_nidlecrew/models/addressItem.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/takeFixdate.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../widgets/fixClothes/progressbar.dart';

class AddressInsert extends StatefulWidget {
  const AddressInsert({Key? key}) : super(key: key);

  @override
  State<AddressInsert> createState() => _AddressInsertState();
}

class _AddressInsertState extends State<AddressInsert> {
  List<AddressItem> addressitems = [
    AddressItem("assets/icons/myPage/mypageHome_1.svg", "우리집",
        "부산 강서구 명지국제3로 97 105동 221호")
  ];

  // 주소 관리 bottomsheet
  void bottomsheetOpen(BuildContext context) {
    showStickyFlexibleBottomSheet(
        minHeight: 0,
        initHeight: 0.5,
        maxHeight: 0.5,
        context: context,
        bottomSheetColor: HexColor("#909090").withOpacity(0.2),
        decoration: BoxDecoration(
          color: HexColor("#f5f5f5"),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        headerHeight: 85,
        headerBuilder: (context, offset) {
          return addressitems.length != 0
              ? FixAddressBottomSheetHeader(
                  addressExist: true,
                )
              : FixAddressBottomSheetHeader(
                  addressExist: false,
                );
        },
        bodyBuilder: (context, offset) {
          return SliverChildListDelegate([
            addressitems.length != 0
                ? FixMyAddressList(
                    addressExist: true,
                    items: addressitems,
                  )
                : FixMyAddressList(
                    addressExist: false,
                    items: addressitems,
                  )
          ]);
        });
  }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProgressBar(progressImg: "fixProgressbar_3.svg"),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "주소 입력",
                        fontsize: "lg",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                    FontStyle(
                        text: "수거된 의류는 결제일로부터 3~4일 후\n수선사에게 도착합니다.",
                        fontsize: "",
                        fontbold: "",
                        fontcolor: Colors.black.withOpacity(0.7),
                        textdirectionright: false),
                    Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          insertTextfield("지번,도로명,건물명 검색"),
                          insertTextfield("상세주소"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: myaddressBtn(),
      ),
    );
  }

  // address 입력 필드
  Widget insertTextfield(String hintTxt) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintText: hintTxt,
            hintStyle: TextStyle(color: HexColor("#909090")),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                  color: HexColor("#909090"),
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(
                  color: HexColor("#909090").withOpacity(0.5),
                ))),
      ),
    );
  }

  // bottomnavigation 버튼
  Widget myaddressBtn() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              bottomsheetOpen(context);
            },
            child: Container(
              width: 150,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: HexColor("#fd9a03"),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FontStyle(
                      text: "내 주소",
                      fontcolor: HexColor("#fd9a03"),
                      fontsize: "",
                      fontbold: "",
                      textdirectionright: false),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(CupertinoIcons.chevron_up,
                      color: HexColor("#fd9a03"), size: 15),
                ],
              ),
            ),
          ),

          // 수거 희망일 페이지로이동
          InkWell(
            onTap: (){
              Get.to(TakeFixDate());
            },
            child: SvgPicture.asset(
              "assets/icons/floatingNext.svg",
              color: HexColor("#d5d5d5"),
            ),
          ),
        ],
      ),
    );
  }
}
