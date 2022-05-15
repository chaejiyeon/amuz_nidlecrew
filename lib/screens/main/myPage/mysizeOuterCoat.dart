import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:amuz_nidlecrew/widgets/myPage/sizeForm.dart';
import 'package:flutter/material.dart';

import 'mysizeOuterCoatUpdate.dart';

class MysizeOuterCoat extends StatelessWidget {
  const MysizeOuterCoat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(
        title: "코트",
        icon: "updateIcon.svg",
        widget: MysizeOuterCoatUpdate(),
        appbar: AppBar(),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizeForm(title: "폼", hintTxt: "101", isTextfield: false),
            SizedBox(
              height: 20,
            ),
            SizeForm(title: "목둘레", hintTxt: "32", isTextfield: false),
            SizedBox(
              height: 20,
            ),
            SizeForm(title: "소매길이", hintTxt: "24", isTextfield: false),
            SizedBox(
              height: 20,
            ),
            SizeForm(title: "소매통", hintTxt: "15", isTextfield: false),
            SizedBox(
              height: 20,
            ),
            SizeForm(title: "민소매 암홀 길이", hintTxt: "15", isTextfield: false),
            SizedBox(
              height: 20,
            ),
            SizeForm(title: "어깨 길이", hintTxt: "52", isTextfield: false),
          ],
        ),
      ),
    );
  }
}
