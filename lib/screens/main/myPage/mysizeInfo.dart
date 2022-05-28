import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/mysizeOnePiece.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/mysizeOuterInfo.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/mysizePants.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/mysizeShirt.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/mysizeSkirt.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageMenu.dart';
import 'package:flutter/material.dart';

class MySizeInfo extends StatefulWidget {
  const MySizeInfo({Key? key}) : super(key: key);

  @override
  State<MySizeInfo> createState() => _MySizeInfoState();
}

class _MySizeInfoState extends State<MySizeInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(
          title: "내 치수", icon: "", widget: MainHome(), appbar: AppBar()),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            MypageMenu(listTitle: "상의", widget: MysizeShirt()),
            MypageMenu(listTitle: "바지", widget: MysizePants()),
            MypageMenu(listTitle: "스커트", widget: MysizeSkirt()),
            MypageMenu(listTitle: "원피스", widget: MysizeOnePiece()),
            MypageMenu(listTitle: "아우터", widget: MysizeOuterInfo()),
          ],
        ),
      ),
    );
  }
}
