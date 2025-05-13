import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_test_app/view/screens/set_default_phone_screens/privcy/widgets/privcy.dart';
import 'package:new_test_app/view/utlis/app_color.dart';

import 'access_to_your_all_call_history.dart';

class AccessContactsScreen extends StatelessWidget {
  const AccessContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground, // Background color from AppColors
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'assets/images/contact.jpg',
                  height: 220,
                ),
              ),
              const SizedBox(height: 65),
              GestureDetector(
                onTap: () {
                  Get.to(AccessCallHistoryScreen());
                },
                child: const Text(
                  'ACCESS TO YOUR CONTACTS',
                  style: TextStyle(
                    color: AppColors.textPrimary, // Text color from AppColors
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'Callyzer needs to access your contacts to display respective names and analyse contact call data. Granting contact permission is mandatory as it supports core feature of Callyzer.\n\n'
                    'We assure you that your contacts will not be uploaded to cloud server. We store the data within your device.\n\n'
                    'If the contact is more than 3000, we run the process in background to avoid wait time.',
                style: TextStyle(
                  color: AppColors.textSecondary, // Text color for secondary content
                  fontSize: 12,
                  height: 1.4,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonPrimary, // Button color from AppColors
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Get.to(const PrivacyScreen());
                  },
                  child: const Text(
                    "Let's do it",
                    style: TextStyle(
                      color: AppColors.buttonPrimaryText, 
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified_user, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'We are safe!',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Privacy Policy',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
