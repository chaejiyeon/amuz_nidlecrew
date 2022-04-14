import 'package:amuz_nidlecrew/screens/join/chooseGender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FloatingNextBtn extends StatelessWidget {
  final Widget page;
  const FloatingNextBtn({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(right: 24),
      alignment: Alignment.bottomRight,
      child: InkWell(
        onTap: (){
          Get.to(page);
        },
        child: SvgPicture.asset(
          'assets/icons/floatingNext.svg',
        ),
      ),
    );
  }
}
