import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CircleBlackBtn extends StatelessWidget {
  final String btnText;
  final String pageName;

  const CircleBlackBtn({Key? key, required this.btnText, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          pageName != "back" ? Get.toNamed('/' + pageName)  : Get.back() ;
        },
        child: Text(
          btnText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
