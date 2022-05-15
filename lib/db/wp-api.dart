import 'dart:ffi';

import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_woocommerce_api/flutter_woocommerce_api.dart';
import 'package:get/get.dart';



FlutterWooCommerceApi wooCommerceApi = FlutterWooCommerceApi(
  baseUrl: 'https://needlecrew.com',
  consumerKey: 'ck_75c6d6983771d3923a5dc58c1151039ab96167c1',
  consumerSecret: 'cs_36e34b80b2ccc76c587069cb7b121f6df6758deb',
);


// 회원가입
Future<void> joinUs(String name, String email, String password) async {

  final int index = email.indexOf('@');
  final String userName = email.substring(0, index-1);



  // 회원가입 후 로그인 (email이 없을 경우 - 비회원) / 바로 로그인 (email이 있을 경우 - 회원)
  try{
    WooCustomer user = WooCustomer(
        username: userName,
        password: password,
        email: email,
        lastName: name.substring(1, name.length),
        firstName: name.substring(0, 0));
    final result = wooCommerceApi.createCustomer(user);

    await result;

    if (user.username != null) {
      print(user.username.toString() + "회원가입 성공");
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


// 로그인
Future<void> Login(String name, String email, String password) async{
  final int index = email.indexOf('@');
  final String userName = email.substring(0, index-1);

  final token = wooCommerceApi.authenticateViaJWT(username: userName, password: password);
  final customer = wooCommerceApi.loginCustomer(username: userName, password: password);

}



// 로그인 여부
Future<bool> isLogged() async {
  bool isLoggedIn = await wooCommerceApi.isCustomerLoggedIn();

  return isLoggedIn;
}


// 로그아웃
Future<void> logOut() async {
  FlutterNaverLogin.logOut();

  await wooCommerceApi.logUserOut();
  Get.offAndToNamed('/startPage');
}


