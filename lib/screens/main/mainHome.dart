import 'package:amuz_nidlecrew/widgets/mainhome/bannerslide.dart';
import 'package:amuz_nidlecrew/widgets/mainhome/footer.dart';
import 'package:amuz_nidlecrew/widgets/mainhome/guide.dart';
import 'package:amuz_nidlecrew/widgets/mainhome/myuseInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light
        )
    );

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          BannerSlides(),
          MyUseInfo(),
          Guide(),
          Footer(),
        ],
      ),
    );
  }

}
