import 'package:amuz_nidlecrew/modal/addressIsHomeModal.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/imageUpload.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/progressbar.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/subtitle.dart';
import 'package:amuz_nidlecrew/widgets/floatingNextBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
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
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // progress bar
            ProgressBar(progressImg: "fixProgressbar.svg"),

            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontStyle(
                      text: "주소 안내",
                      fontsize: "lg",
                      fontbold: "bold",
                      fontcolor: Colors.black,
                      textdirectionright: false),
                  SizedBox(
                    height: 10,
                  ),
                  SubtitleText(text: "쇼핑몰에서 보내실 때 아래의 주소로"),
                  SubtitleText(text: "보내주세요!"),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: HexColor("#d5d5d5"),
                    )),
                    child: Text("부산시 구로구 구로동로 2 니들크루라운지 1층"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.snackbar("주소 복사", "주소가 복사되었습니다!");
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
                          istouched == true ? "주소가 복사되었습니다." : "터치하면 복사됩니다.",
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
                padding: EdgeInsets.only(left: 20, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "주문 내역 업로드",
                        fontsize: "lg",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                    SizedBox(
                      height: 10,
                    ),
                    SubtitleText(text: "결제 완료 후, 제품명과 옵션사항(컬러,사이즈 등)"),
                    SubtitleText(text: "내역이 정확히 보이도록 캡쳐해 올려주세요."),
                    SizedBox(
                      height: 20,
                    ),

                    // 사진 업로드
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

  // list 구별 선
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
