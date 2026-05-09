import 'package:flutter/material.dart';
import 'package:school_management_app/widgets/my_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: MyText(text: "Home Page"),),
    );
  }
}