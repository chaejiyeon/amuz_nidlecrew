import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/addressList.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/payType.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/phoneNumUpdate.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/userJoinOut.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageMenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserUpdate extends StatelessWidget {
  const UserUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MypageAppBar(title: "회원 정보 변경", icon: "", widget: MainHome(),appbar: AppBar()),
        body: Container(
                padding: EdgeInsets.only(top:40, left: 24, right: 24),
                child: Column(
                  children: [
                    MypageMenu(listTitle: "주소 관리", widget: AddressList()),
                    MypageMenu(listTitle: "전화변호 변경", widget: PhoneNumUpdate()),
                    MypageMenu(listTitle: "결제 수단", widget: PayType()),
                    MypageMenu(listTitle: "회원 탈퇴", widget: UserJoinOut()),
                  ],
                ),
              ),
    );
  }
}
