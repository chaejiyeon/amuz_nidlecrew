import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MypageDropDown extends StatefulWidget {
  final bool hintCheck;
  final String hint;
  final int selectNum;

  const MypageDropDown({Key? key,required this.hintCheck, required this.selectNum, required this.hint}) : super(key: key);

  @override
  State<MypageDropDown> createState() => _PriceDropDownState();
}

class _PriceDropDownState extends State<MypageDropDown> {

  List select1 = [
    {'no': 1, 'keyword': 'gmail.com'},
    {'no': 2, 'keyword': 'naver.com'},
    {'no': 3, 'keyword': 'hanmail.net'},
    {'no': 4, 'keyword': 'nate.com'},
  ];

  List select2 = [
    {'no': 1, 'keyword': '1'},
    {'no': 2, 'keyword': '2'},
    {'no': 3, 'keyword': '3'},
    {'no': 4, 'keyword': '4'},
  ];

  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  var _selectedTest;
  bool selected = false;

  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(widget.selectNum == 1
        ? select1
        : select2 );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<DropdownMenuItem<Object?>> buildDropdownTestItems(List select) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in select) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(i['keyword']),
        ),
      );
    }
    return items;
  }

  onChangeDropdownTests(selectedTest) {
    print(selectedTest);
    setState(() {
      _selectedTest = selectedTest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: widget.selectNum == 1 ? EdgeInsets.only(left: 10) : EdgeInsets.only(top: 10),
        child: Column(
          children: [
            DropdownBelow(
              itemWidth: widget.selectNum == 1 ? 140 : 350,
              itemTextstyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              boxTextstyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
              boxPadding: EdgeInsets.fromLTRB(13, 12, 13, 12),
              boxWidth: double.infinity,
              boxHeight: 45,
              boxDecoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: 1,
                  color: HexColor("#909090").withOpacity(0.5),
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              icon: selected == "false"
                  ? Icon(
                CupertinoIcons.chevron_down,
                color: HexColor("#909090").withOpacity(0.5),
              )
                  : Icon(
                CupertinoIcons.chevron_up,
                color: HexColor("#909090").withOpacity(0.7),
              ),
              hint: widget.hintCheck == true ? Text(widget.hint) : _dropdownTestItems[0],
              value: _selectedTest,
              items: _dropdownTestItems,
              onChanged: onChangeDropdownTests,
            ),
          ],
        ));
  }
}
