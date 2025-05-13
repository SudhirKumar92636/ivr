import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_test_app/view/utlis/app_color.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Calls/incoming_calls/incoming_call.dart';
import '../../Calls/all_calls/all_calls.dart';
import '../../Calls/outgoing_calls/out_going_calls.dart';

class CallHistoryScreen extends StatelessWidget {
  const CallHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController dialController = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController searchController = TextEditingController();


    return DefaultTabController(
        length: 7,
        child:Scaffold(
          backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title:Text(
          'Call History',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.copy, color: AppColors.iconColor)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.sim_card_alert, color: AppColors.iconColor)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.sim_card, color: AppColors.iconColor)),
        ],
        bottom: const TabBar(
          labelColor: Colors.orangeAccent,
          unselectedLabelColor:AppColors.textPrimary,
          indicatorColor: Colors.deepOrange,
          indicatorWeight: 3,
          isScrollable: true,
          tabs: [
            Tab(icon: Icon(Icons.call), text: "All Calls",),
            Tab(icon: Icon(Icons.call_received), text: "Incoming",),
            Tab(icon: Icon(Icons.call_made), text: "Outgoing"),
            Tab(icon: Icon(Icons.call_missed), text: "Missed"),
            Tab(icon: Icon(Icons.phone_bluetooth_speaker_outlined), text: "Rejected"),
            Tab(icon: Icon(CupertinoIcons.phone_badge_plus), text: "Never Attended Calls"),
            Tab(icon: Icon(Icons.call_end), text: "Not Pickup by Client6"),
          ],
        ),
      ),
      body: const TabBarView(children: [
        AllCallsScreens(),
        IncomingCallsScreen(),
        GetAllOutGoingCall(),
        AllCallsScreens(),
        IncomingCallsScreen(),
        GetAllOutGoingCall(),
        GetAllOutGoingCall(),
      ]),
    )
    );

  }
}

class CallTile extends StatelessWidget {
  final String name;
  final String    number;
  final String   time;
  final String    duration;
  final String    simNumber;

  const CallTile({
    super.key,
    required this.name,
    required this.number,
    required this.time,
    required this.duration,
    required this.simNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5, top: 5, left: 8, right: 8),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.lime,
                      child: Icon(Icons.call_received, color: AppColors.iconColor),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name, style: const TextStyle(
                                  color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                          const SizedBox(height: 2),
                          Text(number.toString(),
                              style: const TextStyle(color: AppColors.textPrimary, fontSize: 13)),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(time, style: const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
                        Text(duration, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Icon(Icons.copy, color: Colors.white60),
                    const Icon(Icons.message_outlined, color: Colors.lightBlue),
                    // IconButton(onPressed: (){
                    //   Share.share("${number}");
                    // }, icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.green,)),

                    IconButton(
                      onPressed: () async {
                        final phoneNumber = "+91$number";
                        final url = "https://wa.me/$phoneNumber";

                        if (await canLaunchUrl(Uri.parse(url))) {
                          await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                        } else {
                          print("WhatsApp open nahi ho raha.");
                        }
                      },
                      icon: const Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
                    ),

                    IconButton(onPressed: (){},icon: const Icon(Icons.call), color: Colors.green),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.cardColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.note, color: AppColors.iconColor, size: 18),
                const SizedBox(width: 8),
                const Text(
                  "Tap to add note & tag",
                  style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
                ),
                const Spacer(),
                Text(
                  "SIM: $simNumber",
                  style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
