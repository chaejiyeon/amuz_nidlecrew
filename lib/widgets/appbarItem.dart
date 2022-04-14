import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppbarItem extends StatefulWidget {
  final String icon;
  final Color iconColor;
  final String iconFilename; // icon이 저장된 파일 이름

  const AppbarItem({Key? key, required this.icon, required this.iconColor, required this.iconFilename}) : super(key: key);

  @override
  State<AppbarItem> createState() => _AppbarItemState();
}

class _AppbarItemState extends State<AppbarItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.only(right: 10, top: 30),
          child: SvgPicture.asset(
            widget.iconFilename == "" ? "assets/icons/" + widget.icon : "assets/icons/" + widget.iconFilename + "/" + widget.icon,
            color: widget.iconColor,
          ),
        ),
      );
    ;
  }
}
