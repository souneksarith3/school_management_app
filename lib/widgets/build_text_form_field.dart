import 'package:flutter/material.dart';
import 'package:school_management_app/widgets/my_text.dart';

class BuildTextFormField extends StatelessWidget {
  BuildTextFormField({
    super.key,
    this.label,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.textInputType = TextInputType.text,
  });

  TextEditingController? controller = TextEditingController();
  bool obscureText;
  final String? label;
  final String? Function(String?)? validator;
  final void Function(void)? onChanged;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        label: MyText(text: label!),
      ),
    );
  }
}
