import 'dart:convert';

import 'package:amuz_nidlecrew/models/chooseClothes.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/chooseSecond.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes/fixQuestion.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/footerBtn.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/header.dart';
import 'package:amuz_nidlecrew/widgets/fixClothes/progressbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class ChooseFirst extends StatefulWidget {
  final int stepNum;

  const ChooseFirst({Key? key, required this.stepNum}) : super(key: key);

  @override
  State<ChooseFirst> createState() => _ChooseFirstState();
}

List<ChooseClothes> parseCategories(response) {
  final parsed = jsonDecode(response).cast<Map<String, dynamic>>();
  return parsed
      .map<ChooseClothes>((json) => ChooseClothes.fromJson(json))
      .toList();
}

// Future<List<ChooseClothes>> fecthCategories() async {
//   final response = await http.get("http://needlecrew.com/wp-json/wp/v2/product",
//       headers: {
//         "Content-Type": "application/json;charset=UTF-8",
//         "Charset": "utf-8"
//       });
//   return compute(parseCategories, response.body);
// }

class _ChooseFirstState extends State<ChooseFirst> {
  late Future<List<ChooseClothes>> categories;

  PageController _pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    // categories = fecthCategories();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ChooseClothes> step1 = [
      ChooseClothes(1, "하의"),
      ChooseClothes(2, "상의"),
      ChooseClothes(3, "아우터"),
      ChooseClothes(4, "원피스"),
      ChooseClothes(5, "정장/교복"),
    ];
    // List<ChooseClothes> step2 = [
    //   ChooseClothes(1, "바지"),
    //   ChooseClothes(2, "스커트"),
    //   ChooseClothes(3, "직접입력"),
    // ];
    // List<ChooseClothes> step3 = [
    //   ChooseClothes(1, "일반바지"),
    //   ChooseClothes(2, "청바지"),
    //   ChooseClothes(3, "트레이닝바지"),
    //   ChooseClothes(4, "가죽/레지바지"),
    //   ChooseClothes(5, "직접입력"),
    // ];

    return Scaffold(
      appBar: FixClothesAppBar(
        appbar: AppBar(),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProgressBar(progressImg: "fixProgressbar_1.svg"),
            Header(
              title: "의류 선택",
              subtitle1: "어떤 옷을 수선하고 싶으세요?",
              subtitle2: "",
              question: true,
              btnIcon: "chatIcon.svg",
              btnText: "수선 문의하기",
              widget: FixQuestion(),
              imgPath: "fixClothes",
              bottomPadding: 50,
            ),

            // choose 버튼 (step별)
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: ListView(
                  children: List.generate(
                    step1.length,
                    (index) => ChooseBtn(step1[index]),
                  ),
                ),
              ),
            ),

            // Expanded(
            //   child: Container(
            //     padding: EdgeInsets.all(20),
            //     child: FutureBuilder<List<ChooseClothes>>(
            //         future: categories,
            //         builder: (context, snapshot) {
            //           if (snapshot.hasData) {
            //             return ListView.builder(
            //                 itemCount: snapshot.data!.length,
            //                 itemBuilder: (context, index) {
            //                   return Column(children: [
            //                     Container(
            //                         width: double.infinity,
            //                         padding: EdgeInsets.all(20),
            //                         decoration: BoxDecoration(
            //                           borderRadius: BorderRadius.circular(30),
            //                           border: Border.all(
            //                             color: HexColor("#d5d5d5"),
            //                           ),
            //                         ),
            //                         child: Text(
            //                           "${snapshot.data![index].chooseItem}",
            //                           textAlign: TextAlign.center,
            //                         )),
            //                     SizedBox(
            //                       height: 10,
            //                     ),
            //                   ]);
            //                 });
            //           } else if (snapshot.hasError) {
            //             return Text("error");
            //           }
            //           return CircularProgressIndicator();
            //         }),
            //   ),
            // ),

            // currentPage == 0
            //     ? Container(height: 100, child: FooterBtn())
            //     : Container(),
          ],
        ),
      ),
      bottomNavigationBar: Container(height: 82, child: FooterBtn()),
      // floatingActionButton: currentPage == 2
      //     ? Container(
      //         padding: EdgeInsets.only(bottom: 50),
      //         child: FloatingNextBtn(page: ChooseSecond()),
      //       )
      //     : Container(),
    );
  }

  Widget ChooseBtn(ChooseClothes clothes) {
    return InkWell(
      onTap: (){
        Get.to(ChooseSecond(optionNum: clothes.optionNum));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 1,
            color: HexColor("#d5d5d5"),
          ),
        ),
        child: Text(clothes.chooseItem,textAlign: TextAlign.center, style: TextStyle(fontSize: 15),),
      ),
    );
  }
}
