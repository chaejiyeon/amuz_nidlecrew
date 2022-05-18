import 'dart:async';

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

  const ChooseGridView({Key? key, required this.currentpage}) : super(key: key);

  @override
  State<ChooseGridView> createState() => _ChooseGridViewState();
}

class _ChooseGridViewState extends State<ChooseGridView> {
  List<WooProduct> products = [];

  Future<void> getProducts() async {
    products = await wp_api.wooCommerceApi.getProducts();
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
      padding: EdgeInsets.only(left: 24, right: 24),
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
