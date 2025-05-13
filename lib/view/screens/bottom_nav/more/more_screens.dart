import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:new_test_app/view/screens/bottom_nav/more/settings/settings.dart';
import 'package:new_test_app/view/utlis/app_color.dart';
import '../../../widgets/custom_more_text_fields_widgets.dart';
import 'blog_screens.dart';
import 'compare/compare_screens.dart';
import 'help_support/help_support_screens.dart';

class MoreScreens extends StatefulWidget {
  const MoreScreens({super.key});

  @override
  State<MoreScreens> createState() => _MoreScreensState();
}

class _MoreScreensState extends State<MoreScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.only(top:80),
              child: Image.asset("assets/images/check.png",width: 100,height: 100,),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.dove,
                      color:AppColors.iconColor,
                    ),
                  ),),
                Container(
                decoration: BoxDecoration(
                color: AppColors.textFieldColor,
                 borderRadius: BorderRadius.circular(10)),
                    child: IconButton(onPressed: (){}, icon:const Icon(FontAwesomeIcons.instagram,color:AppColors.iconColor,))),
                Container(
                decoration: BoxDecoration(
                color: AppColors.textFieldColor,
            borderRadius: BorderRadius.circular(10)),
                    child: IconButton(onPressed: (){}, icon:const Icon(FontAwesomeIcons.facebook,color:AppColors.iconColor,))),
                Container(
                decoration: BoxDecoration(
                color: AppColors.textFieldColor, borderRadius: BorderRadius.circular(10)),child: IconButton(onPressed: (){}, icon:const Icon(Icons.send,color:AppColors.iconColor,))),
              ],
            ),
            CustomMoreTextFieldsWidgets(text: "Export Calls Report", iconData:Icons.upload,onTap: (){},),
            const SizedBox(height: 10,),
            CustomMoreTextFieldsWidgets(text: "Blogs", iconData:FontAwesomeIcons.blog,onTap: (){
             Get.to(const BlogScreens());
            },),
            const SizedBox(height: 10,),
            const SizedBox(height: 10,),CustomMoreTextFieldsWidgets(text: "Compare", iconData:FontAwesomeIcons.directions,onTap: (){
              Get.to(const CompareScreens());
            },),
            const SizedBox(height: 10,),
            CustomMoreTextFieldsWidgets(text: "Setting", iconData:Icons.settings,onTap: (){
              Get.to(const SettingsScreens());
            },),
            const SizedBox(height: 10,),
            CustomMoreTextFieldsWidgets(text: "Help & Support", iconData:Icons.support,onTap: (){
              Get.to(const HelpSupportScreens());
            },),
            const SizedBox(height: 10,),
            CustomMoreTextFieldsWidgets(text: "Invite Friends", iconData:Icons.person_add_alt,onTap: (){},),
            const SizedBox(height: 10,),
            CustomMoreTextFieldsWidgets(text: "Rate App", iconData:Icons.star_rate_outlined,onTap: (){},),
            const SizedBox(height: 10,),
            CustomMoreTextFieldsWidgets(text: "About App", iconData:Icons.info_outline,onTap: (){},),
          ],
        ),
      ),
    );
  }
}

