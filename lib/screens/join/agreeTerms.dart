import 'package:amuz_nidlecrew/widgets/baseAppbar.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AgreeTerms extends StatefulWidget {
  const AgreeTerms({Key? key}) : super(key: key);

  @override
  State<AgreeTerms> createState() => _AgreeTermsState();
}

class _AgreeTermsState extends State<AgreeTerms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        appbar: AppBar(),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 24),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleText("환영합니다 :D"),
                  subtitleText("니들크루 서비 이용에 필요한 사항을"),
                  subtitleText("안내해드릴께요."),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 72),
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(27),
                shape: BoxShape.rectangle,
              ),
              child: TextButton(
                onPressed: () {
                },
                child: Text(
                  "약관 전체동의",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ),),
            Container(),
          ],
        ),
      ),
    );
  }


  // titleText style
  Widget titleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // subtitleText sytle
  Widget subtitleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: HexColor("#606060"),
      ),
    );
  }
}
