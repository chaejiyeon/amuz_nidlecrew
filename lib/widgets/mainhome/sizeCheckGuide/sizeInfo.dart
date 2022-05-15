import 'package:amuz_nidlecrew/models/sizeCheckGuideItem.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SizeInfo extends StatefulWidget {
  const SizeInfo({Key? key}) : super(key: key);

  @override
  State<SizeInfo> createState() => _SizeInfoState();
}

class _SizeInfoState extends State<SizeInfo> with TickerProviderStateMixin {
  List<String> tabHeader = [
    "총 기장 줄임",
    "전체 폭 줄임",
    "목 둘레 줄임",
    "소매 기장 줄임",
    "소매 통 줄임"
  ];

  List<SizeCheckGuide> items = [
    SizeCheckGuide(1, "총 기장 줄임", "sample.jpeg"),
    SizeCheckGuide(1, "전체 폭 줄임", "sample_2.jpeg"),
    SizeCheckGuide(1, "목 둘레 줄임", "sample_3.jpeg"),
    SizeCheckGuide(1, "소매 기장 줄임", "sample_2.jpeg"),
    SizeCheckGuide(1, "소매 통 줄임", "sample.jpeg"),
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

  @override
  Widget build(BuildContext context) {

    print(tabHeader[currentPage]);
    return Container(
      child: Column(
        children: [
          Container(
            child: TabBar(
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
              controller: _tabController,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide.none,
              ),
              tabs: List.generate(
                tabHeader.length,
                (index) => CategoryItem(tabHeader[index], index),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(
                  items.length,
                  (index) => Container(
                    child: tabHeader[index] == items[index].categoryName
                        ? CategoryImage(items[index].categoryImg)
                        : Container(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // category 목록
  Widget CategoryItem(String category, int index) {
    print("$index");
    print(tabHeader.length);
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 40,
          child: Text(
            category,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        tabHeader.length - index != 1
            ? Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                height: 20,
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                  color: HexColor("#909090"),
                ))),
              )
            : Container(),
      ],
    );
  }

  Widget CategoryImage(String img) {
    return Container(
      child: Image.asset("assets/images/" + img),
    );
  }
}
