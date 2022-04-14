import 'dart:async';

import 'package:amuz_nidlecrew/screens/login/startPage.dart';
import 'package:amuz_nidlecrew/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'screens/join/agreeTerms.dart';

void main() {
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
      Get.to(loadingPage());
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

