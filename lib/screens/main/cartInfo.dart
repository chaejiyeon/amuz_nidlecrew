import 'package:needlecrew/modal/cartDelBtnModal.dart';
import 'package:needlecrew/modal/cartInfoModal.dart';
import 'package:needlecrew/screens/main/fixClothes/fixSelect.dart';
import 'package:needlecrew/screens/main/mainHome.dart';
import 'package:needlecrew/screens/main/nothingInfo.dart';
import 'package:needlecrew/widgets/cartInfo/cartListItem.dart';
import 'package:needlecrew/widgets/circleLineBtn.dart';
import 'package:needlecrew/widgets/fixClothes/checkBtn.dart';
import 'package:needlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_woocommerce_api/flutter_woocommerce_api.dart';
import 'package:flutter_woocommerce_api/models/order.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:needlecrew/db/wp-api.dart' as wp_api;

import '../../getxController/fixClothes/cartController.dart';

class CartInfo extends StatelessWidget {
  const CartInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());

    print("register orders id info " + controller.orders.length.toString());
    // print("setsave " + controller.setSave.toString());

    return Scaffold(
      body: FutureBuilder(
        future: controller.getCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return controller.orders.length == 0
                ? NothingInfo(title: "작성중인 의뢰", subtitle: "작성중인 의뢰가 없습니다.")
                : Container(
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
                                  fontcolor: Colors.black,
                                  textdirectionright: false),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RadioBtn(
                                      list: "전체 선택",
                                      bottomPadding: 0,
                                      textBold: ""),
                                  GestureDetector(
                                    onTap: () {
                                      Get.dialog(CartDelBtnModal());
                                    },
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            "assets/icons/trashIcon.svg"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        FontStyle(
                                            text: "선택 삭제",
                                            fontsize: "",
                                            fontbold: "",
                                            fontcolor: Colors.black,
                                            textdirectionright: false),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        FutureBuilder(
                            future: controller.getCart(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                print("주문건수 " +
                                    controller.orders.length.toString());

                                return Expanded(
                                  child: controller.orders.length == 0
                                      ? NothingInfo(
                                          title: "옷바구니",
                                          subtitle: "담겨있는 옷이 없습니다.",
                                        )
                                      : Container(
                                          padding: EdgeInsets.only(
                                              left: 24, right: 24),
                                          color: HexColor("#f7f7f7"),
                                          child: SingleChildScrollView(
                                              padding: EdgeInsets.only(top: 20),
                                              child: Column(
                                                children: List.generate(
                                                    controller.orders.length,
                                                    (index) => CartListItem(
                                                          lineItem: controller
                                                              .orders[index]
                                                              .lineItems!,
                                                          index: index,
                                                        )),
                                              )),
                                        ),
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
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

      // 고정 bottom navigation
      bottomNavigationBar: FutureBuilder(
          future: controller.getCart(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return controller.orders.length == 0
                  ? Container(
                      height: 0,
                    )
                  : GestureDetector(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
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
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      FontStyle(
                                          text: "총 의뢰 예상 비용 : ",
                                          fontsize: "",
                                          fontbold: "",
                                          fontcolor: Colors.black,
                                          textdirectionright: false),
                                      Obx(() => FontStyle(
                                          text: controller.setPrice(),
                                          fontsize: "md",
                                          fontbold: "bold",
                                          fontcolor: HexColor("#fd9a03"),
                                          textdirectionright: false)),
                                      FontStyle(
                                          text: "원",
                                          fontsize: "",
                                          fontbold: "",
                                          fontcolor: Colors.black,
                                          textdirectionright: false),
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
                            ),
                            Obx(() => CircleLineBtn(
                                  btnText: "총 " +
                                      controller.orderCount.toString() +
                                      " 건 의뢰 진행하기",
                                  fontboxwidth: double.infinity,
                                  bordercolor: controller.orderCount.value == 0
                                      ? HexColor("#d5d5d5")
                                      : HexColor("#fd9a03"),
                                  fontcolor: Colors.white,
                                  fontsize: "md",
                                  btnIcon: "",
                                  btnColor: controller.orderCount.value == 0
                                      ? HexColor("#d5d5d5")
                                      : HexColor("#fd9a03"),
                                  widgetName: CartInfoModal(),
                                  fontboxheight: "",
                                  iswidget: false,
                                )),
                          ],
                        ),
                      ),
                    );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
