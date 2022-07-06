import 'package:needlecrew/widgets/fontStyle.dart';
import 'package:needlecrew/widgets/mainhome/sizeCheckGuide/sizeInfo.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class FixSizeQuideSheet extends StatefulWidget {
  const FixSizeQuideSheet({Key? key}) : super(key: key);

  @override
  State<FixSizeQuideSheet> createState() => _FixSizeQuideSheetState();
}

class _FixSizeQuideSheetState extends State<FixSizeQuideSheet>
    with TickerProviderStateMixin {
  final ScrollController scrollController = ScrollController();

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

  @override
  Widget build(BuildContext context) {
    return ListView(controller: scrollController, shrinkWrap: true, children: [
      Container(
        height: 140,
        padding: EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FontStyle(
                text: "치수 측정 가이드",
                fontsize: "md",
                fontbold: "bold",
                fontcolor: Colors.black,
                textdirectionright: false),
            FontStyle(
                text: "정확한 치수를 위해 바닥에 펴놓고 측정해주세요.",
                fontsize: "",
                fontbold: "",
                fontcolor: Colors.black,
                textdirectionright: false),
            Container(
              padding: EdgeInsets.only(top: 30),
              height: 70,
              child: TabBar(
                padding: EdgeInsets.zero,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.zero,
        child: TabBarView(
          controller: _tabController,
          children: List.generate(tabHeader.length, (index) => Container())
        ),
      ),
    ]);
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
