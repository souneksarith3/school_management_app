import 'package:flutter/material.dart';
import 'package:school_management_app/widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.onChanged,
    this.validator,
    this.controller,
    this.label,
    this.obscureText = false,
  });

  TextEditingController? controller = TextEditingController();
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  String? label;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        return validator!(value);
      },
      obscureText: obscureText,
      onChanged: (value) {
        onChanged;
      },
      decoration: InputDecoration(label: CustomText(text: label ?? "")),
    );
  }
}
