import 'package:amuz_nidlecrew/models/loadingItem.dart';
import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/loadingPage/loadingItemList.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class loadingPage extends StatefulWidget {
  const loadingPage({Key? key}) : super(key: key);

  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  CarouselController _carouselController = CarouselController();
  late int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: stackLoading()),
            Container(
              height: 50,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: pages.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              _carouselController.animateToPage(entry.key),
                          child: Container(
                            width: 8.0,
                            height: 8.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 5.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : Colors.black)
                                    .withOpacity(
                                        _carouselController == entry.key
                                            ? 0.9
                                            : 0.2)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 150,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: CircleBlackBtn(btnText: "시작하기", pageName: "login")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "니들크루 회원이 아니신가요?",
                ),
                SizedBox(
                  width: 25,
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/join');
                  },
                  child:Text(
                    "회원가입",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // prev, next button
  Widget alignBtn(String icon, String change) {
    return Align(
        heightFactor: 100,
        alignment:
            change == "prev" ? Alignment.centerLeft : Alignment.centerRight,
        child: IconButton(
          onPressed: () {
            change == "prev"
                ? _carouselController.previousPage()
                : _carouselController.nextPage();
            ;
          },
          icon: SvgPicture.asset("assets/icons/startPage/" + icon) ,
        ),
    );
  }

  // image slider
  Widget stackLoading() {
    return Stack(
      children: [
        Align(
          heightFactor: 2,
          child: Container(
            padding: EdgeInsets.only(top: 102),
            width: double.infinity,
            child: CarouselSlider(
              items: pages.map((pages) {
                return LoadingItem(
                    img: pages.img, text1: pages.text1, text2: pages.text2);
              }).toList(),
              options: CarouselOptions(
                  viewportFraction: 1,
                  height: 425.9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPage = index;
                    });
                  }),
              carouselController: _carouselController,
            ),
          ),
        ),
        if (currentPage != 0)
          alignBtn("startPrev.svg", "prev"),
        if (currentPage != 3)
          alignBtn('startNext.svg', "next"),
      ],
    );
  }
}
