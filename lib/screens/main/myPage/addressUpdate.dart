import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/myPage/addressInsertForm.dart';
import 'package:flutter/material.dart';

class AddressUpdate extends StatelessWidget {
  const AddressUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: AddressInsertForm(appbarName: "주소 수정", addressSearch: false, hinttext1: "부산 사상구 모라동 22", hinttext2: "1306호"),

        bottomNavigationBar:  Container(
            padding: EdgeInsets.all(20),
            child: CircleBlackBtn(btnText: "완료", pageName: "back")),
      ),
    );
  }
}
