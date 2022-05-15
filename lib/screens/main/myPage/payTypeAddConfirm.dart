import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:amuz_nidlecrew/widgets/myPage/userInfoMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PayTypeAddConfirm extends StatefulWidget {
  const PayTypeAddConfirm({Key? key}) : super(key: key);

  @override
  State<PayTypeAddConfirm> createState() => _PayTypeAddConfirmState();
}

class _PayTypeAddConfirmState extends State<PayTypeAddConfirm> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(title: "결제 수단 등록", icon: "", widget: MainHome(), appbar: AppBar()),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(CupertinoIcons.checkmark_alt_circle, size: 50,),
                  SizedBox(height: 30,),
                  FontStyle(text: "결제 카드가 추가 등록되었습니다.", fontsize: "", fontbold: "", fontcolor: Colors.black,textdirectionright: false),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  UserInfoMenu(appTitle: "결제 수단 등록", title: "이름", info: "신응수", info2: "", line: true),
                  UserInfoMenu(appTitle: "결제 수단 등록", title: "이메일", info: "cwal@amuz.co.kr", info2: "", line: true),
                  UserInfoMenu(appTitle: "결제 수단 등록", title: "카드번호", info: "1234-5678-9101-****", info2: "", line: true),
                  UserInfoMenu(appTitle: "결제 수단 등록", title: "유효기간", info: "01/19", info2: "", line: true),
                  UserInfoMenu(appTitle: "결제 수단 등록", title: "비밀번호", info: "12**", info2: "", line: true),
                  UserInfoMenu(appTitle: "결제 수단 등록", title: "생년월일", info: "1993/05/23", info2: "", line: true),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
          child: CircleBlackBtn(btnText: "확인", pageName: "payType")),
    );
  }
}