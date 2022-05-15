import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UseGuideDropDown extends StatefulWidget {
  final bool hintCheck;
  final String hint;

  const UseGuideDropDown({Key? key,required this.hintCheck, required this.hint}) : super(key: key);

  @override
  State<UseGuideDropDown> createState() => _UseGuideDropDownState();
}

class _UseGuideDropDownState extends State<UseGuideDropDown> {
  List select1 = [
    {'no': 1, 'keyword': '쇼핑몰에서 보낼 경우'},
    {'no': 2, 'keyword': '집에서 보낼 경우'},
  ];

  List<DropdownMenuItem<Object?>> _dropdownTestItems = [];
  var _selectedTest;
  bool selected = false;

  @override
  void initState() {
    _dropdownTestItems = buildDropdownTestItems(select1);
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
    int i = 0;
    print(selected);
    print(selectedTest);
    setState(() {
      i++;
      _selectedTest = selectedTest;
      if(i/2 == 0) selected = true;
      else selected = false;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 50),
        child: Column(
          children: [
            DropdownBelow(
              itemWidth: 180,
              itemTextstyle: TextStyle(
                  fontSize: 16,
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
              icon: selected == false
                  ? Icon(
                      CupertinoIcons.chevron_down,
                      color: HexColor("#909090").withOpacity(0.5),
                    )
                  : Icon(
                      CupertinoIcons.chevron_up,
                      color: HexColor("#909090").withOpacity(0.7),
                    ),
              hint: widget.hintCheck == true ? Text(widget.hint, style: TextStyle(fontSize: 16),) : _dropdownTestItems[0],
              value: _selectedTest,
              items: _dropdownTestItems,
              onChanged: onChangeDropdownTests,
            ),
          ],
        ),);
  }
}
