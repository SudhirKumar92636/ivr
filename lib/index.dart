import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_test_app/view/screens/bottom_nav/analytics/analytics_screens.dart';
import 'package:new_test_app/view/screens/bottom_nav/call_history/call_history.dart';
import 'package:new_test_app/view/screens/bottom_nav/contacts/contacts_screens.dart';
import 'package:new_test_app/view/screens/bottom_nav/more/more_screens.dart';
import 'package:new_test_app/view/screens/bottom_nav/premium/premium_screens.dart';
import 'package:new_test_app/view/utlis/app_color.dart'; // Importing AppColors

import 'controller/bottom_navigation_controller.dart';

class IndexScreen extends StatelessWidget {
  final controller = Get.find<BottomNavController>();

  final pages = [
    const CallHistoryScreen(),
    const AnalyticsScreen(),
    const PremiumScreens(),
    const ContactsScreens(),
    const MoreScreens(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: pages[controller.selectedIndex.value],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.changeTabIndex,
        backgroundColor: AppColors.scaffoldBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call History'),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
          BottomNavigationBarItem(icon: Icon(Icons.workspace_premium_outlined), label: 'Premium'),
          BottomNavigationBarItem(icon: Icon(Icons.perm_contact_cal), label: 'Contacts'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'More'),
        ],
      ),
    ));
  }
}
