import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/addressInsertForm.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class AddressAdd extends StatefulWidget {
  const AddressAdd({Key? key}) : super(key: key);

  @override
  State<AddressAdd> createState() => _AddressAddState();
}

class _AddressAddState extends State<AddressAdd> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: AddressInsertForm(appbarName: "주소 등록",addressSearch: true, hinttext1: "지번,도로명,건물명 검색",hinttext2: "상세주소"),


        bottomNavigationBar: Container(
            padding: EdgeInsets.all(20),
            child: CircleBlackBtn(btnText: "완료", pageName: "back")),
      ),
    );
  }


}