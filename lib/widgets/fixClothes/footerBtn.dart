import 'package:amuz_nidlecrew/bottomsheet/priceListSheet.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class FooterBtn extends StatelessWidget {
  const FooterBtn({Key? key}) : super(key: key);

  // bottomsheet open
  void bottomsheetOpen(BuildContext context){
    showFlexibleBottomSheet(
      minHeight: 0,
      initHeight: 0.8,
      maxHeight: 0.8,
      context: context,
      bottomSheetColor: HexColor("#909090").withOpacity(0.2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      builder: (context, controller, offset) {
       return PriceListSheet();
      },
      isExpand: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("수선 비용이 궁금하신가요?"),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: HexColor("#fd9a03"),
                )),
            child: IconButton(
              icon: Icon(
                CupertinoIcons.chevron_up,
                color: HexColor("#fd9a03"),
              ),
              onPressed: () {
                bottomsheetOpen(context);
              },
            ),
          )
        ],
      ),
    );
  }
}
