import 'package:needlecrew/widgets/cartInfo/fixtypeListItem.dart';
import 'package:needlecrew/widgets/fixClothes/checkBtn.dart';
import 'package:needlecrew/widgets/fixClothes/listLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woocommerce_api/flutter_woocommerce_api.dart';
import 'package:flutter_woocommerce_api/models/order.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:needlecrew/db/wp-api.dart' as wp_api;

import '../../getxController/fixClothes/cartController.dart';

class CartListItem extends GetView<CartController> {
  final int index;
  final List<LineItems> lineItem;

  const CartListItem({Key? key, required this.lineItem, required this.index}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("lineitem this" + lineItem.first.productId.toString());
    print("this status     ddd " + controller.orders[index].status.toString());

    return controller.orders[index].status != 'pending' ? Container() : Container(
      margin: EdgeInsets.only(bottom: 18),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RadioBtn(list: "일반바지", bottomPadding: 0, textBold: "bold"),
                GestureDetector(
                  child: Container(
                    height: 30,
                    padding: EdgeInsets.only(left: 13, right: 13),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: HexColor("#fd9a03"),
                        )),
                    child: Text(
                      "추가 수선하기",
                      style: TextStyle(color: HexColor("#fd9a03")),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListLine(
              height: 2,
              width: double.infinity,
              lineColor: HexColor("#909090"),
              opacity: 0.2),

          // 슬러그 별 구별 해야함 20220602(목)
          FixTypeListItem(lineItem: lineItem,index: index),
        ],
      ),
    );
  }
}
