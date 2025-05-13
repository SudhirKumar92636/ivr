import 'package:flutter/material.dart';
import 'package:new_test_app/view/utlis/app_color.dart';

class CustomMoreTextFieldsWidgets extends StatefulWidget {
  final String text;
  final IconData iconData;
  final VoidCallback onTap;

  const CustomMoreTextFieldsWidgets({super.key, required this.text, required this.iconData, required this.onTap});

  @override
  State<CustomMoreTextFieldsWidgets> createState() => _CustomMoreTextFieldsWidgetsState();
}

class _CustomMoreTextFieldsWidgetsState extends State<CustomMoreTextFieldsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color:AppColors.textFieldColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child:  Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(widget.iconData, color:AppColors.iconColor, size: 24),
              const SizedBox(width: 10),
              Text(widget.text,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
