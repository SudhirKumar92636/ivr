import 'package:flutter/material.dart';
import '../utlis/app_color.dart';

class CustomSearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const CustomSearchTextField({
    super.key,
    this.hintText = 'Search',
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 8),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(color: AppColors.textPrimary),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: AppColors.iconColor),
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.textSecondary),
          filled: true,
          fillColor: AppColors.cardColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.iconColor), // Optional
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.iconColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}
