import 'package:amuz_nidlecrew/screens/main/myPage/mysizeOuterJumperUpdate.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/mysizeShirtUpdate.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:amuz_nidlecrew/widgets/myPage/sizeForm.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MysizeOuterJumper extends StatelessWidget {
  const MysizeOuterJumper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(title: "점퍼", icon: "updateIcon.svg", widget: MysizeOuterJumperUpdate(),appbar: AppBar()),
        body: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizeForm(title: "폼",hintTxt: "101", isTextfield: false),
                    SizedBox(height: 20,),
                    SizeForm(title: "목둘레", hintTxt: "32", isTextfield: false),
                    SizedBox(height: 20,),
                    SizeForm(title: "소매길이", hintTxt: "24", isTextfield: false),
                    SizedBox(height: 20,),
                    SizeForm(title: "소매통",hintTxt: "15", isTextfield: false),
                    SizedBox(height: 20,),
                    SizeForm(title: "민소매 암홀 길이", hintTxt: "15", isTextfield: false),
                    SizedBox(height: 20,),
                    SizeForm(title: "어깨 길이", hintTxt: "52", isTextfield: false),
                  ],
                ),
              ),
    );
  }
}
