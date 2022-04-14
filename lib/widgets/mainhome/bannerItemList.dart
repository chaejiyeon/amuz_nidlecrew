import 'package:amuz_nidlecrew/widgets/circleLineBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:amuz_nidlecrew/models/bannerItem.dart';

class BannerItem extends StatelessWidget {
  final String img;
  final String text1;
  final String text2;
  final String btnText;
  const BannerItem(
      {Key? key,
      required this.img,
      required this.text1,
      required this.text2,
      required this.btnText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Container(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10),),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  img,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.only(left: 8, top: 30),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/main/priceinfoIcon.svg",
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "가격표",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            appbarItem("cartIcon.svg"),
                            appbarItem("alramIcon.svg"),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  FontStyle(
                      text: text1,
                      fontsize: "lg",
                      fontbold: "bold",
                      fontcolor: Colors.white),
                  FontStyle(
                      text: text2,
                      fontsize: "lg",
                      fontbold: "bold",
                      fontcolor: Colors.white),
                  SizedBox(
                    height: 50,
                  ),
                  CircleLineBtn(
                      btnText: btnText,
                      fontboxwidth: 120,
                      bordercolor: Colors.white,
                      fontcolor: Colors.white,
                      fontsize: "",
                      btnIcon: "nextIcon.svg",
                      btnColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // appbarIcon
  Widget appbarItem(String icon) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(right: 10, top: 30),
        child: SvgPicture.asset(
          "assets/icons/main/" + icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
