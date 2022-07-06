import 'package:needlecrew/screens/main/myPage/mysizeOuterCoat.dart';
import 'package:needlecrew/screens/main/myPage/mysizeOuterJaket.dart';
import 'package:needlecrew/screens/main/myPage/mysizeOuterJumper.dart';
import 'package:needlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:needlecrew/widgets/myPage/mypageMenu.dart';
import 'package:flutter/material.dart';

import '../mainHome.dart';

class MysizeOuterInfo extends StatelessWidget {
  const MysizeOuterInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(
          title: "아우터", icon: "", widget: MainHome(), appbar: AppBar()),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            MypageMenu(listTitle: "점퍼", widget: MysizeOuterJumper()),
            MypageMenu(listTitle: "재킷", widget: MysizeOuterJaket()),
            MypageMenu(listTitle: "코트", widget: MysizeOuterCoat()),
          ],
        ),
      ),
    );
  }
}
