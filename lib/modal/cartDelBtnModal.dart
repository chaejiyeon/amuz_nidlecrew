import 'package:needlecrew/getxController/fixClothes/cartController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:needlecrew/widgets/fontStyle.dart';


class CartDelBtnModal extends StatelessWidget {
  const CartDelBtnModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        width: 300,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10,),
            SvgPicture.asset("assets/icons/tearIcon.svg"),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FontStyle(
                      text: "선택한 의뢰를 삭제할까요?",
                      fontsize: "md",
                      fontbold: "bold",
                      fontcolor: Colors.black,textdirectionright: false),
                ],
              ),
            ),


            Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: HexColor("#d5d5d5")),
                            right: BorderSide(color: HexColor("#d5d5d5")),
                          )),
                      child: TextButton(child: Text("취소",style: TextStyle(color: Colors.black),), onPressed: () {
                        Get.back();
                      }),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: HexColor("#d5d5d5")),
                          )),
                      child: TextButton(child: Text("삭제",style: TextStyle(color: Colors.black)), onPressed: () {
                        controller.deleteCart();
                        controller.getCart();
                        Get.back();
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
