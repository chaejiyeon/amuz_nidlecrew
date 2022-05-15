import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/userUpdate.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:amuz_nidlecrew/widgets/myPage/userInfoMenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MypageAppBar(title: "회원 정보", icon: "updateIcon.svg", widget: UserUpdate(),appbar: AppBar()),
      body: SafeArea(
        child: Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  children: [
                    UserInfoMenu(appTitle: "회원 정보",title: "이름",info: "신응수",info2: "",line: true),
                    UserInfoMenu(appTitle: "회원 정보",title: "전화번호",info: "010-1234-5678",info2: "",line: true),
                    UserInfoMenu(appTitle: "회원 정보",title: "주소",info: "부산 강서구 명지동 3461-1" ,info2: "105동 2215호",line: true),
                    UserInfoMenu(appTitle: "회원 정보",title: "결제 수단",info: "롯데카드(4892)",info2: "",line: false),
                  ],
                ),
              ),
      ),
    );
  }
}
