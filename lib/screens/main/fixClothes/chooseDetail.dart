import 'package:amuz_nidlecrew/screens/main/fixClothes/directInsert.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/chooseGridview.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/header.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/progressbar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseDetail extends StatefulWidget {
  const ChooseDetail({Key? key}) : super(key: key);

  @override
  State<ChooseDetail> createState() => _ChooseDetailState();
}

class _ChooseDetailState extends State<ChooseDetail>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 4, vsync: this);

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
    _tabController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    List<String> items=["기장","허리","통","기타"];

    return Scaffold(
      appBar: FixClothesAppBar(
        appbar: AppBar(),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBar(progressImg: "fixProgressbar_2.svg"),
            Header(
              title: "수선 선택",
              subtitle1: "",
              subtitle2: "",
              question: true,
              btnIcon: "updateIcon.svg",
              btnText: "직접 입력하기",
              widget: DirectInsert(),
              imgPath: "",
              bottomPadding: 30,
            ),

            Container(
              padding: EdgeInsets.only(left: 24),
              height: 34,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(items.length, (index) => CategoryItem(items[index], index)),
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 29),
                child: ChooseGridView(currentpage: currentPage),
              ),
            ),

            Container()

            //
            // Container(
            //   padding: EdgeInsets.only(left: 24, right: 24),
            //   height: 100,
            //   child: TabBar(
            //     labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
            //     controller: _tabController,
            //     indicator: UnderlineTabIndicator(
            //       borderSide: BorderSide.none,
            //     ),
            //     tabs: [
            //
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: Container(
            //     child: TabBarView(
            //       controller: _tabController,
            //       children: [
            //         ChooseGridView(),
            //         Container(),
            //         Container(),
            //         Container(),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // category 목록
  Widget CategoryItem(String category, int currentpage) {
    return InkWell(
      onTap: (){
        setState(() {
          currentPage = currentpage;
        });
      },
      child: Container(
        padding: EdgeInsets.only(right: 9),
        child: Container(
            alignment: Alignment.center,
            width: 75,
            decoration: BoxDecoration(
              color:  currentPage == currentpage ? HexColor("#fd9a03") : Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                width: 1,
                color: currentPage == currentpage ? HexColor("#fd9a03") : HexColor("#d5d5d5"),
              ),
            ),
            child: Text(
              category,
              style: TextStyle(
                fontSize: 16,
                color: currentPage == currentpage ? Colors.white : HexColor("#909090"),
              ),
            ),
        ),
      ),
    );
  }
}
