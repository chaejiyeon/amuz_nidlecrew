import 'package:amuz_nidlecrew/screens/main/mainHome.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/myPage/mypageAppbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

class AddressInsertForm extends StatefulWidget {
  final bool addressSearch;
  final String appbarName;
  final String hinttext1;
  final String hinttext2;

  const AddressInsertForm(
      {Key? key,
      required this.addressSearch,
      required this.appbarName,
      required this.hinttext1,
      required this.hinttext2})
      : super(key: key);

  @override
  State<AddressInsertForm> createState() => _AddressInsertFormState();
}

class _AddressInsertFormState extends State<AddressInsertForm> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MypageAppBar(title: widget.appbarName, icon: "", widget: MainHome(), appbar: AppBar()),
          SizedBox(
            height: 30,
          ),
          CircleAddressSearch(widget.hinttext1),
          CircleAddressSearch(widget.hinttext2),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Typecheck("mypageHome.svg", "우리집"),
                Typecheck("mypageCompany.svg", "회사"),
                Typecheck("mypageLocation.svg", "기타"),
              ],
            ),
          )
        ],
      ),
    );
  }

  // 주소 입력폼
  Widget CircleAddressSearch(String title) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: TextField(
        controller: _textController,
        textAlign:
            widget.addressSearch == true ? TextAlign.center : TextAlign.start,
        decoration: InputDecoration(
          suffixIcon: widget.addressSearch == false
              ? IconButton(
                  icon: Icon(CupertinoIcons.xmark_circle_fill),
                  onPressed: () {
                    _textController.clear();
                  },
                )
              : null,
          hintText: title,
          hintStyle: TextStyle(
            color: widget.addressSearch == true
                ? HexColor("#909090").withOpacity(0.7)
                : Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: HexColor("#d5d5d5"),
            ),
          ),
        ),
      ),
    );
  }

  // 주소 Type 버튼
  Widget Typecheck(String icon, String text) {
    return InkWell(
      child: Column(
        children: [
          SvgPicture.asset("assets/icons/myPage/" + icon),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: HexColor("#d5d5d5")),
              borderRadius: BorderRadius.circular(30),
            ),
            child: FontStyle(
                text: text,
                fontbold: "",
                fontsize: "md",
                fontcolor: Colors.black,textdirectionright: false),
          ),
        ],
      ),
    );
  }
}
