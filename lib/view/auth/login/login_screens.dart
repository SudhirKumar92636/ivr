import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/password_controller.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final passwordControllers = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.08),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/callzer.jpg",
                      width: 520,
                      height: 120,

                    ),

                  ],
                ),
              ),

              // Add more login form widgets here if needed
            ],
          ),
        ),
      ),
    );
  }
}
