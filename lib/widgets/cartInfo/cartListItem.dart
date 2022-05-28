import 'package:amuz_nidlecrew/widgets/cartInfo/fixtypeListItem.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/checkBtn.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CartListItem extends StatefulWidget {
  const CartListItem({Key? key}) : super(key: key);

  @override
  State<CartListItem> createState() => _CartListItemState();
}

class _CartListItemState extends State<CartListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                CheckBtn(list: "일반바지", bottomPadding: 0,textBold: "bold"),
                InkWell(
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
                    child: Text("추가 수선하기", style: TextStyle(color: HexColor("#fd9a03")),),
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
          Column(
            children: [
              FixTypeListItem(),
            ],
          ),
        ],
      ),
    );
  }
}
