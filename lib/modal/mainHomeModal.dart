import 'package:amuz_nidlecrew/getxController/fixClothes/cartController.dart';
import 'package:amuz_nidlecrew/getxController/homeController.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/startAddressChoose.dart';
import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/widgets/circleLineBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_woocommerce_api/flutter_woocommerce_api.dart';
import 'package:get/get.dart';
import 'package:amuz_nidlecrew/db/wp-api.dart' as wp_api;



class MainHomeModal extends StatefulWidget {
  const MainHomeModal({Key? key}) : super(key: key);

  @override
  State<MainHomeModal> createState() => _MainHomeModalState();
}

class _MainHomeModalState extends State<MainHomeModal> {
  late Future getName;

  String? name = "";

  Future<void> getUsername() async {
    name = await wp_api.storage.read(key: 'username');
  }


  @override
  void initState(){
    getName = getUsername();
    super.initState();
  }


  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    controller.getUser();

    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.only(top: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
                controller.isMainmodal(true);
              },
              child: Icon(
                CupertinoIcons.xmark_circle,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // Obx(() {
            //   if (controller.isInitialized.value) {
            //     return FontStyle(
            //         text: "반가워요, " +
            //             wp_api.user.lastName.toString() +
            //             wp_api.user.firstName.toString() +
            //             "님!",
            //         fontsize: "lg",
            //         fontbold: "bold",
            //         fontcolor: Colors.white,
            //         textdirectionright: false);
            //   } else {
            //     return Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   }
            // }),
            FutureBuilder(future: getName, builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return FontStyle(
                    text: "반가워요, " + name! +
                        "님!",
                    fontsize: "lg",
                    fontbold: "bold",
                    fontcolor: Colors.white,
                    textdirectionright: false);
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            }),

            FontStyle(
                text: "지금 바로 니들크루 수선의뢰를",
                fontsize: "md",
                fontbold: "",
                fontcolor: Colors.white,
                textdirectionright: false),
            FontStyle(
                text: "이용해 보시겠어요?",
                fontsize: "md",
                fontbold: "",
                fontcolor: Colors.white,
                textdirectionright: false),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleLineBtn(
                    btnText: "이용하기",
                    fontboxwidth: 100,
                    bordercolor: Colors.white,
                    fontcolor: Colors.white,
                    fontsize: "",
                    btnIcon: "",
                    btnColor: Colors.transparent,
                    widgetName: FixClothes(),
                    fontboxheight: "",
                    iswidget: true,
                  ),
                  Expanded(
                      child: SvgPicture.asset("assets/images/mainInfo.svg")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
