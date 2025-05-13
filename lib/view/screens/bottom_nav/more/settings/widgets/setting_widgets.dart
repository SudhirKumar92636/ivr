import 'package:flutter/material.dart';
import 'package:new_test_app/view/utlis/app_color.dart';

class SettingsTile extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final VoidCallback onTap;

  const SettingsTile({
    super.key,
    required this.icon,
     this.iconColor,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: iconColor?? AppColors.iconColor),
          title: Text(title, style: const TextStyle(color:AppColors.textPrimary, fontSize: 18)),
          trailing: const Icon(Icons.arrow_forward_ios, color:AppColors.iconColor, size: 16),
          onTap: onTap,
        ),
        const Divider(color:AppColors.dividerColor, thickness: 0.9, indent: 16, endIndent: 16),
      ],
    );
  }
}
