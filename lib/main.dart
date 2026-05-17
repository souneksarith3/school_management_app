import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:school_management_app/auth/sign_in.dart';
import 'package:school_management_app/auth/sign_up.dart';
import 'package:school_management_app/configs/themes/app_theme.dart';
import 'package:school_management_app/controllers/auth_controller.dart';
import 'package:school_management_app/views/home_view.dart';
import 'package:school_management_app/views/student_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env["SUPABASE_URL"] ?? "",
    anonKey: dotenv.env["SUPABASE_KEY"] ?? "",
  );
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: HomeView(),
    );
  }
}
