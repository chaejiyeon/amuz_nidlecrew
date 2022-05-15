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

class MysizeOnePieceUpdate extends StatefulWidget {
  const MysizeOnePieceUpdate({Key? key}) : super(key: key);

  @override
  State<MysizeOnePieceUpdate> createState() => _MysizeOnePieceUpdateState();
}

class _MysizeOnePieceUpdateState extends State<MysizeOnePieceUpdate> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: MypageAppBar(title: "원피스", icon: "", widget: MainHome(),appbar: AppBar()),
        body: Container(
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizeForm(title: "기장", hintTxt: "", isTextfield: true),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: MysizeBottom(),
      ),
    );
  }
}
