import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginTextField extends StatefulWidget {
  final String btnText;
  final String hintText;

  const LoginTextField(
      {Key? key, required this.hintText, required this.btnText})
      : super(key: key);

  @override
  State<LoginTextField> createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  bool btnclick = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
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
          Container(
            width: 87,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                width: 1,
                color: HexColor("#d5d5d5"),
              ),
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  btnclick = true;
                });
              },
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
