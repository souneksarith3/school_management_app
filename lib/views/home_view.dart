import 'package:flutter/material.dart';
import 'package:school_management_app/widgets/custom_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody);
  }

  Widget get _buildBody {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 120,
          toolbarHeight: 80,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              SizedBox(height: 8),
              CustomText(text: "Welcome admin", size: 24, isBold: true,),
              CustomText(
                text:
                    "Today: ${DateTime.now().day} - ${DateTime.now().month} - ${DateTime.now().year}",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
