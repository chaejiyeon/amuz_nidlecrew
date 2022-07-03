import 'package:amuz_nidlecrew/bottomsheet/fixinfoSheet.dart';
import 'package:amuz_nidlecrew/bottomsheet/useInfoProcessSheet.dart';
import 'package:amuz_nidlecrew/getxController/useInfo/useInfoController.dart';
import 'package:amuz_nidlecrew/modal/fixClothes/fixCompleteModal.dart';
import 'package:amuz_nidlecrew/models/fixReady.dart';
import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/widgets/circleLineBtn.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class UserInfoListItem extends StatefulWidget {
  final FixReady fixReady;
  final String fixState;

  const UserInfoListItem(
      {Key? key, required this.fixReady, required this.fixState})
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
                        text: "수선 진행 상황",
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
                        text: "수선 진행 상황",
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
  }

  // 수선 대기 widget
  Widget FixReady() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        listTitle(),
        FontStyle(
            text: widget.fixReady.readyInfo == 1
                ? "수선 접수가 완료되었습니다."
                : widget.fixReady.readyInfo == 2
                    ? "의류 수거를 위해 준비중입니다."
                    : widget.fixReady.readyInfo == 3
                        ? "고객님의 의류가 수선사에게 배송중입니다."
                        : widget.fixReady.readyInfo == 4
                            ? "고객님의 의류가 수선사에게 도착했습니다."
                            : widget.fixReady.readyInfo == 5
                                ? "수선사가 고객님의 의류를 확인하고 있습니다."
                                : "수선내역에서 최종 결제 비용을 확인해주세요!",
            fontbold: "bold",
            fontsize: "md",
            fontcolor: Colors.black,
            textdirectionright: false),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            useinfoBtn("진행 상황", "readyInfo"),
            useinfoBtn("수선 내역", "detailInfo"),
            widget.fixReady.readyInfo == 6
                ? useinfoBtn("수선 확정", "fixComplete")
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

  // 수선 진행중 widget
  Widget FixProgress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        listTitle(),
        FontStyle(
            text: "수선이 완료되었습니다.",
            fontbold: "bold",
            fontsize: "md",
            fontcolor: Colors.black,
            textdirectionright: false),
        SizedBox(
          height: 20,
        ),
        CircleLineBtn(
          btnText: "수선 내역",
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
          btnText: "사진 보기",
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

  // 수선 완료 widget
  Widget FixComplete() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        listTitle(),
        FontStyle(
            text: "수선이 완료되었습니다.",
            fontbold: "bold",
            fontsize: "md",
            fontcolor: Colors.black,
            textdirectionright: false),
        SizedBox(
          height: 20,
        ),
        useinfoBtn("수선 내역", "fixinfo"),
        SizedBox(
          height: 20,
        ),
        listLine(),
      ],
    );
  }

  //  <공통 위젯>
  // 날짜 및 수선 타입
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

  // list 구별 선
  Widget listLine() {
    return Container(
      height: 2,
      width: double.infinity,
      decoration: BoxDecoration(color: HexColor("#fd9a03").withOpacity(0.1)),
    );
  }

  // bottomsheet 연결 버튼
  Widget useinfoBtn(String text, String bottomsheet) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      width: 87,
      height: 36,
      decoration: BoxDecoration(
        color: text == "수선 확정" ? HexColor("#fd9a03") : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          width: 1,
          color: text == "수선 확정" ? HexColor("#fd9a03") : HexColor("#d5d5d5"),
        ),
      ),
      child: TextButton(
        onPressed: () {
          if(text == "수선 확정"){
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
                color: text == "수선 확정" ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 수선 내역 bottomsheetHeader
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
              text: "수선 내역",
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
}
