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
  late String selectAddress = "";

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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MypageAppBar(title: widget.appbarName, icon: "", widget: MainHome(), appbar: AppBar()),
      body: Container(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CircleAddressSearch(widget.hinttext1),
            CircleAddressSearch(widget.hinttext2),
            Container(
              padding: EdgeInsets.only(top: 31),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Typecheck("mypageHome.svg", "우리집"),
                  Typecheck("mypageCompany.svg", "회사"),
                  Typecheck("mypageLocation.svg", "기타"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // 주소 입력폼
  Widget CircleAddressSearch(String title) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
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
    return GestureDetector(
      onTap: (){
        setState((){
          selectAddress = text;
        });
      },
      child: Column(
        children: [
          SvgPicture.asset("assets/icons/myPage/" + icon, color: selectAddress == text ? HexColor("#fd9a03") : Colors.black,),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 3.7,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: selectAddress == text ? HexColor("#fd9a03") : HexColor("#d5d5d5")),
              borderRadius: BorderRadius.circular(30),
            ),
            child: FontStyle(
                text: text,
                fontbold: "",
                fontsize: "md",
                fontcolor: selectAddress == text ? HexColor("#fd9a03") : Colors.black,textdirectionright: false),
          ),
        ],
      ),
    );
  }
}
