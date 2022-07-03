import 'package:flutter/material.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';


class FixChooseModal extends StatelessWidget {
  const FixChooseModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
        width: 300,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FontStyle(
                      text: "임시 저장된 의뢰가 있습니다.",
                      fontsize: "md",
                      fontbold: "bold",
                      fontcolor: Colors.black,textdirectionright: false),
                  FontStyle(
                      text: "이어서 작성하시겠습니까?",
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
                      child: TextButton(child: Text("새로 작성하기",style: TextStyle(color: Colors.black),), onPressed: () {
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
                      child: TextButton(child: Text("불러오기",style: TextStyle(color: Colors.black)), onPressed: () {}),
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
