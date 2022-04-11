import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class CircleCheckBtn extends StatefulWidget {
  final String list;
  final Widget listInfo;

  const CircleCheckBtn({Key? key, required this.list, required this.listInfo})
      : super(key: key);

  @override
  State<CircleCheckBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<CircleCheckBtn> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            checkColor: Colors.white,
            activeColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            side: BorderSide(
              color: HexColor("#d5d5d5"),
            ),
            value: ischecked,
            onChanged: (value) {
              setState(() {
                ischecked = value!;
              });
            }),
        Expanded(
          child: InkWell(
            onTap: (){
              Get.to(widget.listInfo);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.list),
                Icon(CupertinoIcons.chevron_forward, color: HexColor("#d5d5d5"),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
