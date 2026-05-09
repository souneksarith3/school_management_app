import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:school_management_app/configs/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController{
  RxBool isLoading = false.obs;
  final signUpFormKey = GlobalKey<FormState>();
  RxBool showPassword = false.obs;
  

  Future<AuthResponse?> signIn({required String email, required String password}) async{
    try{
      isLoading.value = true;
      return AuthService.signUp(email: email, password: password);
    }
    catch(e){
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      return null;
    }
    finally{
      isLoading.value = false;
    }
  }

  Future<AuthResponse?> logIn({required String email, required String password}) async{
    try{
      isLoading.value = true;
      return AuthService.logIn(email: email, password: password);
    }
    catch(e){
      Get.snackbar("Error", e.toString());
      return null;
    }
    finally{
      isLoading.value = false;
      Get.toNamed("");
    }
  }

  Future<void> logOut() async{
    try{
      isLoading.value = true;
      AuthService.logOut();
    }
    catch(e){
      Get.snackbar("Error", e.toString());
    }
    finally{
      isLoading.value = false;
    }
  }
}