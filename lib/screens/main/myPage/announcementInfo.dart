import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AnnouncementInfo extends StatefulWidget {
  const AnnouncementInfo({Key? key}) : super(key: key);

  @override
  State<AnnouncementInfo> createState() => _AnnouncementInfoState();
}

class _AnnouncementInfoState extends State<AnnouncementInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(
          title: "공지사항", icon: "", appbar: AppBar(), widget: widget),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            announcementList(),
          ],
        ),
      ),
    );
  }

  Widget announcementList() {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(CupertinoIcons.speaker_1,size: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontStyle(
                      text: "12월 15일, 니들크루 수선 요금이 변경됩니다!",
                      fontsize: "",
                      fontbold: "bold",
                      fontcolor: Colors.black,
                      textdirectionright: false),
                  FontStyle(
                      text: "2021-12-01",
                      fontsize: "",
                      fontbold: "",
                      fontcolor: HexColor("#909090"),
                      textdirectionright: false),
                ],
              ),
              Container(padding: EdgeInsets.only(top: 10),child: Icon(CupertinoIcons.forward, size: 20,color: HexColor("#909090"),))
            ],
          ),
          SizedBox(height: 15,),
          ListLine(height: 1, width: double.infinity, lineColor: HexColor("#d5d5d5"), opacity: 0.5)
        ],
      ),
    );
  }
}
