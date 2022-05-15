import 'package:amuz_nidlecrew/modal/mainHomeModal.dart';
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
  final int pageNum;
  const MainPage({Key? key, required this.pageNum}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> pages = [MainHome(), UseInfo(), MyPage()];

  @override
  void initState() {
    super.initState();

    // 메인페이지 init dialog
    Future.delayed(Duration.zero, (){
      showDialog(context: context, builder: (BuildContext context){
        return MainHomeModal();
      });

    });


      _currentIndex = widget.pageNum;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light
        )
    );


    return Scaffold(
      body: pages[_currentIndex],
      floatingActionButton: Container(
        width: 80,
        height: 80,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              setState(() {
                Get.to(FixClothes());
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
              Padding(
                  padding: EdgeInsets.only(
                    right: 100,
                  ),
                  child: bottomIcon(2, "MY", "userIcon.svg")),
            ],
          ),
        ),
      ),
    );
  }

  // bottomNavigation Icon
  Widget bottomIcon(int page, String title, String icon) {
    Color iconColor = Colors.white;
    Color titleColor = Colors.white;

    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = page;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        height: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              'assets/icons/main/' + icon,
              color: iconColor,
            ),
            Text(
              title,
              style: TextStyle(color: titleColor),
            ),
          ],
        ),
      ),
    );
  }
}
