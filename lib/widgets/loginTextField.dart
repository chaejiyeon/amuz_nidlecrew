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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        margin: EdgeInsets.only(left: 24, right: 24),
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
                onPressed: () {},
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
      ),
    );
  }
}
