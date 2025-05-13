import 'package:flutter/material.dart';
import 'package:new_test_app/view/screens/bottom_nav/premium/premium_screens.dart';
import 'package:new_test_app/view/utlis/app_color.dart';

class PremiumPlus extends StatefulWidget {
  const PremiumPlus({super.key});

  @override
  State<PremiumPlus> createState() => _PremiumPlusState();
}

class _PremiumPlusState extends State<PremiumPlus> {
  int selectedPlan = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: ListView(
        children: [
          const Text("Here is what you will unlock",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
          const FeatureItem(text: "Everything in Premium Plan" ,iconColor: Colors.deepOrange,),
          const SizedBox(height: 5,),
          const FeatureItem(text: "Add a Note and tags after each call" ,iconColor: Colors.deepOrange,),
          const SizedBox(height: 5,),
          const FeatureItem(text: "During the export process.you have the option to exclude contect information and call logs" ,iconColor: Colors.deepOrange,),
          const SizedBox(height: 5,),
          const FeatureItem(text: "View Unique calls and connected calls." ,iconColor: Colors.deepOrange,),
          const SizedBox(height: 5,),
          const FeatureItem(text: "Now Setup a billing cycle. Also get "
              "informed about price for each call" ,iconColor: Colors.deepOrange,),
          const SizedBox(height: 5,),
          const FeatureItem(text: "Export the contact report in Excel format" ,iconColor: Colors.deepOrange,),
          const SizedBox(height: 5,),
          const FeatureItem(text: "Easily organize contacts into customized groups" ,iconColor: Colors.deepOrange,),
          const SizedBox(height: 5,),
          const FeatureItem(text: "Filter and export reports based on groups" ,iconColor: Colors.deepOrange,),
          const SizedBox(height: 24),
          const Text(
            'Choose a Plan',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 16),

          GestureDetector(
            onTap: () => setState(() => selectedPlan = 0),
            child: PlanCard(
              duration: '12 Month',
              price: '₹399',
              monthlyRate: '₹33.25/month',
              tag: 'Popular',
              savePercent: 'Save 55%',
              isSelected: selectedPlan == 0,
            ),
          ),
          const SizedBox(height: 12),
           GestureDetector(
            onTap: () => setState(() => selectedPlan = 1),
            child: PlanCard(
              duration: '3 Month',
              price: '₹180',
              monthlyRate: '₹60/month',
              savePercent: 'Save 20%',
              isSelected: selectedPlan == 1,
            ),
          ),
        ],
      ),
    );
  }
}
