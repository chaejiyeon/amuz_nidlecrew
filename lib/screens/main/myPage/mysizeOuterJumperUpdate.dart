import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mysizeBottom.dart';
import 'package:amuz_nidlecrew/widgets/myPage/sizeForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../mainHome.dart';

class MysizeOuterJumperUpdate extends StatefulWidget {
  const MysizeOuterJumperUpdate({Key? key}) : super(key: key);

  @override
  State<MysizeOuterJumperUpdate> createState() => _MysizeOuterJumperUpdateState();
}

class _MysizeOuterJumperUpdateState extends State<MysizeOuterJumperUpdate> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: MypageAppBar(title: "점퍼", icon: "", widget: MainHome(),appbar: AppBar()),
        body: Container(
                padding: EdgeInsets.all(20),
                child: ListView(
                  children: [
                    SizeForm(title: "품", hintTxt: "", isTextfield: true),
                    SizedBox(
                      height: 20,
                    ),
                    SizeForm(title: "목둘레", hintTxt: "", isTextfield: true),
                    SizedBox(
                      height: 20,
                    ),
                    SizeForm(title: "소매길이", hintTxt: "", isTextfield: true),
                    SizedBox(
                      height: 20,
                    ),
                    SizeForm(title: "민소매 암홀 길이", hintTxt: "", isTextfield: true),
                    SizedBox(
                      height: 20,
                    ),
                    SizeForm(title: "어깨 길이", hintTxt: "", isTextfield: true),
                  ],
                ),
        ),
        bottomNavigationBar: MysizeBottom(),
      ),
    );
  }
}
