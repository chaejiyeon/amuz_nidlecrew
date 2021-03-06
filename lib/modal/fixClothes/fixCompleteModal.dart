import 'package:needlecrew/screens/main/myPage/payMent.dart';
import 'package:needlecrew/screens/main/myPage/payType.dart';
import 'package:flutter/material.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';


class FixCompleteModal extends StatelessWidget {
  const FixCompleteModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
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
                      text: "수선을 확정하시겠습니까?",
                      fontsize: "md",
                      fontbold: "bold",
                      fontcolor: Colors.black,textdirectionright: false),
                  SizedBox(height: 5,),
                  Text("수선 확정 시 수선을 진행합니다.\n수선 진행 중에는 치수를 변경할 수 없습니다.", textAlign: TextAlign.center, style: TextStyle(color: HexColor("#606060")),),
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
                      child: TextButton(child: Text("확정",style: TextStyle(color: Colors.black)), onPressed: () {
                        Get.to(PayMent());
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
