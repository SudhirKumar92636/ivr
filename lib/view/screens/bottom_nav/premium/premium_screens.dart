import 'package:flutter/material.dart';
import 'package:new_test_app/view/screens/bottom_nav/premium/premium_plus.dart';
import 'package:new_test_app/view/utlis/app_color.dart';

import 'Callyzer_blz.dart';

class PremiumScreens extends StatelessWidget {
  const PremiumScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: AppBar(
          backgroundColor: AppColors.appBarColor,
          elevation: 0,
          title: const Text(
            'Upgrade To Premium',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicatorColor: Colors.orange,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(icon: Icon(Icons.star), text: 'Premium'),
              Tab(icon: Icon(Icons.verified), text: 'Premium Plus'),
              Tab(icon: Icon(Icons.emoji_events), text: 'Callyzer Biz'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TabBarView(children: [
            PremiumContent(),
            PremiumPlus(),
            CallyzerBlz()
          ])

        ),
      ),
    );
  }
}

// Common Content for All Tabs
class PremiumContent extends StatefulWidget {
  const PremiumContent({super.key});

  @override
  State<PremiumContent> createState() => _PremiumContentState();
}

class _PremiumContentState extends State<PremiumContent> {
  int selectedPlan = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Text(
          'Here is what you will unlock',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 16),
        const FeatureItem(text: 'Ad-Free Experience.'),
        const FeatureItem(text: 'Auto Back Up your Call Logs in Google Drive.'),
        const FeatureItem(text: 'You can now receive quick technical support through Whatsapp.'),
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
    );
  }
}


class FeatureItem extends StatelessWidget {
  final String text;
  final Icon? icon;
  final Color iconColor;

  const FeatureItem({
    super.key,
    required this.text,
    this.icon,
    this.iconColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon ?? Icon(Icons.check_circle, color: iconColor, size: 20), // Use iconColor if no icon is provided
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style:  TextStyle(fontSize: 14 ,fontWeight:FontWeight.bold,color:AppColors.textPrimary),
          ),
        ),
      ],
    );
  }
}



// PlanCard Widget
class PlanCard extends StatelessWidget {
  final String duration;
  final String price;
  final String monthlyRate;
  final String? tag;
  final String savePercent;
  final bool isSelected;

  const PlanCard({
    super.key,
    required this.duration,
    required this.price,
    required this.monthlyRate,
    this.tag,
    required this.savePercent,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange.shade50 : Colors.grey.shade100,
        border: Border.all(
          color: isSelected ? Colors.orange : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
            color: isSelected ? Colors.orange : Colors.grey,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      duration,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    if (tag != null)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          tag!,
                          style: const TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    const Spacer(),
                    Text(
                      savePercent,
                      style: const TextStyle(color: Colors.green, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  monthlyRate,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
