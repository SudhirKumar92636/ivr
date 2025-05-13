import 'package:flutter/material.dart';

import '../../../../widgets/expansion_title_widget.dart';

class DataProcessWidgets extends StatefulWidget {
  const DataProcessWidgets({super.key});

  @override
  State<DataProcessWidgets> createState() => _DataProcessWidgetsState();
}

class _DataProcessWidgetsState extends State<DataProcessWidgets> {
  @override
  Widget build(BuildContext context) {
    return const PrivacyTile(
      title: 'Data we process',
      text:
      'We are committed to respecting and valuing the \n privacy of our users. We securely handle and process \n'
          'your data as per our Privacy Policy. The data We  \n'
          'Process depends on how you use our app. \n \n'
          'When You use our app, we collect certain information\n'
          'about your  call logs (such as phone number, incoming call)'
          'to display your call history in our default dialer.  \n'
          'Furthermore, We will ask permission to access your'
          'contacts and call logs. \n\n'
          'Using the Contact permission, we will access \n'
          'information on your device about your contacts, such \n'
          'as phone number and related name,to enable our \n'
          'default dialer feature and allow you to manage your \n'
          'for making the call. The first one is that the user can \n'
          "make a call from the phone's default dialer, and, the \n"
          "second one is to use our Callyzer dialer",
    );
  }
}
