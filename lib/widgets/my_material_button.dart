import 'package:flutter/material.dart';
import 'package:school_management_app/configs/themes/my_color.dart';
import 'package:school_management_app/widgets/my_text.dart';

// ignore: must_be_immutable
class MyMaterialButton extends StatelessWidget {
  MyMaterialButton({
    super.key,
    //required this.onPressed,
    this.color,
    this.height,
    this.width,
    this.text,
  });

  //final void Function(void) onPressed;
  Color? color = MyColor.primaryColor;
  String? text;
  double? height = 50, width = double.infinity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: MaterialButton(
        color: color,
        onPressed:() {},
        child: MyText(text: text!),
      ),
    );
  }
}
