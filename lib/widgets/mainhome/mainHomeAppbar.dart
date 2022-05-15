import 'package:amuz_nidlecrew/screens/main/alramInfo.dart';
import 'package:amuz_nidlecrew/screens/main/cartInfo.dart';
import 'package:amuz_nidlecrew/screens/main/mainhome/priceInfo.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MainHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appbar;

  const MainHomeAppBar({Key? key, required this.appbar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 120,
      leading: InkWell(
        onTap: (){Get.to(PriceInfo());},
        child: Container(
          padding: EdgeInsets.only(left: 24),
          child: Row(
            children: [
               SvgPicture.asset("assets/icons/main/priceinfoIcon.svg",
                      fit: BoxFit.cover),
              SizedBox(width: 10,),
              FontStyle(
                  text: "가격표",
                  fontsize: "md",
                  fontbold: "",
                  fontcolor: Colors.white,
                  textdirectionright: false),
            ],
          ),
        ),
      ),
      // titleSpacing: 0,
      // title:
      actions: [
        appbarItem("cartIcon.svg", CartInfo()),
        appbarItem("alramIcon.svg", AlramInfo()),
      ],
    );
  }

  // appbarIcon
  Widget appbarItem(String icon, Widget getTo) {
    return InkWell(
      onTap: () {
        Get.to(getTo);
      },
      child: Container(
        padding: EdgeInsets.only(right: 24),
        child: SvgPicture.asset(
          "assets/icons/main/" + icon,
          color: Colors.white,
          width: 20,
          height: 20,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appbar.preferredSize.height);
}
