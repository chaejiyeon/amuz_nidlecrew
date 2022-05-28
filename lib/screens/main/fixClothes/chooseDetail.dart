import 'dart:developer';

import 'package:amuz_nidlecrew/models/sizeCheckGuideItem.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/directInsert.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/chooseGridview.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/header.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/progressbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woocommerce_api/flutter_woocommerce_api.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:amuz_nidlecrew/db/wp-api.dart' as wp_api;

class ChooseDetail extends StatefulWidget {
  final List<WooProductCategory> categories;
  const ChooseDetail({Key? key, required this.categories}) : super(key: key);

  @override
  State<ChooseDetail> createState() => _ChooseDetailState();
}

class _ChooseDetailState extends State<ChooseDetail>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 4, vsync: this);

  int currentPage = 0;
  String currentCategory = "";

  List<WooProductCategory> category = [];
  // List<WooProduct> products = [];

  // Future<List<WooProduct>> getProducts() async {
  //   categories = await wp_api.wooCommerceApi
  //       .getProductCategories(parent: widget.categories.);
  //   log(categories.toString());
  //   return categories;
  // }

  Future<List<WooProductCategory>> getCategories() async {
   category =  await widget.categories;

   return category;
  }

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
    getCategories();

    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          //
          // FutureBuilder(
          //   future: getCategories(),
          //     builder: (context,snapshot) {
          //   if(snapshot.hasData){
          //     return ListView(
          //       children: List.generate(category.length, (index) => CategoryItem(category[index].name.toString(), index)),
          //     );
          //   }else{
          //     return CircularProgressIndicator();
          //   }
          // }),
          Container(
            padding: EdgeInsets.only(left: 24),
            height: 34,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                 category.length, (index) => CategoryItem(category[index].name.toString(), index)),
            ),
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 29),
              child: ChooseGridView(currentpage: currentPage, category: currentCategory),
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
    );
  }

  // category 목록
  Widget CategoryItem(String category, int currentpage) {
    return InkWell(
      onTap: () {
        setState(() {
          currentPage = currentpage;
          currentCategory = category;
        });
      },
      child: Container(
        padding: EdgeInsets.only(right: 9),
        child: Container(
          alignment: Alignment.center,
          width: 75,
          decoration: BoxDecoration(
            color:
                currentPage == currentpage ? HexColor("#fd9a03") : Colors.white,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(
              width: 1,
              color: currentPage == currentpage
                  ? HexColor("#fd9a03")
                  : HexColor("#d5d5d5"),
            ),
          ),
          child: Text(
            category,
            style: TextStyle(
              fontSize: 16,
              color: currentPage == currentpage
                  ? Colors.white
                  : HexColor("#909090"),
            ),
          ),
        ),
      ),
    );
  }
}
