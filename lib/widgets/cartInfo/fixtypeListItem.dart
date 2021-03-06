import 'package:needlecrew/modal/cartDelBtnModal.dart';
import 'package:needlecrew/screens/main/fixClothes.dart';
import 'package:needlecrew/screens/main/fixClothes/fixUpdate.dart';
import 'package:needlecrew/widgets/fixClothes/listLine.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woocommerce_api/models/order.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../getxController/fixClothes/cartController.dart';

class FixTypeListItem extends StatefulWidget {
  final int index;
  final List<LineItems> lineItem;

  const FixTypeListItem({Key? key, required this.lineItem, required this.index}) : super(key: key);

  @override
  State<FixTypeListItem> createState() => _FixTypeListItemState();
}

class _FixTypeListItemState extends State<FixTypeListItem> {
  final CartController controller = Get.put( CartController());


  List<String> images = [
    "sample_2.jpeg",
    "sample_2.jpeg",
    "sample_3.jpeg",
  ];
  bool ischecked = false;


  @override
  void initState(){

    for(int i=0; i<controller.orderid.length; i++){
      if(controller.orderid[i] == controller.orders[widget.index].id){
        setState((){ischecked = true;});
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            if (controller.isInitialized.value) {
              return checkBox();
            } else {
              return Container(
                  child: Center(child: CircularProgressIndicator()));
            }
          }),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image slide
                Container(
                    height: 150,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(images.length,
                            (index) => ImageItem(images[index])))),
                SizedBox(
                  height: 10,
                ),

                // detail info
                FontStyle(
                    text: widget.lineItem.first.name.toString(),
                    fontsize: "md",
                    fontbold: "bold",
                    fontcolor: Colors.black,
                    textdirectionright: false),
                SizedBox(
                  height: 10,
                ),
                detailInfo("?????? ??????", "????????? ?????? ?????? ?????? ??????"),
                detailInfo("??????", "101.5cm"),
                detailInfo("?????? ??????", "?????? ????????? ????????? ???????????????."),
                detailInfo("?????? ??????", "20,000" + "???"),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: ListLine(
                      height: 2,
                      width: double.infinity,
                      lineColor: HexColor("#909090"),
                      opacity: 0.2),
                ),
                priceInfo("?????? ?????? ??????", widget.lineItem.first.price! , true, false),
                priceInfo("?????? ??????", "6,000", true, false),
                priceInfo("??? ?????? ?????? ??????", "11,000", false, true),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      fixBtn("??????", CartDelBtnModal()),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(child: fixBtn("?????? ??????", FixUpdate())),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // checkBox custom
  Widget checkBox() {
    return Checkbox(
      value: ischecked,
      onChanged: (value) {
        setState(() {
          ischecked = value!;
        });

        if(ischecked == true) {
          controller.iswholePrice(ischecked, int.parse(widget.lineItem.first.price.toString()));
          controller.isOrderId(ischecked, controller.orders[widget.index].id!);
        }
        else if(ischecked == false) {
          controller.iswholePrice(ischecked, int.parse(widget.lineItem.first.price.toString()));
          controller.isOrderId(ischecked, controller.orders[widget.index].id!);
        }
      },
      side: BorderSide(
        color: HexColor("#d5d5d5"),
      ),
      activeColor: HexColor("#fd9a03"),
    );
  }

  // slider Image Item
  Widget ImageItem(String image) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(10),
        width: 150,
        height: 150,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/" + image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  // detail ??????
  Widget detailInfo(String title, String content) {
    return Container(
      padding: EdgeInsets.only(top: 2, bottom: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FontStyle(
              text: title + " : ",
              fontsize: "",
              fontbold: "bold",
              fontcolor: Colors.black,
              textdirectionright: false),
          Expanded(child: Text(content))
        ],
      ),
    );
  }

  // ?????? ??????
  Widget priceInfo(String title, String price, bool infoIcon, bool wholePrice) {
    return Container(
      padding: EdgeInsets.only(top: 7, bottom: 7, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Row(
              children: [
                FontStyle(
                    text: title,
                    fontsize: "",
                    fontbold: "bold",
                    fontcolor: Colors.black,
                    textdirectionright: false),
                SizedBox(
                  width: 5,
                ),
                infoIcon == true
                    ? Icon(
                        CupertinoIcons.question_circle,
                        color: HexColor("#909090"),
                        size: 20,
                      )
                    : Container(),
              ],
            ),
          ),
          Row(
            children: [
              FontStyle(
                  text: price,
                  fontsize: "",
                  fontbold: "bold",
                  fontcolor:
                      wholePrice == true ? HexColor("#fd9a03") : Colors.black,
                  textdirectionright: false),
              FontStyle(
                  text: "???",
                  fontsize: "",
                  fontbold: "",
                  fontcolor: Colors.black,
                  textdirectionright: false),
            ],
          ),
        ],
      ),
    );
  }

  // ?????? / ?????? ??????
  Widget fixBtn(String text, Widget widget) {
    return GestureDetector(
      onTap: () {
        text == "??????" ? Get.dialog(widget) : Get.to(widget);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 125,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: HexColor("#d5d5d5"),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
