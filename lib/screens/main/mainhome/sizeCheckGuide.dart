import 'package:amuz_nidlecrew/widgets/mainhome/priceInfo/priceInfoheader.dart';
import 'package:amuz_nidlecrew/widgets/mainhome/sizeCheckGuide/sizeInfo.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SizeCheckGuide extends StatefulWidget {
  const SizeCheckGuide({Key? key}) : super(key: key);

  @override
  State<SizeCheckGuide> createState() => _SizeCheckGuideState();
}

class _SizeCheckGuideState extends State<SizeCheckGuide>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<String> tabHeader = [
      "상의",
      "하의",
      "원피스",
      "아우터",
      "정장/교복",
    ];
    late TabController _tabController =
        TabController(length: tabHeader.length, vsync: this);
    int currentPage = 0;

    @override
    void initState() {
      super.initState();
      _tabController.addListener(() {
        setState(() {
          currentPage = _tabController.index;
        });
      });
    }

    @override
    void dispose() {
      super.dispose();
      _tabController.dispose();
    }

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            PriceInfoHeader(
                bannerImg: "sample.jpeg",
                mainText1: "생소했던 용어.헷갈리던 측정법.",
                mainText2: "니들크루가 알려드릴게요!",
                titleText: "치수 측정 가이드",
                subtitle: "정확한 치수를 위해 바닥에 펴놓고 측정해주세요."),
            Container(
              height: 100,
              child: TabBar(
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                controller: _tabController,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide.none,
                ),
                tabs: List.generate(
                  tabHeader.length,
                  (index) => CategoryItem(tabHeader[index]),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                controller: _tabController,
                children: [
                  SizeInfo(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // category 목록
  Widget CategoryItem(String category) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          width: 1,
          color: HexColor("#d5d5d5"),
        ),
      ),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }
}
