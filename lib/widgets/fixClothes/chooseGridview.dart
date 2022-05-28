import 'dart:async';
import 'dart:developer';

import 'package:amuz_nidlecrew/db/wp-api.dart' as wp_api;
import 'package:amuz_nidlecrew/screens/main/fixClothes/fixSelect.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_woocommerce_api/flutter_woocommerce_api.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseGridView extends StatefulWidget {
  final int currentpage;
  final String category;

  const ChooseGridView({Key? key, required this.currentpage,required this.category}) : super(key: key);

  @override
  State<ChooseGridView> createState() => _ChooseGridViewState();
}

class _ChooseGridViewState extends State<ChooseGridView> {
  List<WooProduct> products = [];

  Future<List<WooProduct>> getProducts() async {
    // print("category " + widget.category);
    products = await wp_api.wooCommerceApi.getProducts(slug: widget.category);

    print(products.where((element) => element.id == 2150).toList());
    // log(products.toString());
    return products;
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // log(products.first.images.first.src.toString());
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24, top: 29),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 184,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: List.generate(products.length,
            (index) => chooseOptionItem(products[index], index)),
      ),
    );
  }

  // gridview 아이템
  Widget chooseOptionItem(WooProduct product, int index) {
    String imageSrc = product.images.first.src ?? "";
    return InkWell(
      onTap: () {
        Get.to(FixSelect());
      },
      child: Container(
        height: 184,
        decoration: BoxDecoration(
          border: Border.all(
            color: HexColor("#909090").withOpacity(0.5),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: double.infinity,
                height: 100,
                child: (imageSrc != "")
                    ? Image.network(imageSrc)
                    : Image.asset(
                        "assets/images/sample.jpeg",
                        fit: BoxFit.cover,
                      )),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: FontStyle(
                            text: product.name.toString(),
                            fontsize: "",
                            fontbold: "bold",
                            fontcolor: Colors.black,
                            textdirectionright: false),
                      ),
                      Icon(
                        CupertinoIcons.question_circle,
                        size: 15,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.price.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text("원"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
