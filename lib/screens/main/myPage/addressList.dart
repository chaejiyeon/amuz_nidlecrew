import 'dart:ffi';

import 'package:amuz_nidlecrew/modal/addressDelModal.dart';
import 'package:amuz_nidlecrew/models/addressItem.dart';
import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/addressAdd.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/addressUpdate.dart';
import 'package:amuz_nidlecrew/widgets/circleLineBtn.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AddressList extends StatefulWidget {
  const AddressList({Key? key}) : super(key: key);

  @override
  State<AddressList> createState() => _AddressListState();
}

class _AddressListState extends State<AddressList> {
  List<AddressItem> items = [
    AddressItem("mypageHome_1.svg", "우리집", "부산 강서구 명지국제3로 97 105동 221호"),
    AddressItem("mypageCompany_1.svg", "회사", "부산 사상구 모라동 22 1306호"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(title: "주소 관리", icon: "", widget: MainHome(), appbar: AppBar(), ),
      body: Container(
        child: ListView(
                children: List.generate(
                    items.length, (index) => addressListItem(items[index])),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: HexColor("#fd9a03"),
        onPressed: () {
          Get.to(AddressAdd());
        },
        child: Icon(CupertinoIcons.plus),
      ),
    );
  }

  // 주소 리스트
  Widget addressListItem(AddressItem address) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset("assets/icons/myPage/" + address.img),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: address.addressName,
                        fontsize: "",
                        fontbold: "bold",
                        fontcolor: Colors.black,textdirectionright: false),
                    FontStyle(
                        text: address.address,
                        fontsize: "",
                        fontbold: "",
                        fontcolor: HexColor("#909090"),textdirectionright: false),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        CircleLineBtn(
                          btnText: "수정",
                          fontboxwidth: 60,
                          fontboxheight: "sm",
                          bordercolor: HexColor("#d5d5d5"),
                          fontcolor: Colors.black,
                          fontsize: "",
                          btnIcon: "",
                          btnColor: Colors.transparent,
                          widgetName: AddressUpdate(),
                          iswidget: true,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleLineBtn(
                            btnText: "삭제",
                            fontboxwidth: 60,
                            fontboxheight: "sm",
                            bordercolor: HexColor("#fd9a03"),
                            fontcolor: HexColor("#fd9a03"),
                            fontsize: "",
                            btnIcon: "",
                            btnColor: Colors.transparent,
                            widgetName: AddressDelModal(),
                            iswidget: false),
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
          ListLine(
              height: 1,
              width: double.infinity,
              lineColor: HexColor("#d5d5d5"),
              opacity: 0.5),
        ],
      ),
    );
  }
}
