import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  static final service = Supabase.instance.client;

  static Future<AuthResponse> signUp({
    required String email,
    required String password,
  }) async {
    return await service.auth.signUp(password: password, email: email);
  }

  static Future<AuthResponse> logIn({
    required String email,
    required String password,
  }) async {
    return await service.auth.signInWithPassword(
      password: password,
      email: email,
    );
  }

  static Future<void> logOut() async{
    service.auth.signOut();
  }
}
