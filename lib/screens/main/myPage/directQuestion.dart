import 'package:needlecrew/screens/main/mainHome.dart';
import 'package:needlecrew/widgets/myPage/directQuetionHideItem.dart';
import 'package:needlecrew/widgets/myPage/mypageAppbar.dart';
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
          title: "자주하는 질문", icon: "", widget: MainHome(), appbar: AppBar()),
      body: Container(
        color: Colors.white,
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
