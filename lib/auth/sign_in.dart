import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:school_management_app/controllers/auth_controller.dart';
import 'package:school_management_app/widgets/custom_button.dart';
import 'package:school_management_app/widgets/custom_text.dart';
import 'package:school_management_app/widgets/custom_text_field.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: "Sign in", size: 24, isBold: true),
        centerTitle: true,
      ),
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 18),
      child: SingleChildScrollView(
        child: Column(spacing: 8, children: [_buildForm]),
      ),
    );
  }

  Widget get _buildForm {
    return Obx(
      () => Form(
        key: controller.logInKeyForm,
        child: Column(
          spacing: 18,
          children: [
            SizedBox(height: 18),
            CustomText(text: "Welcome Back!", size: 22, isBold: true),

            SizedBox(height: 8),
            CustomTextField(
              label: "Enter Email",
              controller: controller.ctlEmail,
              validator: (value) => controller.emailValidation(value!),
            ),

            CustomTextField(
              label: "Enter Password",
              controller: controller.ctlPassword,
              obscureText: controller.showPassword.value == true ? false : true,
              validator: (value) => controller.passwordValidation(value!),
            ),

            Row(
              children: [
                Checkbox(
                  value: controller.showPassword.value,
                  onChanged: (value) => controller.showPassword.value = value!,
                ),
                CustomText(text: "Show password"),
              ],
            ),

            controller.isLoading == true
                ? CircularProgressIndicator()
                : CustomButton(
                    onPressed: () async => controller.isLoading == true
                        ? null
                        : controller.logInPressed(),
                    text: "Log In",
                  ),
          ],
        ),
      ),
    );
  }
}
