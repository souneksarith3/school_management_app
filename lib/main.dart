import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:school_management_app/auth/sign_up.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding();
  await dotenv.load(fileName: ".env");
  try {
    await Supabase.initialize(
      url: dotenv.env["SUPABASE_URL"] ?? "",
      anonKey: dotenv.env["SUPABASE_KEY"] ?? "",
    );
  } catch (e) {
    print(e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.causeTextTheme(),
      ),
      home: SignUp(),
    );
  }
}
