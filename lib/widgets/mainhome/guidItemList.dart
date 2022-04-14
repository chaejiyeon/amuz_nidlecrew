import 'package:amuz_nidlecrew/models/guideItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GuideItemList extends StatelessWidget {
  final GuideItem items;

  const GuideItemList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        height: 220,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  width: double.infinity,
                  child: FittedBox(
                      fit: BoxFit.cover, child: Image.asset(items.img))),
            ),
            Text(items.title),
            Text(items.subTitle),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset("assets/icons/floatingNext.svg"),
            )
          ],
        ),
    );
  }
}
