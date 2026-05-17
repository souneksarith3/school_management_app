import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;

  Future<AuthResponse> signUp({String? email, String? password})async{
    return await supabase.auth.signUp(password: password!, email: email!);
  }

  Future<AuthResponse> logIn({String? email, String? password})async{
    return await supabase.auth.signInWithPassword(password: password!, email: email!);
  }

  Future<void> logOut() async{
    await supabase.auth.signOut();
  }

  Future<String> getCurrentUser() async{
    String currentUser = await supabase.auth.currentUser!.id;
    return currentUser;
  }
}