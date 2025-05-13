
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'access_to_your_contact.dart';
class AccessCallHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Center(
                  child: Image.asset(
                    'assets/images/his.jpg',
                    height: 230,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "ACCESS TO YOUR CALL - HISTORY",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height:15),
                const Text(
                  "Callyzer would like to access your call history. By allowing Callyzer to access your call logs, the app can analyze your data and generate reports and statistics to monitor the results effectively. Call Log access is mandatory for Callyzer, as its primary feature includes generating call reports.\n\n"
                      "Callyzer does not upload your call log data to any cloud server without your consent. The data is stored locally on your device.\n\n"
                      "Callyzer reads call logs when running in the background allowing the app to keep the logs even if it is deleted. Also, you can receive real-time reports without opening the app.",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                     Get.to(const AccessContactsScreen());
                    },
                    child: const Text(
                      "Allow Access",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.verified_user_outlined, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "It is Secure!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    // Handle Privacy Policy tap
                  },
                  child: const Text(
                    "Privacy Policy",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
