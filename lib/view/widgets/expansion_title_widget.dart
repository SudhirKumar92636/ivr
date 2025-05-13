import 'package:flutter/material.dart';

class PrivacyTile extends StatelessWidget {
  final String title;
  final String text;
  const PrivacyTile({super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        title,
        textAlign: TextAlign.start,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold,
        ),
      ),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      children:  [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(text,
            style: const TextStyle(color: Colors.white,fontSize: 13),
          ),
        )
      ],
    );
  }
}