import 'package:amuz_nidlecrew/models/fixReady.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/useinfo/userInfoListItem.dart';
import 'package:flutter/material.dart';

class UserInfoList extends StatelessWidget {
  final String fixState;

  const UserInfoList({Key? key, required this.fixState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
        children: List.generate(
          useLists.length,
          (index) => useLists[index].fixState == fixState
              ? UserInfoListItem(
                  fixReady: useLists[index],
                  fixState: fixState,
                )
              : index == 0
                  ? EmptyFix()
                  : Container(),
        ),
    );
  }


  // fix List 목록이 없을 경우
  Widget EmptyFix() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 50),
      child: FontStyle(text: fixState == "ready"
          ? "대기 중인 의뢰가 없습니다."
          : fixState == "progress"
              ? "진행 중인 의뢰가 없습니다."
              : "수선 목록이 없습니다.", fontcolor: Colors.black, fontsize: "md", fontbold: "",textdirectionright: false),
    );
  }
}
