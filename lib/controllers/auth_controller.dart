import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school_management_app/configs/services/auth_service.dart';
import 'package:school_management_app/views/home_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final signUpFormKey = GlobalKey<FormState>();
  RxBool showPassword = false.obs;

  TextEditingController ctlEmail = TextEditingController();
  TextEditingController ctlPassword = TextEditingController();
  TextEditingController ctlConfirm = TextEditingController();

  Future<AuthResponse?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      return AuthService.signUp(email: email, password: password);
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      return null;
    } finally {
      isLoading.value = false;
    }
  }

  Future<AuthResponse?> logIn({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      return AuthService.logIn(email: email, password: password);
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    } finally {
      isLoading.value = false;
      Get.toNamed("");
    }
  }

  Future<void> logOut() async {
    try {
      isLoading.value = true;
      AuthService.logOut();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void clearContent() {
    ctlConfirm.clear();
    ctlPassword.clear();
    ctlEmail.clear();
  }

  String? emailValidation(String value) {
    if (value.isEmpty || value.isEmail == false) {
      return "Invalid email address";
    } else {
      return null;
    }
  }

  String? passwordValidation(String value) {
    if (value.isEmpty || value.removeAllWhitespace.length < 8) {
      return "Password must at least 8 characters";
    } else {
      return null;
    }
  }

  String? confirmValidation(String value) {
    if (value.isEmpty || value.compareTo(ctlPassword.text.trim()) != 0) {
      return "Can not confirm Password";
    } else {
      return null;
    }
  }

  bool get verifyConfirmPassword {
    if (ctlConfirm.text.trim() == ctlPassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> onSignUpPressed() async {
    if (signUpFormKey.currentState!.validate()) {
      // final rs = await signIn(email: ctlEmail.text, password: ctlPassword.text);
      // if (rs != null) {
      //   Get.to(HomeView());
      // }
    }
  }
}
