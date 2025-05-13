import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_test_app/view/screens/bottom_nav/more/help_support/support_from.dart';
import 'package:new_test_app/view/screens/bottom_nav/more/settings/widgets/setting_widgets.dart';
import '../../../../utlis/app_color.dart';
class HelpSupportScreens extends StatefulWidget {
  const HelpSupportScreens({super.key});

  @override
  State<HelpSupportScreens> createState() => _HelpSupportScreensState();
}
class _HelpSupportScreensState extends State<HelpSupportScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.iconColor),
        backgroundColor:AppColors.appBarColor,
        title:  const Text("Settings",style: TextStyle(color:AppColors.textPrimary),),
      ),

      body: Column(
        children: [
          SettingsTile(icon: Icons.email_outlined, title: "Contact Us", onTap: () {
          Get.to(const HelpSupportFromScreen());
          },),
          ListTile(
            leading: const Icon(FontAwesomeIcons.whatsapp ,color:AppColors.iconColor,),
            title: const Text("WhatsApp Us",style: TextStyle(color:AppColors.textPrimary),),
            subtitle: const Text("(For premium Customers)",style: TextStyle(color:AppColors.textSecondary),),
            trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios), color:AppColors.iconColor, ),
          ),
          const Divider(color:AppColors.dividerColor, thickness: 0.9, indent: 16, endIndent: 16),
         SettingsTile(icon: Icons.info_outlined, title: "FAQ", onTap:() {

         },)
        ],
      ),
    );
  }
}
