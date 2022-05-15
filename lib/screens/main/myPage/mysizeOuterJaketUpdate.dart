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

class MysizeOuterJaketUpdate extends StatefulWidget {
  const MysizeOuterJaketUpdate({Key? key}) : super(key: key);

  @override
  State<MysizeOuterJaketUpdate> createState() => _MysizeOuterJaketUpdateState();
}

class _MysizeOuterJaketUpdateState extends State<MysizeOuterJaketUpdate> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: MypageAppBar(title: "재킷", icon: "", widget: MainHome(),appbar: AppBar()),
        body: Container(
                padding: EdgeInsets.all(20),
                child: Column(
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
