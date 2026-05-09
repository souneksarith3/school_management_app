import 'package:flutter/material.dart';
import 'package:school_management_app/configs/themes/my_color.dart';

class MyText extends StatelessWidget {
  MyText({
    super.key,
    required this.text,
    this.size = 16,
    this.color,
    this.isBold = false,
  });

  String text;
  double size;
  Color? color = MyColor.textDarkColor;
  bool isBold;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: isBold == true ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}