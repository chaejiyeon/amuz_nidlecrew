import 'package:amuz_nidlecrew/screens/main/alramInfo.dart';
import 'package:amuz_nidlecrew/screens/main/cartInfo.dart';
import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/screens/mainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FixClothesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appbar;

  const FixClothesAppBar({Key? key, required this.appbar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          CupertinoIcons.chevron_back,
          color: Colors.black,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        Container(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                Get.to(MainPage(pageNum: 0));
              },
              child: SvgPicture.asset(
                "assets/icons/main/homeIcon.svg",
                color: Colors.black,
              ),
            )),
        Container(
            padding: EdgeInsets.all(10),
            child: InkWell(
              onTap: (){
                Get.to(CartInfo());
              },
              child: SvgPicture.asset(
                "assets/icons/main/cartIcon.svg",
                color: Colors.black,
              ),
            )),
        Container(
            padding: EdgeInsets.only(left: 10, right: 20),
            child: InkWell(
              onTap: (){
                Get.to(AlramInfo());
              },
              child: SvgPicture.asset(
                "assets/icons/main/alramIcon.svg",
                color: Colors.black,
              ),
            )),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbar.preferredSize.height);
}
