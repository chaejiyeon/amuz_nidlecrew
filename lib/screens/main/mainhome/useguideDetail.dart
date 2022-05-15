import 'package:amuz_nidlecrew/models/useguideShopping.dart';
import 'package:amuz_nidlecrew/screens/main/alramInfo.dart';
import 'package:amuz_nidlecrew/screens/main/cartInfo.dart';
import 'package:amuz_nidlecrew/widgets/appbarItem.dart';
import 'package:amuz_nidlecrew/widgets/mainhome/useguide/useguideTabview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

class UseGuideDetail extends StatefulWidget {
  const UseGuideDetail({Key? key}) : super(key: key);

  @override
  State<UseGuideDetail> createState() => _UseGuideDetailState();
}

class _UseGuideDetailState extends State<UseGuideDetail>
    with TickerProviderStateMixin {
  late TabController _tabcontroller = TabController(length: 5, vsync: this);
  final scrollCotroller = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 5, vsync: this);
    scrollCotroller.addListener(listenScrolling);
  }

  @override
  void dispose() {
    super.dispose();
    _tabcontroller.dispose();
    scrollCotroller.dispose();
  }

  void listenScrolling() {
    if (scrollCotroller.position.atEdge) {
      final isTop = scrollCotroller.position.pixels == 0;

      if (isTop) {
        print("start");
      } else {
        print("end");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VerticalScrollableTabView(
        tabController: _tabcontroller,
        listItemData: shoppingsteps,
        verticalScrollPosition: VerticalScrollPosition.begin,
        eachItemChild: (object, index) => Container(
          child: Container(
            child: Column(
              children: List.generate(
                shoppingsteps.length,
                (index) => UseGuideTabView(
                    scrollController: scrollCotroller,
                    step: index,
                    items: shoppingsteps[index]),
              ),
            ),
          ),
        ),
        slivers: [
          SliverAppBar(
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  CupertinoIcons.back,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            expandedHeight: 100.0,
            title: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 70),
                          child: Text(
                            "이용가이드",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              AppbarItem(
                  icon: "cartIcon.svg",
                  iconColor: Colors.black,
                  iconFilename: "main",
                  widget: CartInfo()),
              AppbarItem(
                  icon: "alramIcon.svg",
                  iconColor: Colors.black,
                  iconFilename: "main",
                  widget: AlramInfo()),
            ],
            pinned: true,
            bottom: TabBar(
              isScrollable: true,
              controller: _tabcontroller,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              indicatorColor: Colors.cyan,
              labelColor: Colors.cyan,
              unselectedLabelColor: Colors.white,
              indicatorWeight: 3.0,
              tabs: shoppingsteps.map((e) {
                return Tab(text: e.title);
              }).toList(),
              onTap: (index) {
                VerticalScrollableTabBarStatus.setIndex(index);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          scrollCotroller.animateTo(0,
              duration: Duration(milliseconds: 1), curve: Curves.linear);
        },
        child: SvgPicture.asset("assets/icons/upIcon.svg"),
      ),
    );
  }
}
