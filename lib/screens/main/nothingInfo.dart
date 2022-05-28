import 'package:amuz_nidlecrew/widgets/fixClothes/fixClothesAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class NothingInfo extends StatefulWidget {
  const NothingInfo({Key? key}) : super(key: key);

  @override
  State<NothingInfo> createState() => _NothingInfoState();
}

class _NothingInfoState extends State<NothingInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FixClothesAppBar(
        appbar: AppBar(),
      ),
      body: Container(
        child: Column(
          children: [
            SvgPicture.asset("assets/icons/xmarkIcon.svg"),
            Text(
              "",
              style: TextStyle(color: HexColor("#606060"), fontSize: 16),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: HexColor("#d5d5d5"),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "수선하기",
                      style: TextStyle(color: HexColor("#202427")),
                    ),
                    SvgPicture.asset(
                      "assets/icons/nextIcon.svg",
                      color: HexColor("#202427"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
