import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'main/fixClothes.dart';
import 'main/mainHome.dart';
import 'main/myPage.dart';
import 'main/useInfo.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> pages=[MainHome(), UseInfo(), MyPage(), FixClothes()];

  void _onTap(int index){
   setState(() {
     _currentIndex = index;
   });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));

    return Scaffold(
      body: pages[_currentIndex],
      floatingActionButton: Container(
        width: 80,
        height: 80,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                _currentIndex = 3;
              });
            },
            backgroundColor: HexColor("#fd9a03"),
            child: Container(
              padding: EdgeInsets.only(top: 5),
              child: Column(
                children: [
                  SvgPicture.asset("assets/icons/main/fixclothesIcon.svg"),
                  Text(
                    "수선하기",
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        color: HexColor("#202427"),
        shape: CircularNotchedRectangle(),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bottomIcon(0, "홈", "homeIcon.svg"),
              bottomIcon(1, "이용내역", "useinfoIcon.svg"),
              Padding(padding: EdgeInsets.only(right: 100,),child: bottomIcon(2, "MY", "userIcon.svg")),
            ],
          ),
        ),
      ),
    );
  }


  // bottomNavigation Icon
 Widget bottomIcon(int page, String title, String icon) {
    bool ispressed = false;
    Color iconColor = Colors.white;
    Color titleColor = Colors.white;

    return InkWell(
      onTap: (){
        setState(() {
          _currentIndex = page;
          ispressed = true;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/icons/main/' + icon, color: iconColor,),
            Text(title, style: TextStyle(color: titleColor),),
          ],
        ),
      ),
    );
 }
}
