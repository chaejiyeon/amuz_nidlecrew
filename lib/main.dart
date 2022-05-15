import 'dart:async';

import 'package:amuz_nidlecrew/db/wp-api.dart';
import 'package:amuz_nidlecrew/screens/login/startPage.dart';
import 'package:amuz_nidlecrew/screens/login/login.dart';
import 'package:amuz_nidlecrew/screens/main/fixClothes.dart';
import 'package:amuz_nidlecrew/screens/main/myPage.dart';
import 'package:amuz_nidlecrew/screens/main/myPage/payTypeAddConfirm.dart';
import 'package:amuz_nidlecrew/screens/mainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/join/agreeTerms.dart';
import 'screens/main/myPage/payType.dart';


void main() {
  SharedPreferences.setMockInitialValues({});
  KakaoSdk.init(nativeAppKey: '4d9c4d62aa20a9e3dd6baffac8b0aa19', loggingEnabled: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent
    ));

    return GetMaterialApp(
      title: 'Nidlecrew',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'NotoSansCJKkrRegular',
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
        ),
      ),
      home: const MyHomePage(),
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/join', page: () => AgreeTerms()),
        GetPage(name: '/startPage', page: () => loadingPage()),
        GetPage(name: '/mainHome', page: () => MainPage(pageNum: 0)),
        GetPage(name: '/useInfo', page: () => MainPage(pageNum: 1)),
        GetPage(name: '/myPage', page: () => MainPage(pageNum: 2)),
        GetPage(name: '/fixClothes', page: () => FixClothes()),
        GetPage(name: '/payTypeAddConfirm', page: () => PayTypeAddConfirm()),
        GetPage(name: '/payType', page: () => PayType()),
      ],

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 2000), () {
      if(isLogged() == false) {
        Get.to(loadingPage());
      }else{
        Get.toNamed('/mainHome');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 338,
                ),
                Container(
                  width: 170,
                  child: Text(
                    "니들크루",
                    style: TextStyle(
                        fontFamily: 'NotoSansCJKkrRegular', fontSize: 41, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

