import 'package:amuz_nidlecrew/widgets/appbarItem.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UseInfoBanner extends StatefulWidget {
  const UseInfoBanner({Key? key}) : super(key: key);

  @override
  State<UseInfoBanner> createState() => _UseInfoBannerState();
}

class _UseInfoBannerState extends State<UseInfoBanner> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset("assets/images/sample.jpeg"),
          ),
        ),

        // appbar icons
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AppbarItem(
                  icon: "prevIcon.svg",
                  iconColor: Colors.white,
                  iconFilename: ""),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: FontStyle(
                    text: "나의 이용내역",
                    fontsize: "md",
                    fontbold: "bold",
                    fontcolor: Colors.white),
              ),
              Row(
                children: [
                  AppbarItem(
                      icon: "cartIcon.svg",
                      iconColor: Colors.white,
                      iconFilename: "main"),
                  AppbarItem(
                      icon: "alramIcon.svg",
                      iconColor: Colors.white,
                      iconFilename: "main"),
                ],
              ),
            ],
          ),
        ),

        Align(
          heightFactor: 3,
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 iconWrap("bookIcon.svg","useinfo","수선 대기"),
                  // bar dot
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [barDot(), barDot(), barDot()],
                      )),
                iconWrap("fixclothesIcon.svg","main","수선 진행중"),
                  // bar dot
                  Container(
                      child: Row(
                        children: [barDot(), barDot(), barDot()],
                      )),
                  iconWrap("useClothesIcon.svg","useinfo","수선 완료"),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  // icon style 설정
  Widget iconStyle(String icon, String filename) {
    return SvgPicture.asset(
      "assets/icons/" + filename + "/" + icon,
      width: 50,
      height: 50,
    );
  }

  // icon 사이 바
  Widget barDot() {
    return Container(
      margin: EdgeInsets.only(left: 5),
      height: 1,
      width: 5,
      decoration: BoxDecoration(color: Colors.white),
    );
  }


  Widget iconWrap(String icon,String filename, String content){
    Color fontcolor = Colors.white;
    return Column(
      children: [
      iconStyle(icon, filename),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FontStyle(text: "1", fontsize: "md", fontbold: "bold", fontcolor: fontcolor),
          FontStyle(text: "건", fontsize: "", fontbold: "", fontcolor: fontcolor),
        ],),
      FontStyle(text: content, fontsize: "md", fontbold: "", fontcolor: fontcolor)
    ],);
  }
}
