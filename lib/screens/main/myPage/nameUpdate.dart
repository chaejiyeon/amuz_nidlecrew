import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/screens/mainPage.dart';
import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:amuz_nidlecrew/widgets/myPage/updateForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

class NameUpdate extends StatelessWidget {
  const NameUpdate({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: UpdateForm(appbarName: "이름 변경",updateType: "이름",hintText: "신응수",),

        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
            child: CircleBlackBtn(btnText: "변경 완료", pageName: "mainHome")),
      ),
    );
  }
}
