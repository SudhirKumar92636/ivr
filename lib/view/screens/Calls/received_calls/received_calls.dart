import 'package:flutter/material.dart';

class ReceivedCallsScreens extends StatefulWidget {
  const ReceivedCallsScreens({super.key});

  @override
  State<ReceivedCallsScreens> createState() => _ReceivedCallsScreensState();
}

class _ReceivedCallsScreensState extends State<ReceivedCallsScreens> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Received Calls"),
      ),
    );
  }
}
