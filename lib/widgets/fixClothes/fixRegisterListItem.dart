import 'package:amuz_nidlecrew/widgets/cartInfo/fixtypeListItem.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/checkBtn.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixtypeRegisterListItem.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FixRegisterListItem extends StatefulWidget {
  const FixRegisterListItem({Key? key}) : super(key: key);

  @override
  State<FixRegisterListItem> createState() => _FixRegisterListItemState();
}

class _FixRegisterListItemState extends State<FixRegisterListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20,top: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "일반바지",
              style: TextStyle(fontWeight: FontWeight.bold),
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
              FixTypeRegisterListItem(),
            ],
          ),
        ],
      ),
    );
  }
}
