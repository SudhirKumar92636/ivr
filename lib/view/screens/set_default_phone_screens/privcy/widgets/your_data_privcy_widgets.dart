import 'package:flutter/material.dart';

import '../../../../widgets/expansion_title_widget.dart';

class YourDAtaWidgets extends StatefulWidget {
  const YourDAtaWidgets({super.key});

  @override
  State<YourDAtaWidgets> createState() => _YourDAtaWidgetsState();
}

class _YourDAtaWidgetsState extends State<YourDAtaWidgets> {
  @override
  Widget build(BuildContext context) {
    return const PrivacyTile(
      title: 'How we use your data',
      text:"Privacy is an  integral part of our culture and process\n"
          "at Callyzer. We continuously evalute the privacy \n"
          "implications of all our features. Your data is only \n"
          "used for the purposes set out in our Privacy Policy,\n"
          "including: Providing, improving, analysing, and\n"
          "positive experience with our application. Comply with \n"
          "logs to analyse user call data and generates reports\n"
          "efficiently. We collect only the information required to\n"
          "provide our services",
    );
  }
}
