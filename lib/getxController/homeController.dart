import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_woocommerce_api/flutter_woocommerce_api.dart';
import 'package:flutter_woocommerce_api/models/order.dart';
import 'package:get/get.dart';
import 'package:amuz_nidlecrew/db/wp-api.dart' as wp_api;
import 'package:intl/intl.dart';

class HomeController extends GetxController{
  static HomeController get to => Get.find();

  final isInitialized = false.obs;

  // user update 내용
  final textController = TextEditingController();


  RxBool mainModalcheck = false.obs;

  // user 정보
  late WooCustomer user;

  // user update 항목
  RxString updateName = "".obs;

  RxList userJoin = [].obs;

  // user login - email
  RxString userEmail = "".obs;
  //
  // // user join - 이메일 주소
  // RxString userEmail = "".obs;
  //
  // user login - 비밀번호
  RxString userPassword = "".obs;

  RxString loginCheck = "".obs;

  RxString token = "".obs;



  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  @override
  void onClose() {
    isInitialized.value = false;
    mainModalcheck.value = false;

    super.onClose();
  }


  // 닫기 버튼 눌렸을 때
  void isMainmodal(bool isClose){
    mainModalcheck.value = isClose;

    update();
  }


  // 회원정보 업데이트
  void updateUserInfo(String fieldName){
    updateName.value = fieldName;

    update();
  }


  // 회원 가입 정보 저장
  void joinUser(String user){
    userJoin.add(user);
    print("joinUserInfo ddddd" + userJoin.toString());
    update();
  }


  // login
  void loginUser(String email, String password){
    userEmail.value = email;
    userPassword.value = password;

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
      token = await wp_api.wooCommerceApi.authenticateViaJWT(username: user.email, password: user.password);
      print("user info " + user.toString());
    } catch (e) {
      print("isError " + e.toString());
      return false;
    }
    return true;
  }


  // 유저 정보 업데이트
  Future<bool> updateUser() async {
    print("textcontorller text " +  textController.text + "update success!");
    try{
      await wp_api.wooCommerceApi.updateCustomer(id: user.id!,data: {updateName.value : textController.text});

      print("user " + updateName.value + "update success!");
    }catch(e){
      print("isError " + e.toString());
      return false;
    }
    return true;
  }



  // user login
  Future<bool> LoginUs(String email, String password) async {

      final customer =
      await wp_api.wooCommerceApi.loginCustomer(username: email, password: password);

    try {
      print("this login  " + customer.toString());
      token = await wp_api.wooCommerceApi.authenticateViaJWT(
          username: email, password: password);

      // if (customer.toString().indexOf('invalid_email') != -1 ||
      //     customer.toString().indexOf('invalid_username') != -1) {
      //   loginCheck.value = '이메일 주소를 확인해주세요.';
      //   print("로그인 실패! - 이메일 오류");
      //   update();
      //   return false;
      // } else if (customer.toString().indexOf('incorrect_password') != -1) {
      //   loginCheck.value = '비밀번호가 일치하지 않습니다.';
      //   print("로그인 실패! - 비밀번호 오류 ${loginCheck.value}");
      //   return false;
      // } else {
        loginCheck.value = "";
        print("로그인 성공!!!!");
        Get.toNamed("/mainHome");
      // }
    }catch(e){

      if (customer.toString().indexOf('invalid_email') != -1 ||
          customer.toString().indexOf('invalid_username') != -1) {
        loginCheck.value = '이메일 주소를 확인해주세요.';
        print("로그인 실패! - 이메일 오류");
        update();
        return false;
      } else if (customer.toString().indexOf('incorrect_password') != -1) {
        loginCheck.value = '비밀번호가 일치하지 않습니다.';
        print("로그인 실패! - 비밀번호 오류 ${loginCheck.value}");
        return false;
      }
    }

    return true;
  }
}
