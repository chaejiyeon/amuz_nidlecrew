import 'package:amuz_nidlecrew/models/alramItem.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class AlramListItem extends StatefulWidget {
  final AlramItem alram;

  const AlramListItem({Key? key, required this.alram}) : super(key: key);

  @override
  State<AlramListItem> createState() => _AlramListItemState();
}

class _AlramListItemState extends State<AlramListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: HexColor("#d5d5d5"),
                  width: 0.5,
                )
              )
            ),
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  padding: EdgeInsets.only(right: 10, bottom: 10),
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset(
                        "assets/icons/alramInfo/" + widget.alram.alramNo),),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FontStyle(
                          text: widget.alram.title,
                          fontsize: "md",
                          fontbold: "",
                          fontcolor: Colors.black,textdirectionright: false),
                      FontStyle(
                        text:widget.alram.time <=10 ?  widget.alram.time.toString() +  "분 전" : "한 시간 전",
                        fontsize: "",
                        fontbold: "",
                        fontcolor: HexColor("#d5d5d5"),textdirectionright: false
                      ),
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(23),
                  height: MediaQuery.of(context).size.height,
                  width: 80,
                  color: HexColor("#d5d5d5").withOpacity(0.5),
                  child: SvgPicture.asset("assets/icons/trashIcon.svg"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
