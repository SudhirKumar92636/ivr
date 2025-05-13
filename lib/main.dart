import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/bottom_navigation_controller.dart';
import 'index.dart';

void main(){
  Get.put(BottomNavController());
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:IndexScreen (),
    );
  }}
