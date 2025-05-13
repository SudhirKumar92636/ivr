import 'package:flutter/material.dart';
import 'package:new_test_app/view/utlis/app_color.dart';

class CallyzerBlz extends StatefulWidget {
  const CallyzerBlz({super.key}); // Added the class name here

  @override
  State<CallyzerBlz> createState() => _State();
}

class _State extends State<CallyzerBlz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
    );
  }
}
