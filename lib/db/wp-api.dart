library wp_api;

import 'dart:async';
import 'dart:ffi';

import 'package:amuz_nidlecrew/main.dart';
import 'package:amuz_nidlecrew/screens/login/startPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_woocommerce_api/flutter_woocommerce_api.dart';
import 'package:get/get.dart';

late FlutterWooCommerceApi wooCommerceApi;

// 회원가입
Future<void> joinUs(String name, String email, String password) async {

  final int index = email.indexOf('@');
  final String userName = email.substring(0, index);

  final token = await wooCommerceApi.authenticateViaJWT(username: email, password: password);
  final customer = await wooCommerceApi.loginCustomer(username: email, password: password);

  print("token " +token.toString());
  print("customer " +customer.toString());


  // 회원가입 후 로그인 (email이 없을 경우 - 비회원) / 바로 로그인 (email이 있을 경우 - 회원)
  try{
    WooCustomer user = WooCustomer(
        username: userName,
        password: password,
        email: email,
        lastName: name.substring(0, 1),
        firstName: name.substring(1, name.length),);
    final result = wooCommerceApi.createCustomer(user);

    await result;




    if (user.username != null) {
      print(user.username.toString() + "회원가입 성공");
      Get.toNamed('/mainHome');

    } else {
      print("error");
    }
  }
  catch(error){
    if(error.toString().indexOf('registration-error-email-exists') != -1){
      Get.toNamed('/mainHome');
      print("로그인");
    }else{
      print("isError $error");
    }
  }
}


// 로그인 여부
Future<bool> isLogged() async {
  bool isLoggedIn = await wooCommerceApi.isCustomerLoggedIn();
  print("isLoggedIn " + isLoggedIn.toString());

  return isLoggedIn;
}



// 로그아웃
Future<void> logOut() async {

  FlutterNaverLogin.logOut();
  await wooCommerceApi.logUserOut();

  print("로그아웃");

  Get.offAndToNamed('/startPage');
}





