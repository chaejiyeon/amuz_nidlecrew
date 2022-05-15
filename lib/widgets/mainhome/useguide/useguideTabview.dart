import 'package:amuz_nidlecrew/models/useguideShopping.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/listLine.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class UseGuideTabView extends StatefulWidget {
  final int step;
  final ScrollController scrollController;
  final UseGuideShopping items;

  const UseGuideTabView(
      {Key? key,
      required this.scrollController,
      required this.step,
      required this.items})
      : super(key: key);

  @override
  State<UseGuideTabView> createState() => _UseGuideTabViewState();
}

class _UseGuideTabViewState extends State<UseGuideTabView> {
  @override
  Widget build(BuildContext context) {
    return Column(
        // controller: widget.scrollController,
        children: [
          listtitle(widget.items.title, widget.items.subtitle),
          liststepImg(widget.items.img, 40),
          for (int i = 0; i < widget.items.stepInfo.length; i++)
            widget.items.stepInfo[i].isstapInfo == false && widget.items.stepInfo.length > 0
                ? listStep(i+1, widget.items.stepInfo[i].listitem[0], true)
                : listStepInfo(
                    i+1,
                    widget.items.stepInfo[i].listitem),


          // bottom 기타사항
          widget.items.step == 5 ? Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.only(top: 100, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FontStyle(
                      text: "기타 사항",
                      fontsize: "md",
                      fontbold: "bold",
                      fontcolor: Colors.black,textdirectionright: false),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                    // height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor("#d5d5d5").withOpacity(0.2),
                    ),
                    child: Column(
                      children: [
                        listStepInfolist(
                            "옷의 부위와 재질, 수선 난이도에 따라 추가 비용이 발생할 수 있습니다.",
                            ["정확한 수선비용은 수선 전문가의 확인 후 결정됩니다."],
                            true),
                        listStepInfolist(
                            "수선이 불가능한 제품을 보냈을 시 제품을 고객님께 반송해 드립니다.",
                            [
                              "수선하기전 문의하기를 통해 수선 가능제품 여부를 확인해주세요.",
                              "제품 반송 택배비용은 착불로 결제됩니다."
                            ],
                            true),
                        listStepInfolist(
                            "밑단에 직접 표시해서 보내실 경우, 수선할 부위를 옷핀으로만 고정하면 이동 중 풀어질 수 있으니 시침핀 끝을 테이프로 고정해 보내시면 더욱 안전합니다.",
                            [],
                            true),
                        listStepInfolist(
                            "수선 치수 입력이 귀찮으시다면 견본 의류를 같이 보내주세요. 수선을 원하시는 부분을 견본 의류에 맞추어 드립니다.",
                            [
                              "단 보내실 때, 수선할 옷과 견본 의류를 잘 구분하여 표시해 주세요. 수선이 끝나면 수선된 옷과 견본 의류를 함께 보내드립니다."
                            ],
                            true),
                        listStepInfolist(
                            "옷을 포장할 때는 옷이 상하지 않게 두 겹으로 쌓거나 포장 박스를 이용해 주세요.",
                            [],
                            true),
                        listStepInfolist(
                            "문 앞에 내 놓으시면 수선 접수한 날로부터 1~2일 이내에 수거해 갑니다.",
                            ["주말, 공휴일 제외"],
                            false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ) : Container(),
        ],
    );
  }

  // listtitle
  Widget listtitle(String title, String content) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FontStyle(
            text: title,
            fontcolor: HexColor("#fd9a03"),
            fontbold: "bold",
            fontsize: "md",textdirectionright: false
          ),
          FontStyle(
            text: content,
            fontcolor: Colors.black,
            fontbold: "",
            fontsize: "",textdirectionright: false
          ),
        ],
      ),
    );
  }

  // liststep
  Widget listStep(int num, String text, bool listline) {
    return Container(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FontStyle(
                    text: num.toString() + ".",
                    fontsize: "",
                    fontbold: "bold",
                    fontcolor: HexColor("#fd9a03"),textdirectionright: false),
                SizedBox(
                  width: 10,
                ),
                FontStyle(
                    text: text,
                    fontsize: "",
                    fontbold: "bold",
                    fontcolor: Colors.black,textdirectionright: false),
              ],
            ),
          ),
          listline == true
              ? ListLine(
                  height: 1,
                  width: double.infinity,
                  lineColor: HexColor("#d5d5d5"),
                  opacity: 0.5)
              : Container(),
        ],
      ),
    );
  }

  // liststep+info
  Widget listStepInfo(int num, List text) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FontStyle(
              text: num.toString() + ".",
              fontsize: "",
              fontbold: "bold",
              fontcolor: HexColor("#fd9a03"),textdirectionright: false),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FontStyle(
                    text: text[0],
                    fontsize: "",
                    fontbold: "bold",
                    fontcolor: Colors.black,textdirectionright: false),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor("#d5d5d5").withOpacity(0.2),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FontStyle(
                          text: "*",
                          fontsize: "",
                          fontbold: "",
                          fontcolor: HexColor("#909090"),textdirectionright: false),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: FontStyle(
                            text: text[1],
                            fontsize: "",
                            fontbold: "",
                            fontcolor: HexColor("#909090"),textdirectionright: false),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // step별 이미지
  Widget liststepImg(String img, double toppadding) {
    return Container(
        height: 300,
        width: double.infinity,
        padding: EdgeInsets.only(top: toppadding, bottom: 40),
        child: SvgPicture.asset("assets/images/useguide/" + img, fit: BoxFit.cover,));
  }

  // liststepInfo > list
  Widget listStepInfolist(String titleContent, List subContent, bool listline) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 30,
            left: 10,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "*",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: 250,
                child: Text(
                  titleContent,
                  maxLines: 10,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        for (int i = 0; i < subContent.length; i++)
          Container(
            padding: EdgeInsets.only(left: 25, right: 30, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "*",
                  style: TextStyle(color: Colors.black),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      subContent[i],
                      maxLines: 10,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            // fontsize: "",
            // fontbold: "",
            // fontcolor: Colors.black),
          ),
        SizedBox(
          height: 20,
        ),
        listline == true
            ? ListLine(
                height: 1,
                width: double.infinity,
                lineColor: HexColor("#d5d5d5"),
                opacity: 0.5)
            : Container(),
      ],
    );
  }
}
