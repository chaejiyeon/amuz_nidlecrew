import 'package:amuz_nidlecrew/screens/mainPage.dart';
import 'package:amuz_nidlecrew/widgets/baseAppbar.dart';
import 'package:amuz_nidlecrew/widgets/floatingNextBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class UserInfoInsert extends StatefulWidget {
  const UserInfoInsert({Key? key}) : super(key: key);

  @override
  State<UserInfoInsert> createState() => _UserInfoInsertState();
}

class _UserInfoInsertState extends State<UserInfoInsert> {
  ScrollController _scrollController = ScrollController();
  TextEditingController _editingController1 = TextEditingController();
  TextEditingController _editingController2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _editingController1.dispose();
    _editingController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: BaseAppBar(
          appbar: AppBar(),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Container(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FontStyle(
                          text: "고객님의 정보를",
                          fontsize: "lg",
                          fontbold: "bold",
                          fontcolor: Colors.black,
                          textdirectionright: false),
                      FontStyle(
                          text: "입력해주세요",
                          fontsize: "lg",
                          fontbold: "bold",
                          fontcolor: Colors.black,
                          textdirectionright: false),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Column(
                    children: [
                      loginTextField("이름 입력", _editingController1),
                      SizedBox(
                        height: 23,
                      ),
                      loginTextField("이메일 주소 입력", _editingController2),
                      // LoginTextField(hintText: "휴대폰 번호 입력", btnText: "인증요청"),
                      // SizedBox(height: 17,),
                      // LoginTextField(hintText: "인증번호 입력", btnText: "재 요청"),
                    ],
                  ),
                ),
                // SizedBox(height: 170,),
              ],
            ),
          ),
        ),
        floatingActionButton: _editingController1.text.length > 0 &&
                _editingController2.text.length > 0
            ? FloatingNextBtn(page: MainPage(pageNum: 0), ischecked: true)
            : FloatingNextBtn(page: MainPage(pageNum: 0), ischecked: false),
      ),
    );
  }

  // 회원가입 필드 위젯
  Widget loginTextField(String hintText, TextEditingController controller) {
    return Container(
      width: double.infinity,
      child: TextField(
        controller: controller,
        onTap: () {
          _scrollController.animateTo(120.0, duration: Duration(milliseconds: 500), curve: Curves.ease);
        },
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: HexColor("#d5d5d5"),
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: HexColor("#d5d5d5"),
          ),
        ),
      ),
    );
  }
}
