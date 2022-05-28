import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CheckBtn extends StatefulWidget {
  final String list;
  final double bottomPadding;
  final String textBold;

  const CheckBtn({Key? key, required this.list, required this.bottomPadding, required this.textBold}) : super(key: key);

  @override
  State<CheckBtn> createState() => _RadioBtnState();
}

class _RadioBtnState extends State<CheckBtn> {
  bool ischecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: widget.bottomPadding),
      child: Row(
        children: [
          SizedBox(
            width: 22,
            height: 22,
            child: Checkbox(
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
          ),
          SizedBox(width: 10,),
          FontStyle(
              text: widget.list,
              fontsize: "md",
              fontbold: widget.textBold,
              fontcolor: Colors.black,textdirectionright: false),
        ],
      ),
    );
  }
}
