import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginTextField extends StatefulWidget {
  final String btnText;
  final String hintText;
  final ScrollController scrollController;

  const LoginTextField(
      {Key? key, required this.hintText, required this.btnText, required this.scrollController})
      : super(key: key);

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool btnclick = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phonenumController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              onTap: (){
                // widget.scrollController.animateTo(widget.scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 500), curve: Curves.ease);
              },
              controller: widget.hintText == "이름 입력" ? _nameController : _phonenumController,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: HexColor("#d5d5d5"),
                    ),
                  ),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    color: HexColor("#d5d5d5"),
                  ),
                  suffixIcon: Timerinfo(),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: (){

            },
            child: Container(
              alignment: Alignment.center,
              height: 36,
              width: 87,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 1,
                  color: HexColor("#d5d5d5"),
                ),
              ),
              child: Text(
                  widget.btnText,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Timerinfo(){
    if(btnclick == true){
      if(widget.btnText == "재 요청"){
       return Container(
          width: 26,
          padding: EdgeInsets.all(10),
          alignment: Alignment.bottomRight,
          child: Text(
            "2:59",
            style: TextStyle(
              color: HexColor("#fd9a03"),
            ),
          ),
        );
      }
    }
    return SizedBox();
  }

}
