import 'dart:ffi';
import 'dart:math';

import 'package:flutter_woocommerce_api/flutter_woocommerce_api.dart';
import 'package:flutter_woocommerce_api/models/order.dart';
import 'package:get/get.dart';
import 'package:amuz_nidlecrew/db/wp-api.dart' as wp_api;
import 'package:intl/intl.dart';

class MypageController extends GetxController{
  static MypageController get to => Get.find();

  final isInitialized = false.obs;


  RxBool mainModalcheck = false.obs;

  late WooCustomer user;





  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  @override
  void onClose() {
    isInitialized.value = false;
    super.onClose();
  }


  // 닫기 버튼 눌렸을 때
  void isMainmodal(bool isClose){
    mainModalcheck.value = isClose;

    update();
  }

  // 초기화
  Future<void> initialize() async {
    await getUser();

    isInitialized.value = true;
    return;
  }

  // 해당 유저에 정보
  Future<bool> getUser() async {
    try {
      user = await wp_api.getUser();

    } catch (e) {
      print("isError " + e.toString());
      return false;
    }
    return true;
  }


}
