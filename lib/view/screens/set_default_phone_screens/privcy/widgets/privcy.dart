import 'package:flutter/material.dart';
import 'package:new_test_app/view/screens/set_default_phone_screens/privcy/widgets/unnecessary_permission.dart';
import 'package:new_test_app/view/screens/set_default_phone_screens/privcy/widgets/your_data_privcy_widgets.dart';
import 'always_number_widgets.dart';
import 'data_process_widgets.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.privacy_tip_sharp, color: Colors.white),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: 'By clicking Agree & Continue you agree to our ',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                        children: [
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: const Text(
                  'AGREE & CONTINUE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your privacy is important to us',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    text: 'Please take time to review the key points of our ',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                    children: [
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(text: ' below.'),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                const DataProcessWidgets(),
                const YourDAtaWidgets(),
                const UnnecessaryPermissionWidgets() ,
                const AlwaysNumberWidgets(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
