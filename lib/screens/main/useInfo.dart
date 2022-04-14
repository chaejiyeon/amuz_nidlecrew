import 'package:amuz_nidlecrew/widgets/useinfo/useInfoBanner.dart';
import 'package:flutter/material.dart';

class UseInfo extends StatefulWidget {
  const UseInfo({Key? key}) : super(key: key);

  @override
  State<UseInfo> createState() => _UseInfoState();
}

class _UseInfoState extends State<UseInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            UseInfoBanner(),
            Container(),
          ],
        ),
      ),
    );
  }
}
