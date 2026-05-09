import 'package:flutter/material.dart';
import 'package:school_management_app/configs/themes/my_color.dart';
import 'package:school_management_app/widgets/my_text.dart';

// ignore: must_be_immutable
class MyMaterialButton extends StatelessWidget {
  MyMaterialButton({
    super.key,
    //required this.onPressed,
    this.color,
    this.height = 54,
    this.width = double.infinity,
    this.text,
    this.textColor,
    this.onPressed,
  });

  //final void Function(void) onPressed;
  Color? color = MyColor.primaryColor, textColor = MyColor.textLightColor;
  String? text;
  double height, width = double.infinity;
  void Function(void)? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        color: color ?? MyColor.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.all(Radius.circular(16)),
        ),
        onPressed: () {
          onPressed;
        },
        child: MyText(
          text: text ?? "",
          size: 20,
          color: textColor ?? MyColor.textLightColor,
        ),
      ),
    );
  }
}
