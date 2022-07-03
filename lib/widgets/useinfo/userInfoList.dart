import 'package:amuz_nidlecrew/getxController/useInfo/useInfoController.dart';
import 'package:amuz_nidlecrew/models/fixReady.dart';
import 'package:amuz_nidlecrew/widgets/fontStyle.dart';
import 'package:amuz_nidlecrew/widgets/useinfo/userInfoListItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final List<String> fixState = ['ready', 'progress', 'complete'];

class UseInfoList extends StatefulWidget {
  final String fixState;

  const UseInfoList({Key? key, required this.fixState}) : super(key: key);

  @override
  State<UseInfoList> createState() => _UseInfoListState();
}

class _UseInfoListState extends State<UseInfoList> {
  final UseInfoController controller = Get.put(UseInfoController());
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("useinfolist count  " + count.toString());

    return GestureDetector(
      child:
          // ListView(
          //   padding: EdgeInsets.zero,
          //     children: List.generate(
          //       controller.orders.length,
          //       (index) => controller.orders[index] == fixState
          //           ? UserInfoListItem(
          //               fixReady: useLists[index],
          //               fixState: fixState,
          //             )
          //           : index == 0
          //               ? EmptyFix()
          //               : Container(),
          //     ),
          // ),

          // ListView(padding: EdgeInsets.zero,children: [Text("ddfwef"),Text("ddfwef")],)

          Obx(() {
        if (controller.isInitialized.value) {

          return ListView(
            padding: EdgeInsets.zero,
            children: List.generate(
                fixState == "ready"
                    ? controller.readyCount.value
                    : fixState == "progress"
                        ? controller.progressCount.value
                        : fixState == "complete"
                            ? controller.completeCount.value
                            : 0,
                (index) => (controller.readyCount.value != 0 ||
                            controller.progressCount != 0 ||
                            controller.completeCount.value != 0) &&
                        controller.useLists[index].fixState == widget.fixState
                    ? UserInfoListItem(
                        fixReady: controller.useLists[index],
                        fixState: widget.fixState,
                      )
                    : EmptyFix()),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }

  // fix List 목록이 없을 경우
  Widget EmptyFix() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 50),
      child: FontStyle(
          text: widget.fixState == "ready"
              ? "대기 중인 의뢰가 없습니다."
              : widget.fixState == "progress"
                  ? "진행 중인 의뢰가 없습니다."
                  : "수선 목록이 없습니다.",
          fontcolor: Colors.black,
          fontsize: "md",
          fontbold: "",
          textdirectionright: false),
    );
  }
}
