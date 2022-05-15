import 'package:amuz_nidlecrew/modal/cartDelBtnModal.dart';
import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/widgets/cartInfo/cartListItem.dart';
import 'package:amuz_nidlecrew/widgets/circleLineBtn.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/checkBtn.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CartInfo extends StatelessWidget {
  const CartInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            // appbar
            FixClothesAppBar(appbar: AppBar()),

            // 옷바구니
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontStyle(
                      text: "옷바구니",
                      fontsize: "lg",
                      fontbold: "bold",
                      fontcolor: Colors.black,textdirectionright: false),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CheckBtn(list: "전체 선택"),
                      InkWell(
                        onTap: () {
                          Get.dialog(CartDelBtnModal());
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/trashIcon.svg"),
                            SizedBox(
                              width: 10,
                            ),
                            FontStyle(
                                text: "선택 삭제",
                                fontsize: "",
                                fontbold: "",
                                fontcolor: Colors.black,textdirectionright: false),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                color: HexColor("#f7f7f7"),
                child: ListView(
                  children: [
                    CartListItem(),
                  ],
                ),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FontStyle(
                          text: "총 의뢰 예상 비용 : ",
                          fontsize: "",
                          fontbold: "",
                          fontcolor: Colors.black,textdirectionright: false),
                      FontStyle(
                          text: "11,000",
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
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.chevron_up,
                        color: HexColor("#909090"),
                        size: 20,
                      )),
                ],
              ),
              CircleLineBtn(
                btnText: "총 1건 의뢰 진행하기",
                fontboxwidth: double.infinity,
                bordercolor: HexColor("#fd9a03"),
                fontcolor: Colors.white,
                fontsize: "md",
                btnIcon: "",
                btnColor: HexColor("#fd9a03"),
                widgetName: MainHome(),
                fontboxheight: "",
                iswidget: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
