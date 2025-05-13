
import 'package:flutter/material.dart';

import '../../../utlis/app_color.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Call History',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.copy, color: AppColors.iconColor)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.sim_card_alert, color: AppColors.iconColor)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.sim_card, color: AppColors.iconColor)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '19-Apr 12:00 AM - 19-Apr\n11:59 PM',
                    style: TextStyle(color: Colors.black87),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                    ),
                    child: const Row(
                      children: [
                        Text('Today'),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Your SIM2 is not verified, so you may get the issue with the analytics data for this SIM. To verify your SIM Click here',
                style: TextStyle(color: Colors.orange[800]),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildLegendItem(Colors.lightGreen, 'Incoming'),
                        const SizedBox(width: 8.0),
                        _buildLegendItem(Colors.orangeAccent, 'Outgoing'),
                        const SizedBox(width: 8.0),
                        _buildLegendItem(Colors.redAccent, 'Missed'),
                        const SizedBox(width: 8.0),
                        _buildLegendItem(Colors.grey, 'Rejected'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12.0),

                  //Image.asset('assets/light_theme_chart_placeholder.png'), // Replace with your chart
                  const SizedBox(height: 12.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('12:00 AM', style: TextStyle(color: Colors.black54)),
                      Text('06:00 AM', style: TextStyle(color: Colors.black54)),
                      Text('12:00 PM', style: TextStyle(color: Colors.black54)),
                      Text('06:00 PM', style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Phone Call', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Duration', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.call, size: 32.0, color: Colors.blueGrey),
                          SizedBox(height: 8.0),
                          Text('Total Phone Calls', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4.0),
                          Text('22', style: TextStyle(fontSize: 24.0, color: Colors.blueGrey, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4.0),
                          Text('18m 4s', style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.call_received, size: 32.0, color: Colors.lightGreen),
                          SizedBox(height: 8.0),
                          Text('Incoming Calls', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4.0),
                          Text('5', style: TextStyle(fontSize: 24.0, color: Colors.lightGreen, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4.0),
                          Text('4m 13s', style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.call_made, size: 32.0, color: Colors.orangeAccent),
                          SizedBox(height: 8.0),
                          Text('Outgoing Calls', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4.0),
                          Text('10', style: TextStyle(fontSize: 24.0, color: Colors.orangeAccent, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4.0),
                          Text('8m 20s', style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.call_missed, size: 32.0, color: Colors.redAccent),
                          SizedBox(height: 8.0),
                          Text('Missed Calls', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4.0),
                          Text('7', style: TextStyle(fontSize: 24.0, color: Colors.redAccent, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4.0),
                          Text('0s', style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Summary', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87)),
                    SizedBox(height: 8.0),
                    Text('This is a summary of your call analytics.', style: TextStyle(color: Colors.black54)),
                    // Add more summary details here
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Analysis', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black87)),
                SizedBox(height: 8.0),
                Text('Here s a more detailed analysis of your call patterns.', style: TextStyle(color: Colors.black54)),
                  // Add more detailed analysis here
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Call History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: 'Premium',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
        currentIndex: 1, // Assuming Analytics is the current screen
        onTap: (int index) {
          // Handle navigation
        },
      ),
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12.0,
          height: 12.0,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 4.0),
        Text(text, style: const TextStyle(color: Colors.black87)),
      ],
    );
  }
}