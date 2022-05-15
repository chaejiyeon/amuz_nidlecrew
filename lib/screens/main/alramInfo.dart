import 'package:amuz_nidlecrew/models/alramItem.dart';
import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/widgets/alramInfo/alramLitItem.dart';
import 'package:amuz_nidlecrew/widgets/baseAppbar.dart';
import 'package:amuz_nidlecrew/widgets/circleLineBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AlramInfo extends StatefulWidget {
  const AlramInfo({Key? key}) : super(key: key);

  @override
  State<AlramInfo> createState() => _AlramInfoState();
}

class _AlramInfoState extends State<AlramInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appbar: AppBar(),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FontStyle(
                      text: "알림",
                      fontsize: "lg",
                      fontbold: "bold",
                      fontcolor: Colors.black,textdirectionright: false),
                  CircleLineBtn(
                    btnText: "전체 삭제",
                    fontboxwidth: 100,
                    bordercolor: HexColor("#d5d5d5"),
                    fontcolor: Colors.black,
                    fontsize: "md",
                    btnIcon: "",
                    btnColor: Colors.transparent,
                    widgetName: MainHome(),
                    fontboxheight: "sm",
                    iswidget: true,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
                child: ListView(
              children: List.generate(alrams.length,
                  (index) => AlramListItem(alram: alrams[index])),
            )),
          ],
        ),
      ),
    );
  }
}