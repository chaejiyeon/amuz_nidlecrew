import 'package:amuz_nidlecrew/widgets/useinfo/useAppbar.dart';
import 'package:amuz_nidlecrew/widgets/useinfo/userInfoList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class UseInfo extends StatefulWidget {
  const UseInfo({Key? key}) : super(key: key);

  @override
  State<UseInfo> createState() => _UseInfoState();
}

class _UseInfoState extends State<UseInfo> with TickerProviderStateMixin {
  List<String> img = [
    "assets/images/guideImage_3.png",
    "assets/images/useInfoImage_2.png",
    "assets/images/useInfoImage_3.png"
  ];
  late TabController _tabController = TabController(length: 3, vsync: this);
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        tabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("imgindex : $tabIndex");
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
          UseAppBar(title: "나의 이용내역", appbarcolor: "white", appbar: AppBar()),
      body: Column(
        children: [
          Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    child: Image.asset(
                      img[tabIndex],
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 350,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/overlayImage.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),

              Positioned(
                left: 61,
                right: 62,
                bottom: 120,
                child: Container(
                  width: 251,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Row(
                          children: [
                            iconStyle("bookIcon.svg", "useinfo"),
                            dotLine(),
                            iconStyle("fixclothesIcon.svg", "main"),
                            dotLine(),
                            iconStyle("useClothesIcon.svg", "useinfo"),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        iconWrap("수선 대기"),
                        iconWrap("수선 진행중"),
                        iconWrap("수선 완료"),
                      ],),

                    ],
                  ),
                ),
              ),
              //
              // Positioned(
              //   left: 61,
              //   bottom: 120,
              //   child: Container(
              //     width: 251,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         iconWrap("bookIcon.svg", "useinfo", "수선 대기"),
              //         // bar dot
              //         Container(
              //             height: 50,
              //             padding: EdgeInsets.all(10),
              //             child: Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [barDot(), barDot(), barDot()],
              //             )),
              //         iconWrap("fixclothesIcon.svg", "main", "수선 진행중"),
              //         // bar dot
              //         Container(
              //             height: 50,
              //             padding: EdgeInsets.all(10),
              //             child: Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [barDot(), barDot(), barDot()],
              //             )),
              //         iconWrap("useClothesIcon.svg", "useinfo", "수선 완료"),
              //       ],
              //     ),
              //   ),
              // ),

              // tab명
              Align(
                heightFactor: 5,
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 24, right: 24, top: 10),
                    height: 70,
                    color: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                              color: HexColor("#fd9a03").withOpacity(0.2),
                              width: 2),
                        ),
                      ),
                      child: TabBar(
                        labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        unselectedLabelColor: HexColor("#909090"),
                        unselectedLabelStyle: TextStyle(fontSize: 16),
                        indicatorColor: HexColor("#fd9a03"),
                        controller: _tabController,
                        tabs: [
                          Tab(text: "수선 대기"),
                          Tab(text: "수선 진행중"),
                          Tab(text: "수선 완료"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // tab별 화면
          Expanded(
            child: Container(
              color: Colors.white,
              child: TabBarView(
                controller: _tabController,
                children: [
                  UserInfoList(fixState: "ready"),
                  UserInfoList(fixState: "progress"),
                  UserInfoList(fixState: "complete"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // icon style 설정
  Widget iconStyle(String icon, String filename) {
    return SvgPicture.asset(
      "assets/icons/" + filename + "/" + icon,
      width: 32,
      height: 39,
    );
  }

  // icon 사이 바
  Widget barDot() {
    return Container(
      margin: EdgeInsets.only(left: 5),
      height: 1,
      width: 5,
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  // icon, 건수, title 전체 wrap
  Widget iconWrap(String content) {
    Color fontcolor = Colors.white;
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "0",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "건",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            content,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // bar dot
  Widget dotLine() {
    return Container(
        height: 50,
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [barDot(), barDot(), barDot(), barDot()],
        ));
  }
}
