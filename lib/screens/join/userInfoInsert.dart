import 'package:amuz_nidlecrew/screens/mainPage.dart';
import 'package:amuz_nidlecrew/widgets/baseAppbar.dart';
import 'package:amuz_nidlecrew/widgets/floatingNextBtn.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/loginTextField.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class UserInfoInsert extends StatefulWidget {



  const UserInfoInsert({Key? key}) : super(key: key);

  @override
  State<UserInfoInsert> createState() => _UserInfoInsertState();


}

class _UserInfoInsertState extends State<UserInfoInsert> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: BaseAppBar(
          appbar: AppBar(),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FontStyle(
                          text: "고객님의 정보를",
                          fontsize: "lg",
                          fontbold: "bold",
                          fontcolor: Colors.black),
                      FontStyle(
                          text: "입력해주세요",
                          fontsize: "lg",
                          fontbold: "bold",
                          fontcolor: Colors.black),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                Container(
                  padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                            width: 350,
                              child: TextField(
                                onTap: (){
                                },
                                decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: HexColor("#d5d5d5"),
                                    ),
                                  ),
                                  hintText: "이름 입력",
                                  hintStyle: TextStyle(
                                    color: HexColor("#d5d5d5"),
                                  ),
                                ),
                              ),
                        ),
                        SizedBox(height: 17,),
                        LoginTextField(hintText: "휴대폰 번호 입력", btnText: "인증요청"),
                        SizedBox(height: 17,),
                        LoginTextField(hintText: "인증번호 입력", btnText: "재 요청"),
                      ],
                    ),
                ),
                SizedBox(height: 180,),
                FloatingNextBtn(page: MainPage()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
