import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_app/configs/core/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final supabase = AuthService();
  final _isLoading = false.obs;
  final showPassword = false.obs;

  final signInKeyForm = GlobalKey<FormState>();
  final logInKeyForm = GlobalKey<FormState>();
  final ctlEmail = TextEditingController();
  final ctlPassword = TextEditingController();
  final ctlConfirm = TextEditingController();

  bool get isLoading {
    return _isLoading.value;
  }

  set isLoading(bool value) => _isLoading.value = value;

  void clearContent() {
    ctlEmail.clear();
    ctlPassword.clear();
    ctlConfirm.clear();
    showPassword.value = false;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    clearContent();
    super.onClose();
  }

  Future<AuthResponse?> logIn({String? email, String? password}) async {
    try {
      isLoading = true;
      return await supabase.logIn(email: email, password: password);
    } on AuthException catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    } finally {
      isLoading = false;
    }
  }

  Future<AuthResponse?> signUp({String? email, String? password}) async {
    try {
      isLoading = true;
      return await supabase.signUp(email: email, password: password);
    } on AuthException catch (e) {
      Get.snackbar("Error", e.toString());
      return null;
    } finally {
      isLoading = false;
    }
  }

  String? emailValidation(String value) {
    if (value == null || value.isEmpty == true || value.isEmail == false) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  String? passwordValidation(String value) {
    if (value.trim().isEmpty || value.length < 8) {
      return "Password must be at least 8 characters";
    } else {
      return null;
    }
  }

  String? confirmValidator(String value) {
    if (value.trim() == ctlPassword.text.trim()) {
      return null;
    } else {
      return "Password and Confirm Password do not match.";
    }
  }

  void confirmValidatorTextChanged(String value) {
    if (value.trim() != ctlPassword.text.trim()) {
      Get.snackbar("title", "Password and confirm password are match");
    } else {
      return;
    }
  }

  void signInPressed() async {
    if (signInKeyForm.currentState!.validate() == true) {
      final response = await signUp(
        email: ctlEmail.text.trim(),
        password: ctlPassword.text.trim(),
      );
      if (response != null) {
        Get.snackbar("Success", "Sign up successfully");
        clearContent();
      }
    }
  }

  void logInPressed() async {
    if (logInKeyForm.currentState!.validate() == true) {
      final response = await logIn(
        email: ctlEmail.text.trim(),
        password: ctlPassword.text.trim(),
      );
      if (response != null) {
        Get.snackbar("Success", "Log in successfully");
        clearContent();
      }
    }
  }
}
