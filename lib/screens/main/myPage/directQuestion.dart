import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/widgets/myPage/directQuetionHideItem.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DirectQuestion extends StatefulWidget {
  const DirectQuestion({Key? key}) : super(key: key);

  @override
  State<DirectQuestion> createState() => _DirectQuestionState();
}

class _DirectQuestionState extends State<DirectQuestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(
          title: "1:1 문의 내역", icon: "", widget: MainHome(), appbar: AppBar()),
      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: [
            DirectQuestionHideItem(),
          ],
        ),
      ),
    );
  }
}
