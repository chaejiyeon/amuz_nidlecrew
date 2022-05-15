import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CheckBtn extends StatefulWidget {
  final String list;

  const CheckBtn({Key? key, required this.list}) : super(key: key);

  @override
  State<CheckBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<CheckBtn> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(
            activeColor: HexColor("#fd9a03"),
              side: BorderSide(
                color: HexColor("#d5d5d5"),
              ),
              value: ischecked,
              onChanged: (value) {
                setState(() {
                  ischecked = value!;
                });
              }),
          FontStyle(
              text: widget.list,
              fontsize: "md",
              fontbold: "",
              fontcolor: Colors.black,textdirectionright: false),
        ],
      ),
    );
  }
}
