import 'package:flutter/material.dart';

import '../../../../widgets/expansion_title_widget.dart';

class UnnecessaryPermissionWidgets extends StatefulWidget {
  const UnnecessaryPermissionWidgets({super.key});

  @override
  State<UnnecessaryPermissionWidgets> createState() => _UnnecessaryPermissionWidgetsState();
}

class _UnnecessaryPermissionWidgetsState extends State<UnnecessaryPermissionWidgets> {
  @override
  Widget build(BuildContext context) {
    return PrivacyTile(
      title: 'Unnecessary permissions? We never ask for it',
      text:"It's essential that you are clear on how we use \n"
          "your data. You can choose to provide optional\n"
          "permission (such as microphone) depending\n"
          "on the feature you intend to use. Also, always/n"
          "deactivate this permission in the app or on your\n"
          "device anytime",
    );
  }
}
