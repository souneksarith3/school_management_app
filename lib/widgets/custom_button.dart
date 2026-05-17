import 'package:flutter/material.dart';
import 'package:school_management_app/configs/themes/app_theme.dart';
import 'package:school_management_app/widgets/custom_text.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.onPressed, this.text});

  final void Function() onPressed;
  String? text;
  double? width = double.infinity, height = 56;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: MaterialButton(
        color: AppTheme.buttonLightColor,
        onPressed: () {
          onPressed();
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: CustomText(text: text ?? "", size: 18, isBold: true),
      ),
    );
  }
}
