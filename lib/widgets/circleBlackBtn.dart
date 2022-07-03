import 'package:amuz_nidlecrew/getxController/homeController.dart';
import 'package:amuz_nidlecrew/widgets/iamportForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amuz_nidlecrew/db/wp-api.dart' as wp_api;


class CircleBlackBtn extends GetView<HomeController> {
  final String btnText;
  final String pageName;

  const CircleBlackBtn({Key? key, required this.btnText, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        shape: BoxShape.rectangle,
        color: Colors.black,
      ),
      child: TextButton(
        onPressed: () {

          if(btnText == "결제하기"){
            Get.to(IamportForm());
          }else if(btnText == "변경 완료"){
            controller.updateUser();
          }else{
            pageName != "back" ? Get.toNamed('/' + pageName)  : Get.back() ;
          }
        },
        child: Text(
          btnText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
