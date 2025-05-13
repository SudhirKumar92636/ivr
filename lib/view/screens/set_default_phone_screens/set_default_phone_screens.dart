import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_test_app/view/utlis/app_color.dart';

import 'access_to_your_all_call_history.dart';

class SetDefaultPhoneAppScreen extends StatelessWidget {
  const SetDefaultPhoneAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground, // Background color from AppColors
      body: SafeArea(
        child: Column(
          children: [
            Image.asset("assets/images/callzer.jpg"),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                "Set Default Phone App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textPrimary, // Text color from AppColors
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "By permitting, you accept to initiate calls through Callyzer application dialer when using this application.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary, // Secondary text color
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonPrimary, // Button primary color
                        foregroundColor: AppColors.buttonPrimaryText, // Button text color
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Get.to(AccessCallHistoryScreen());
                      },
                      child: const Text("Yes, I Agree"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.buttonOutlineText, // Button outline text color
                        side: BorderSide(color: AppColors.buttonOutlineText),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Get.to(AccessCallHistoryScreen());
                      },
                      child: const Text("SKIP"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Privacy Policy",
                style: TextStyle(
                  color: AppColors.textSecondary, // Privacy text color
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
