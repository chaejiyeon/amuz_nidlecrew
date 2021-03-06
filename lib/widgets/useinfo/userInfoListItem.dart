import 'package:needlecrew/bottomsheet/fixinfoSheet.dart';
import 'package:needlecrew/bottomsheet/useInfoProcessSheet.dart';
import 'package:needlecrew/getxController/useInfo/useInfoController.dart';
import 'package:needlecrew/modal/fixClothes/fixCompleteModal.dart';
import 'package:needlecrew/models/fixReady.dart';
import 'package:needlecrew/screens/main/mainHome.dart';
import 'package:needlecrew/widgets/circleLineBtn.dart';
import 'package:needlecrew/widgets/fixClothes/listLine.dart';
import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shimmer/shimmer.dart';

class UserInfoListItem extends StatefulWidget {
  final FixReady fixReady;
  final String fixState;
  final Future myFuture;

  const UserInfoListItem(
      {Key? key, required this.fixReady, required this.fixState, required this.myFuture})
      : super(key: key);

  @override
  State<UserInfoListItem> createState() => _UserInfoListItemState();
}

class _UserInfoListItemState extends State<UserInfoListItem> {
  final UseInfoController controller = Get.put(UseInfoController());

  void bottomsheetOpen(BuildContext context, String bottomsheet, int progressNum) {
    if (bottomsheet == "fixinfo") {
      showStickyFlexibleBottomSheet(
        minHeight: 0,
        initHeight: 0.9,
        maxHeight: 0.9,
        context: context,
        bottomSheetColor: HexColor("#fafafa").withOpacity(0.2),
        decoration: BoxDecoration(
          color: HexColor("#f7f7f7"),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(39)),
        ),
        headerHeight: 59,
        headerBuilder: (context, offset) {
          return bottomsheetHeader();
        },
        bodyBuilder: (context, offset) {
          return SliverChildListDelegate([
            // Container()
            FixInfoSheet(),
          ]);
        },
      );
    } else if (bottomsheet == "readyInfo") {
      showStickyFlexibleBottomSheet(
        minHeight: 0,
        initHeight: 0.65,
        maxHeight: 0.65,
        context: context,
        bottomSheetColor: HexColor("#fafafa").withOpacity(0.1),
        decoration: BoxDecoration(
          color: HexColor("#f7f7f7"),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(39)),
        ),
        headerHeight: 90,
        headerBuilder: (context, offset) {
          return Column(children: [
            Container(
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.topCenter,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(39)),
                ),
                child: Container(
                  height: 5,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50)),
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 24, right: 24),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "?????? ?????? ??????",
                        fontsize: "md",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                    SizedBox(
                      height: 7,
                    ),
                    ListLine(
                        height: 1,
                        width: double.infinity,
                        lineColor: HexColor("#fd9a03"),
                        opacity: 0.1),
                  ],
                ),
              ),
            ),
          ]);
        },
        bodyBuilder: (context, offset) {
          return SliverChildListDelegate([
            // Container()
            UseInfoProcessSheet(progressNum: progressNum),
          ]);
        },
      );
    }else if (bottomsheet == "detailInfo") {
      showStickyFlexibleBottomSheet(
        minHeight: 0,
        initHeight: 0.65,
        maxHeight: 0.65,
        context: context,
        bottomSheetColor: HexColor("#fafafa").withOpacity(0.1),
        decoration: BoxDecoration(
          color: HexColor("#f7f7f7"),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(39)),
        ),
        headerHeight: 90,
        headerBuilder: (context, offset) {
          return Column(children: [
            Container(
                padding: EdgeInsets.only(top: 10),
                alignment: Alignment.topCenter,
                height: 52,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(39)),
                ),
                child: Container(
                  height: 5,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50)),
                )),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 24, right: 24),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FontStyle(
                        text: "?????? ?????? ??????",
                        fontsize: "md",
                        fontbold: "bold",
                        fontcolor: Colors.black,
                        textdirectionright: false),
                    SizedBox(
                      height: 7,
                    ),
                    ListLine(
                        height: 1,
                        width: double.infinity,
                        lineColor: HexColor("#fd9a03"),
                        opacity: 0.1),
                  ],
                ),
              ),
            ),
          ]);
        },
        bodyBuilder: (context, offset) {
          return SliverChildListDelegate([
            // Container()
            UseInfoProcessSheet(progressNum: progressNum),
          ]);
        },
      );
    }
  }






  // ??????
  @override
  Widget build(BuildContext context) {
    print("current fix state this " + widget.fixReady.readyInfo.toString());

    return Container(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,
        ),
        child: widget.fixState == "ready"
            ? FixReady()
            : widget.fixState == "progress"
            ? FixProgress()
            : FixComplete(),
      );
    // Container(
    //   padding: EdgeInsets.only(
    //     left: 24,
    //     right: 24,
    //   ),
    //   child: widget.fixState == "ready"
    //       ? FixReady()
    //       : widget.fixState == "progress"
    //           ? FixProgress()
    //           : FixComplete(),
    // );
  }







  // ?????? ?????? widget
  Widget FixReady() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        listTitle(),
        FontStyle(
            text: widget.fixReady.readyInfo == 1
                ? "?????? ????????? ?????????????????????."
                : widget.fixReady.readyInfo == 2
                    ? "?????? ????????? ?????? ??????????????????."
                    : widget.fixReady.readyInfo == 3
                        ? "???????????? ????????? ??????????????? ??????????????????."
                        : widget.fixReady.readyInfo == 4
                            ? "???????????? ????????? ??????????????? ??????????????????."
                            : widget.fixReady.readyInfo == 5
                                ? "???????????? ???????????? ????????? ???????????? ????????????."
                                : "?????????????????? ?????? ?????? ????????? ??????????????????!",
            fontbold: "bold",
            fontsize: "md",
            fontcolor: Colors.black,
            textdirectionright: false),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            useinfoBtn("?????? ??????", "readyInfo"),
            useinfoBtn("?????? ??????", "detailInfo"),
            widget.fixReady.readyInfo == 6
                ? useinfoBtn("?????? ??????", "fixComplete")
                : Container(),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        listLine(),
      ],
    );
  }

  // ?????? ????????? widget
  Widget FixProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        listTitle(),
        FontStyle(
            text: "????????? ?????????????????????.",
            fontbold: "bold",
            fontsize: "md",
            fontcolor: Colors.black,
            textdirectionright: false),
        SizedBox(
          height: 20,
        ),
        CircleLineBtn(
          btnText: "?????? ??????",
          fontboxwidth: 100,
          bordercolor: HexColor("#d5d5d5"),
          fontcolor: Colors.black,
          fontsize: "",
          btnIcon: "",
          btnColor: Colors.white,
          widgetName: MainHome(),
          fontboxheight: "",
          iswidget: true,
        ),
        CircleLineBtn(
          btnText: "?????? ??????",
          fontboxwidth: 100,
          bordercolor: HexColor("#d5d5d5"),
          fontcolor: Colors.black,
          fontsize: "",
          btnIcon: "",
          btnColor: Colors.white,
          widgetName: MainHome(),
          fontboxheight: "",
          iswidget: true,
        ),
        SizedBox(
          height: 20,
        ),
        listLine(),
      ],
    );
  }

  // ?????? ?????? widget
  Widget FixComplete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        listTitle(),
        FontStyle(
            text: "????????? ?????????????????????.",
            fontbold: "bold",
            fontsize: "md",
            fontcolor: Colors.black,
            textdirectionright: false),
        SizedBox(
          height: 20,
        ),
        useinfoBtn("?????? ??????", "fixinfo"),
        SizedBox(
          height: 20,
        ),
        listLine(),
      ],
    );
  }

  //  <?????? ??????>
  // ?????? ??? ?????? ??????
  Widget listTitle() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          FontStyle(
              text: widget.fixReady.fixDate,
              fontcolor: HexColor("#909090"),
              fontsize: "",
              fontbold: "",
              textdirectionright: false),
          FontStyle(
              text: " / ",
              fontbold: "",
              fontsize: "",
              fontcolor: HexColor("#909090"),
              textdirectionright: false),
          FontStyle(
              text: widget.fixReady.fixType,
              fontbold: "",
              fontsize: "",
              fontcolor: HexColor("#909090"),
              textdirectionright: false),
        ],
      ),
    );
  }

  // list ?????? ???
  Widget listLine() {
    return Container(
      height: 2,
      width: double.infinity,
      decoration: BoxDecoration(color: HexColor("#fd9a03").withOpacity(0.1)),
    );
  }

  // bottomsheet ?????? ??????
  Widget useinfoBtn(String text, String bottomsheet) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 87,
      height: 36,
      decoration: BoxDecoration(
        color: text == "?????? ??????" ? HexColor("#fd9a03") : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          width: 1,
          color: text == "?????? ??????" ? HexColor("#fd9a03") : HexColor("#d5d5d5"),
        ),
      ),
      child: TextButton(
        onPressed: () {
          if(text == "?????? ??????"){
            Get.dialog(FixCompleteModal());
          }
          bottomsheetOpen(context, bottomsheet, widget.fixReady.readyInfo);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: text == "?????? ??????" ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ?????? ?????? bottomsheetHeader
  Widget bottomsheetHeader() {
    return Container(
      height: 59,
      decoration: BoxDecoration(
        color: HexColor("#f7f7f7"),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      padding: EdgeInsets.only(left: 24, top: 25, right: 24, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FontStyle(
              text: "?????? ??????",
              fontsize: "md",
              fontbold: "bold",
              fontcolor: Colors.black,
              textdirectionright: false),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: SvgPicture.asset(
              "assets/icons/exitIcon.svg",
              width: 24,
              height: 24,
            ),
          )
        ],
      ),
    );
  }



  // Widget countSkeleton() {
  //   return Shimmer.fromColors(
  //       baseColor: Color.fromRGBO(240, 240, 240, 1),
  //       highlightColor: Colors.white,
  //       child: skeletonItem()
  //   );
  // }
  //
  // Widget skeletonItem() {
  //   return Container(
  //     padding: EdgeInsets.only(left: 24, top: 10, right: 24),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           padding: EdgeInsets.only(bottom: 5),
  //           width: 195,
  //           height: 20,
  //           color: Colors.grey,
  //         ),
  //         Container(
  //           padding: EdgeInsets.only(bottom: 3),
  //           margin: EdgeInsets.only(top: 5),
  //           width: 152,
  //           height: 24,
  //           color: Colors.grey,
  //         ),
  //         SizedBox(
  //           height: 3,
  //         ),
  //         Container(
  //           width: 87,
  //           height: 36,
  //           color: Colors.grey,
  //         ),
  //         Container(
  //           margin: EdgeInsets.only(top: 10),
  //           width: double.infinity,
  //           height: 1,
  //           color: Colors.grey,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
