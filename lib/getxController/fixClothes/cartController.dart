import 'dart:ffi';
import 'dart:math';

import 'package:flutter_woocommerce_api/flutter_woocommerce_api.dart';
import 'package:flutter_woocommerce_api/models/order.dart';
import 'package:get/get.dart';
import 'package:amuz_nidlecrew/db/wp-api.dart' as wp_api;
import 'package:iamport_flutter/Iamport_certification.dart';
import 'package:iamport_flutter/model/iamport_validation.dart';
import 'package:intl/intl.dart';

class CartController extends GetxController {
  static CartController get to => Get.find();

  final isInitialized = false.obs;

  late WooCustomer user;

  List<WooOrder> orders = [];
  List<WooOrder> registerOrders = [];
  late WooOrder order;
  late WooProduct product;

  late Rx<WooProductCategory> category;

  RxInt categoryid = 0.obs;
  RxInt productid = 0.obs;

  // 장바구니에서 선택한 orderid list
  RxList orderid = [].obs;

  // 장바구니에서 등록한 orderid list
  RxList registerid = [].obs;

  // 옷바구니 건수
  RxInt cartCount = 0.obs;

  // 주문 건수
  RxInt orderCount = 0.obs;

  // 주소
  RxString setAddress = "".obs;

  // 총 비용
  RxInt wholePrice = 0.obs;

  // 주소 입력, 수거 희망일, 수거 가이드일 경우 false (저장 안됨) > 접수 완료시 true (저장)
  RxBool setSave = false.obs;


  // 수거 희망일
  RxString fixdate = "".obs;

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

  // 초기화
  Future<void> initialize() async {
    await getProductCategory(categoryid);
    await getOrder();
    await getCart();

    isInitialized.value = true;
    return;
  }

  // productId 값 설정
  void isProductId(int productId) {
    productid.value = productId;
    update();
  }

  // 주소 값 설정
  void isAddress(String address) {
    setAddress.value = address;
    print("this address " + setAddress.value.toString());
    update();
  }

  // 저장 여부 설정
  void isSaved(bool saved) {
    setSave.value = saved;
    print("Is Saved " + setSave.value.toString());
    update();
  }

  // 주소 등록 후 주문 완료 할 orderId 값 설정 (선택한 주문서 list)
  void isOrderId(bool ischecked, int orderId) {
    if (ischecked == true) {
      registerid.value.add(orderId);
      orderid.value.add(orderId);
      print("주문 등록할 orderid " + orderid.value.toString());
      orderCount.value++;
    } else {
      for (int i = 0; i < orderid.length; i++) {
        if (orderid[i] == orderId) {
          registerid.value.removeAt(i);
          orderid.value.removeAt(i);
        }
      }
      print("주문 등록할 orderid " + orderid.value.toString());
      orderCount.value--;
    }

    update();
  }

  // 총 비용 설정
  void iswholePrice(bool ischecked, int price) {
    if (ischecked == true) {
      wholePrice.value += price + 6000;
    } else {
      wholePrice.value -= price + 6000;
    }

    print("wholePrice " + wholePrice.value.toString());
    update();
  }


  // void isCartCount() {
  //   // for (int i = 0; i < orders.length; i++) {
  //   //   if (orders[i].status == 'pending') {
  //   //     cartCount++;
  //   //   }
  //   // }
  //   cartCount.value = orders.length;
  //   update();
  // }

  // 수거 희망일
  void fixDate(String selectMonth, String selectDay){
    fixdate.value = selectMonth + "월" + selectDay + "일";
    update();
  }

  // 단위 변환
  String setPrice() {
    String setPrice = NumberFormat('###,###,###').format(wholePrice.value);
    update();
    return setPrice;
  }

  // fixselect 상위 카테고리
  Future<bool> getProductCategory(categoryid) async {
    cartCount.value = 0;
    try {
      category.value = await wp_api.wooCommerceApi
          .getProductCategoryById(categoryId: categoryid);
    } catch (e) {
      return false;
    }
    return true;
  }

  // 해당 유저에 대한 주문 정보 (옷바구니)
  Future<bool> getCart() async {
    orderid.clear();
    try {
      user = await wp_api.getUser();

      orders = await wp_api.wooCommerceApi.getOrders(
        customer: user.id,
        status: ['pending']
      );

      print("orders this    ddddd" + orders.toString());

      // // 접수 완료 시 완료 된 주문건 제외 후 옷바구니에 표시
      // if(setSave == true) {
      //   orders = await wp_api.wooCommerceApi.getOrders(customer: user.id,);
      //   for(int i=0; i< registerid.length; i++){
      //     for (int j = 0; j < orders.length; j++) {
      //       if (registerid[i] == orders[j].id) {
      //         orders.removeAt(j);
      //       }
      //     }
      //   }
      // }else {
      //   orders = await wp_api.wooCommerceApi.getOrders(customer: user.id,);
      // }



      for (int i = 0; i < orders.length; i++) {
        if (orders[i].status == 'pending') {
          cartCount++;
        }
      }
    } catch (e) {
      print("isError " + e.toString());
      return false;
    }
    return true;
  }

  // 해당 유저에 대한 주문 정보 (옷바구니)
  Future<bool> deleteCart() async {
    try {
      for (int i = 0; i < orderid.length; i++) {
        await wp_api.wooCommerceApi.deleteOrder(orderId: orderid[i]);
      }

      print("this order deleted " + orders.toString());

      // // 접수 완료 시 완료 된 주문건 제외 후 옷바구니에 표시
      // if(setSave == true) {
      //   orders = await wp_api.wooCommerceApi.getOrders(customer: user.id,);
      //   for(int i=0; i< registerid.length; i++){
      //     for (int j = 0; j < orders.length; j++) {
      //       if (registerid[i] == orders[j].id) {
      //         orders.removeAt(j);
      //       }
      //     }
      //   }
      // }else {
      //   orders = await wp_api.wooCommerceApi.getOrders(customer: user.id,);
      // }
    } catch (e) {
      print("isError " + e.toString());
      return false;
    }
    return true;
  }

  // 접수 확인 list
  Future<void> getOrder() async {
    registerOrders.clear();
    try {
      for (int i = 0; i < orderid.length; i++) {
        registerOrders
            .add(await wp_api.wooCommerceApi.getOrderById(orderid[i]));
        // print("getorder " + registerOrders.toString());
      }
    } catch (e) {
      print("isError " + e.toString());
    }
  }

  // 선택한 주문에 대한 주소 입력
  Future<bool> registerAddress() async {
    Map order_map = {
      'first_name': user.firstName,
      'last_name': user.lastName,
      'addresss_1': setAddress.value,
    };
    List metadata = [
      {'key': '수거 희망일', 'value': fixdate.value}
    ];

    try {
      for (int i = 0; i < orderid.length; i++) {
        order =
            await wp_api.wooCommerceApi.updateOrder(id: orderid[i], orderMap: {
          'billing': order_map,
          'shipping': order_map,
          'customer_note': '주문 완료',
          'meta_data': metadata
        });
        print(orderid[i].toString() + "주소 등록이 완료되었습니다.");
      }

      orderCount.value = 0;
      wholePrice.value = 0;
    } catch (e) {
      print("isError " + e.toString());
      return false;
    }
    return true;
  }




}
