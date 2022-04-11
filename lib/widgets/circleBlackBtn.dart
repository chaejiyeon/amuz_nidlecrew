import 'package:flutter/material.dart';
import 'package:get/get.dart';


class CircleBlackBtn extends StatelessWidget {
  final String btnText;
  final String pageName;

  const CircleBlackBtn({Key? key, required this.btnText, required this.pageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27),
        shape: BoxShape.rectangle,
        color: Colors.black,
      ),
      child: TextButton(
        onPressed: () {
          Get.toNamed('/' + pageName);
        },
        child: Text(
          btnText,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
