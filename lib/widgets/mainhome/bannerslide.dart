import 'package:amuz_nidlecrew/models/bannerItem.dart';
import 'package:amuz_nidlecrew/widgets/mainhome/bannerItemList.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlides extends StatefulWidget {
  const BannerSlides({Key? key}) : super(key: key);

  @override
  State<BannerSlides> createState() => _BannerSlidesState();
}

class _BannerSlidesState extends State<BannerSlides> {
  CarouselController _carouselController =  CarouselController();
  // DotPageBtn(this._carouselController);
  late int currentpage = 0;

  @override
  Widget build(BuildContext context) {


    return Stack(
        children: [
          CarouselSlider(
            carouselController: _carouselController,
            items: banners.map((banners) {
              return BannerItem(
                  img: banners.img,
                  text1: banners.text1,
                  text2: banners.text2,
                  btnText: banners.btnText);
            }).toList(),
            options: CarouselOptions(
              height: 450,
              viewportFraction: 1,
              onPageChanged: (index, reason){
                setState(() {
                  currentpage = index;
                });
              }
            ),
          ),
          Align(
            heightFactor: 13,
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(left: 20),
                // child: DotPageBtn(dotColor: "white", item: banners),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: banners.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => _carouselController.animateToPage(entry.key),
                      child: Container(
                        width: 12.0,
                        height: 12.0,
                        margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Colors.white,
                            ),
                            color:
                            (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.white)
                                .withOpacity(_carouselController == entry.key
                                ? 0.9
                                : 0.1)),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ),
        ],
      );
  }
}