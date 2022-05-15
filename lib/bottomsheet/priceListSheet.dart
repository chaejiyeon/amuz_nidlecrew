import 'package:amuz_nidlecrew/widgets/mainhome/priceInfo/priceDropdown.dart';
import 'package:amuz_nidlecrew/widgets/mainhome/priceInfo/priceDropdownHeader.dart';
import 'package:amuz_nidlecrew/widgets/mainhome/priceInfo/tableHeader.dart';
import 'package:amuz_nidlecrew/widgets/mainhome/priceInfo/tableListItem.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PriceListSheet extends StatelessWidget {
  const PriceListSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only( top: 10),
            child: Container(
              height: 7,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
          PriceDropdownHeader(),
          PriceDropDown(
            selectNum: 1,
            hintCheck: false,
            hint: "",
          ),
          PriceDropDown(
            selectNum: 2,
            hintCheck: false,
            hint: "",
          ),
          PriceDropDown(
            selectNum: 3,
            hintCheck: false,
            hint: "",
          ),

          // table header
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Row(
              children: [
                Align(
                  child: TableHeader(
                      width: 80,
                      borderColor: HexColor("#fd9a03").withOpacity(0.6),
                      text: "종류"),
                ),
                TableHeader(
                    width: 190,
                    borderColor: HexColor("#fd9a03").withOpacity(0.2),
                    text: "수선"),
                Expanded(
                  child: TableHeader(
                      width: 80,
                      borderColor: HexColor("#fd9a03").withOpacity(0.2),
                      text: "가격"),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              Container(
                  child: Column(
                children: [
                  TableListItem(
                      type: "일반바지", fixInfo: "기장-총 기장 줄임", price: "5,000"),
                  TableListItem(
                      type: "일반바지", fixInfo: "기장-총 기장 줄임", price: "5,000"),
                  TableListItem(
                      type: "일반바지", fixInfo: "기장-총 기장 줄임", price: "5,000"),
                  TableListItem(
                      type: "일반바지", fixInfo: "기장-총 기장 줄임", price: "5,000"),
                  TableListItem(
                      type: "일반바지", fixInfo: "기장-총 기장 줄임", price: "5,000"),
                  TableListItem(
                      type: "일반바지", fixInfo: "기장-총 기장 줄임", price: "5,000"),
                  TableListItem(
                      type: "일반바지", fixInfo: "기장-총 기장 줄임", price: "5,000"),
                  TableListItem(
                      type: "일반바지", fixInfo: "기장-총 기장 줄임", price: "5,000"),
                ],
              )),
            ],
          )),
        ],
      ),
    );
  }
}
