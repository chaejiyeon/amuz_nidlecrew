import 'package:amuz_nidlecrew/widgets/circleBlackBtn.dart';
import 'package:amuz_nidlecrew/widgets/myPage/updateForm.dart';
import 'package:flutter/material.dart';

class PhoneNumUpdate extends StatelessWidget {
  const PhoneNumUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: UpdateForm(
          appbarName: "전화번호 변경",
          updateType: "전화번호",
          hintText: "010-9282-2434",
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.all(20),
          child: CircleBlackBtn(btnText: "변경 완료", pageName: "back"),
        ),
      ),
    );
  }
}
