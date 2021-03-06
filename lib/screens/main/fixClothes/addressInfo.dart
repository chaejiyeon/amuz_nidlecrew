import 'package:needlecrew/getxController/fixClothes/CartController.dart';
import 'package:needlecrew/modal/addressIsHomeModal.dart';
import 'package:needlecrew/screens/main/fixClothes/imageUpload.dart';
import 'package:needlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:needlecrew/widgets/fixClothes/progressbar.dart';
import 'package:needlecrew/widgets/fixClothes/subtitle.dart';
import 'package:needlecrew/widgets/floatingNextBtn.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'chooseClothes.dart';

class AddressInfo extends StatefulWidget {
  final bool isHome;
  const AddressInfo({Key? key, required this.isHome}) : super(key: key);

  @override
  State<AddressInfo> createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  bool istouched = false;




  @override
  void initState(){
    super.initState();
    if(widget.isHome == false){
      Future.delayed(Duration.zero, () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AddressIsHomeModal();
            });
      });


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixClothesAppBar(
        appbar: AppBar(),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // progress bar
            ProgressBar(progressImg: "fixProgressbar.svg"),

            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontStyle(
                      text: "?????? ??????",
                      fontsize: "lg",
                      fontbold: "bold",
                      fontcolor: Colors.black,
                      textdirectionright: false),
                  SizedBox(
                    height: 10,
                  ),
                  SubtitleText(text: "??????????????? ????????? ??? ????????? ????????? ???????????????!"),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: HexColor("#d5d5d5"),
                    )),
                    child: Text("????????? ????????? ???????????? 2 ????????????????????? 1???"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.snackbar("?????? ??????", "????????? ?????????????????????!");
                      setState(() {
                        istouched = true;
                      });
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/fixClothes/speakerIcon.svg",
                          color: istouched == true ? HexColor("#fd9a03") : null,
                        ),
                        Text(
                          istouched == true ? "????????? ?????????????????????." : "???????????? ???????????????.",
                          style: TextStyle(
                            color:
                                istouched == true ? HexColor("#fd9a03") : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "?????? ?????? ?????????",
                        fontsize: "lg",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                    SizedBox(
                      height: 10,
                    ),
                    SubtitleText(text: "?????? ?????? ???, ???????????? ????????????(??????,????????? ???) ????????? ????????? ???????????? ????????? ???????????????."),
                    SizedBox(
                      height: 20,
                    ),

                    // ?????? ?????????
                    ImageUpload(icon: "pictureIcon.svg",isShopping: true)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingNextBtn(page: ChooseClothes(parentNum: 0), ischecked: true),
    );
  }

  // list ?????? ???
  Widget listLine(
      double height, double width, Color lineColor, double opacity) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      height: height,
      width: width,
      decoration: BoxDecoration(color: lineColor.withOpacity(opacity)),
    );
  }
}
