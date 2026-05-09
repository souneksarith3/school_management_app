import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_app/configs/themes/my_color.dart';
import 'package:school_management_app/controllers/auth_controller.dart';
import 'package:school_management_app/widgets/build_text_form_field.dart';
import 'package:school_management_app/widgets/my_material_button.dart';
import 'package:school_management_app/widgets/my_text.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: "Sign Up Screen", size: 24, isBold: true),
        centerTitle: true,
        backgroundColor: MyColor.primaryColor,
      ),
      body: _buildBody,
    );
  }

  Widget get _buildBody {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        spacing: 10,
        children: [
          SizedBox(height: 30),

          Container(
            height: 130,
            width: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/welcome.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),

          Obx(
            () => Form(
              key: controller.signUpFormKey,
              child: Column(
                spacing: 16,
                children: [
                  MyText(text: "Welcome!", size: 22, isBold: true),
                  BuildTextFormField(
                    controller: controller.ctlEmail,
                    label: "Your Email",
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmail == false) {
                        return "Invalid email address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  BuildTextFormField(
                    controller: controller.ctlPassword,
                    label: "Your Password",
                    obscureText: controller.showPassword.value == true
                        ? true
                        : false,
                    validator: (value) {
                      controller.passwordValidation(value!);
                    },
                  ),

                  BuildTextFormField(
                    controller: controller.ctlConfirm,
                    label: "Your Confirm Password",
                    obscureText: controller.showPassword.value == true
                        ? true
                        : false,
                  ),

                  Row(
                    children: [
                      Checkbox(
                        value: controller.showPassword.value,
                        onChanged: (value) {
                          controller.showPassword.value = value!;
                        },
                        checkColor: MyColor.primaryColor,
                      ),
                      MyText(
                        text: "Show password",
                        color: Colors.grey.shade800,
                      ),
                    ],
                  ),

                  MyMaterialButton(
                    text: "Sign up",
                    onPressed: (value) async {
                      if (controller.signUpFormKey.currentState!.validate() ==
                          true) {
                        print("object");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
