import 'package:amuz_nidlecrew/screens/main/fixClothes/fixSelect.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ChooseGridView extends StatefulWidget {
  final int currentpage;
  const ChooseGridView({Key? key, required this.currentpage}) : super(key: key);

  @override
  State<ChooseGridView> createState() => _ChooseGridViewState();
}

class _ChooseGridViewState extends State<ChooseGridView> {



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 184,
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        children: [
          if(widget.currentpage == 1) chooseOptionItem("총 기장 줄임", "5,000"),
          chooseOptionItem("총 기장 줄임", "5,000"),
        ],
      ),
    );
  }

  // gridview 아이템
  Widget chooseOptionItem(String text, String price) {
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
          children: [
            Container(
                width: double.infinity,
                height: 100,
                child: Image.asset(
                  "assets/images/sample.jpeg",
                  fit: BoxFit.cover,
                )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      FontStyle(
                          text: text,
                          fontsize: "md",
                          fontbold: "bold",
                          fontcolor: Colors.black,
                          textdirectionright: false),
                      SizedBox(
                        width: 4.2,
                      ),
                      Icon(
                        CupertinoIcons.question_circle,
                        size: 15,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(fontSize: 15),
                      ),
                      Text("원"),
                    ],
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
