import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_test_app/view/screens/bottom_nav/more/settings/widgets/setting_widgets.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({super.key});

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [
          SettingsTile(icon: FontAwesomeIcons.crown, title:"Premium Settings", onTap: () {},iconColor: Colors.deepOrangeAccent,),
          SettingsTile(icon: FontAwesomeIcons.simCard, title:"SIM Number", onTap: () {},),
          SettingsTile(icon: FontAwesomeIcons.whatsapp, title:"WhatsApp Call", onTap: () {},),
          SettingsTile(icon:Icons.language, title:"Language", onTap: () {},),
          SettingsTile(icon: Icons.brightness_6, title: "Theme", onTap: () {},),
          SettingsTile(icon:Icons.alarm, title:"Time Format", onTap: () {},),
          SettingsTile(icon:Icons.bookmarks_rounded, title:"Set Default Screens", onTap: () {},),
          SettingsTile(icon:Icons.phone_missed, title:"Missed Call Details", onTap: () {},),
          SettingsTile(icon:Icons.dialpad, title:"Default Dialer", onTap: () {},),
          SettingsTile(icon:Icons.download_sharp, title:"Backup / Export Call History", onTap: () {},),
          SettingsTile(icon: Icons.upload, title:"Restore / Import Call History", onTap: () {},),
        ],
      ),
    );
  }
}
