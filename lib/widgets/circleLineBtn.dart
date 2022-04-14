import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CircleLineBtn extends StatefulWidget {
  final String btnText;
  final double fontboxwidth;
  final String fontsize; // md(15) = 큰 버튼
  final Color fontcolor;
  final Color bordercolor;
  final String btnIcon;
  final Color btnColor;

  const CircleLineBtn(
      {Key? key,
      required this.btnText,
      required this.fontboxwidth,
      required this.bordercolor,
      required this.fontcolor,
      required this.fontsize,
      required this.btnIcon,
      required this.btnColor})
      : super(key: key);

  @override
  State<CircleLineBtn> createState() => _CircleLineBtnState();
}

class _CircleLineBtnState extends State<CircleLineBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.fontboxwidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 1,
          color: widget.bordercolor,
        ),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {});
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.btnText,
              style: TextStyle(
                fontSize: widget.fontsize == "md" ? 15 : null,
                color: widget.fontcolor,
              ),
            ),
            if (widget.btnIcon != "")SizedBox(width: 7,),
            if (widget.btnIcon != "") SvgPicture.asset("assets/icons/" + widget.btnIcon, color: widget.btnColor ,),
          ],
        ),
      ),
    );
  }
}
