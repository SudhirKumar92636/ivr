import 'package:flutter/material.dart';
import 'package:new_test_app/view/utlis/app_color.dart';
import 'package:new_test_app/view/widgets/custom_buttons.dart';

class CompareScreens extends StatefulWidget {
  const CompareScreens({super.key});

  @override
  State<CompareScreens> createState() => _CompareScreensState();
}

class _CompareScreensState extends State<CompareScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.iconColor),
        backgroundColor:AppColors.appBarColor,
        title:  const Text("Compare",style: TextStyle(color:AppColors.textPrimary),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: (){}, icon:const Icon(Icons.group_add,size: 150,color:AppColors.iconColor,)),
          const SizedBox(height: 20,),
           const Padding(
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Text("Add contacts to compare calls and duration (You can add max 5 contacts)",style: TextStyle(
              fontSize:15,fontWeight:FontWeight.bold,color:AppColors.textPrimary
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(text: "Add Contacts", onPressed:(){},),
          )
        ],
      ),
    );
  }
}
