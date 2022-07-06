import 'dart:developer';
import 'dart:ffi';
// import 'dart:math';

import 'package:needlecrew/models/fixReady.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_woocommerce_api/flutter_woocommerce_api.dart';
import 'package:flutter_woocommerce_api/models/order.dart';
import 'package:get/get.dart';
import 'package:needlecrew/db/wp-api.dart' as wp_api;
import 'package:http/http.dart';

// import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class UseInfoController extends GetxController {
  static UseInfoController get to => Get.find();

  final isInitialized = false.obs;

  late WooCustomer user;

  late List<WooOrder> orders;

  late WooOrder order;
  late WooOrder orderUpdate;


  // 이용내역 list ( 수선대기, 수선 진행중, 수선완료 )
  List<FixReady> readyLists = [];
  List<FixReady> progressLists = [];
  List<FixReady> completeLists = [];
  List<FixReady> useLists = [];

  @override
  void onInit() {
    initialize();
    super.onInit();
    initializeDateFormatting();
  }

  @override
  void onClose() {
    isInitialized.value = false;
    useLists.clear();
    super.onClose();
  }

  // // 상태별 건수
  // void stateCount() {
  //   // readyCount.value = 0;
  //   // progressCount.value = 0;
  //   // completeCount.value = 0;
  //   for (int i = 0; i < useLists.length; i++) {
  //     if (useLists[i].fixState == "ready") {
  //       readyCount++;
  //     } else if (useLists[i].fixState == "progress") {
  //       progressCount++;
  //     } else {
  //       completeCount++;
  //     }
  //   }
  //   update();
  // }

  // 초기화
  Future<void> initialize() async {
    await getCompleteOrder();

    isInitialized.value = true;
    return;
  }

  // 해당 유저에 정보
  Future<void> getCompleteOrder() async {
    readyLists.clear();
    progressLists.clear();
    completeLists.clear();
    useLists.clear();

    try {
      user = await wp_api.getUser();

      orders = await wp_api.wooCommerceApi.getOrders(
        customer: user.id,
        status: ['fix-register', 'fix-ready', 'fix-picked', 'fix-arrive', 'fix-confirm', 'fix-select', 'processing', 'completed'],
      );

      log("order status  ddfsd "+ orders.toString());
      // 수선 대기 단계별 state 설정
      for (int i = 0; i < orders.length; i++) {
        print("this status  " + orders[i].status.toString());
        DateTime dateTime = DateTime.parse(orders[i].dateCreated.toString());
        String registerDate = DateFormat('yyyy. MM. dd').format(dateTime);
        String day = DateFormat.E('ko_KR').format(dateTime);

        String orderDate = registerDate + " " + day;

        switch (orders[i].status) {
          case 'processing':
            progressLists.add(FixReady(orders[i].id!, "progress", orderDate,
                orders[i].lineItems!.first.name.toString(), 0));
            break;
          case 'completed':
            completeLists.add(FixReady(orders[i].id!, "complete", orderDate,
                orders[i].lineItems!.first.name.toString(), 0));
            break;
          case 'fix-register':
            readyLists.add(FixReady(orders[i].id!, "ready", orderDate,
                orders[i].lineItems!.first.name.toString(), 1));
            break;
          case 'fix-ready':
            readyLists.add(FixReady(orders[i].id!, "ready", orderDate,
                orders[i].lineItems!.first.name.toString(), 2));
            break;
          case 'fix-picked':
            readyLists.add(FixReady(orders[i].id!, "ready", orderDate,
                orders[i].lineItems!.first.name.toString(), 3));
            break;
          case 'fix-arrive':
            readyLists.add(FixReady(orders[i].id!, "ready", orderDate,
                orders[i].lineItems!.first.name.toString(), 4));
            break;
          case 'fix-confirm':
            readyLists.add(FixReady(orders[i].id!, "ready", orderDate,
                orders[i].lineItems!.first.name.toString(), 5));
            break;
          case 'fix-select':
            readyLists.add(FixReady(orders[i].id!, "ready", orderDate,
                orders[i].lineItems!.first.name.toString(), 6));
            break;
          default:
            useLists.add(FixReady(orders[i].id!, "pending", orderDate,
                orders[i].lineItems!.first.name.toString(), 0));

        }

        print("list count " + readyLists.length.toString() + progressLists.length.toString() + completeLists.length.toString());


        //
        // if (orders[i].status == 'processing') {
        // } else if (orders[i].status == 'completed') {
        // } else if (orders[i].status!.indexOf('fix') != -1) {
        //   print("this status dfsdfdddddd" + orders[i].status.toString());
        //   if (orders[i].status == 'fix-register') {
        //   } else if (orders[i].status == 'fix-ready') {
        //     useLists.add(FixReady(orders[i].id!, "ready", orderDate,
        //         orders[i].lineItems!.first.name.toString(), 2));
        //   } else if (orders[i].status == 'fix-pickclothes') {
        //     useLists.add(FixReady(orders[i].id!, "ready", orderDate,
        //         orders[i].lineItems!.first.name.toString(), 3));
        //   } else if (orders[i].status == 'fix-arrive') {
        //     useLists.add(FixReady(orders[i].id!, "ready", orderDate,
        //         orders[i].lineItems!.first.name.toString(), 4));
        //   } else if (orders[i].status == 'fix-confirm') {
        //     useLists.add(FixReady(orders[i].id!, "ready", orderDate,
        //         orders[i].lineItems!.first.name.toString(), 5));
        //   } else if (orders[i].status == 'fix-select') {
        //     useLists.add(FixReady(orders[i].id!, "ready", orderDate,
        //         orders[i].lineItems!.first.name.toString(), 6));
        //   }
        //
        // }
      }

      // for (int i = 0; i < useLists.length; i++) {
      //   if (useLists[i].fixState == "ready") {
      //     readyCount++;
      //   } else if (useLists[i].fixState == "progress") {
      //     progressCount++;
      //   } else if (useLists[i].fixState == "complete") {
      //     completeCount++;
      //   }
      // }

      // print("readycount " + readyCount.value.toString() + "progresscount " + progressCount.value.toString() + "completecount " + completeCount.value.toString());
    } catch (e) {
      print("isError " + e.toString());
      // return false;
    }
    // return true;
  }
}
