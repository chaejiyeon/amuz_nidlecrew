import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class ImageUpload extends StatefulWidget {
  final String icon;
  const ImageUpload({Key? key, required this.icon}) : super(key: key);

  @override
  State<ImageUpload> createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(10),
        dashPattern: [5, 5],
        color: HexColor("#d5d5d5"),
        padding: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 20),
        child: Column(
          children: [
            SvgPicture.asset("assets/icons/fixClothes/" + widget.icon),
            Text("0/10", style: TextStyle(color: HexColor("#909090"),),),
          ],
        ),
      ),
    );
  }
}
