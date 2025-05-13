import 'package:flutter/material.dart';

import '../../../../widgets/expansion_title_widget.dart';

class AlwaysNumberWidgets extends StatefulWidget {
  const AlwaysNumberWidgets({super.key});

  @override
  State<AlwaysNumberWidgets> createState() => _AlwaysNumberWidgetsState();
}

class _AlwaysNumberWidgetsState extends State<AlwaysNumberWidgets> {
  @override
  Widget build(BuildContext context) {
    return PrivacyTile(
      title: 'Your number is always confidential',
      text: "At Callyzer, we value your privacy. Rest assured,\n"
          "your phone number is treated with bthe number \n"
          "confidentiality. We do not share, sell or disclose\n"
          "explicit consent. It is solely used for essential \n"
          "a seamless and secure user exprience. Your trust\n"
          "is paramount to us, and safeguarding your personal\n"
          "mobile number to ensure that our users are \n"
          "genuine. This is part of our rigorous verification\n"
          "process. Users can complete the verfication \n"
          "process using two methods. call-based verfication\n"
          "or verfication via their call logs, designed to\n"
          "guarantee our user base's authenicity.",
    );
  }
}
