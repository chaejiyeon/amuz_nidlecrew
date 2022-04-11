import 'package:flutter/material.dart';

class CircleIconBtn extends StatelessWidget {
  final String icon;
  
  const CircleIconBtn({Key? key, required this.icon}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        child: Image.asset("assets/icons/"+icon),
      ),
    );
  }
}
