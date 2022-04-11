import 'package:amuz_nidlecrew/screens/login/login.dart';
import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_multi_carousel/carousel.dart';
import 'package:get/get.dart';

class loadingPage extends StatefulWidget {
  const loadingPage({Key? key}) : super(key: key);

  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Carousel(
                  height: 350.0,
                  width: 350,
                  initialPage: 3,
                  allowWrap: false,
                  type: Types.simple,
                  onCarouselTap: (i) {
                    print("onTap $i");
                  },
                  indicatorType: IndicatorTypes.dot,
                  arrowColor: Colors.black,
                  axis: Axis.horizontal,
                  showArrow: true,
                  children: List.generate(
                      7,
                      (i) => Center(
                            child: Container(
                                color: Colors.red.withOpacity((i + 1) / 7)),
                          ))),
            ),
            SizedBox(
              height: 32,
            ),
            CircleBlackBtn(btnText: "시작하기", pageName: "login"),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
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
                    child: Text(
                      "회원가입",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
