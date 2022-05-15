import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SizeForm extends StatefulWidget {
  final String title;
  final String hintTxt;
  final bool isTextfield;

  const SizeForm(
      {Key? key,
      required this.title,
      required this.hintTxt,
      required this.isTextfield})
      : super(key: key);

  @override
  State<SizeForm> createState() => _SizeFormState();
}

class _SizeFormState extends State<SizeForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FontStyle(
              text: widget.title,
              fontsize: "",
              fontbold: "",
              fontcolor: Colors.black,textdirectionright: false),
          SizedBox(
            height: 10,
          ),
          widget.isTextfield == true
              ? TextField(
                  style: TextStyle(height: 0.5),
                  decoration: InputDecoration(
                    hintText: widget.hintTxt,
                    suffixIcon: Container(
                        padding: EdgeInsets.only(top: 10), child: Text("cm")),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: HexColor("#d5d5d5"),
                      ),
                    ),
                  ),
                )
              : Container(
            padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: HexColor("#d5d5d5")),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FontStyle(
                          text: widget.hintTxt,
                          fontsize: "",
                          fontbold: "",
                          fontcolor: Colors.black,textdirectionright: false),
                      FontStyle(text: "cm", fontsize: "", fontbold: "", fontcolor: Colors.black,textdirectionright: false),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
