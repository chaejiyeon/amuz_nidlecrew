import 'package:amuz_nidlecrew/getxController/homeController.dart';
import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/myPage/updateForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneNumUpdate extends GetView<HomeController> {
  const PhoneNumUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateUserInfo('phoneNum');
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: UpdateForm(
          appbarName: "전화번호 변경",
          updateType: "전화번호",
          hintText: controller.user.phoneNum != null ? controller.user.phoneNum.toString() : "",
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
          child: CircleBlackBtn(btnText: "변경 완료", pageName: "back"),
        ),
      ),
    );
  }
}
