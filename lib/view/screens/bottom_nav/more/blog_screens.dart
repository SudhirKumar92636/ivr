import 'package:flutter/material.dart';
import 'package:new_test_app/view/screens/bottom_nav/more/widgets/blog_widgets.dart';
import 'package:new_test_app/view/utlis/app_color.dart';
class BlogScreens extends StatefulWidget {
  const BlogScreens({super.key});

  @override
  State<BlogScreens> createState() => _BlogScreensState();
}

class _BlogScreensState extends State<BlogScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        title:const Text("Blog",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: AppColors.textPrimary),),
      ),
      backgroundColor: Colors.blueGrey,
      body: ListView(
        children: const [
          BlogCard(
            imagePath: "assets/images/dr.apj.jpg",
            description:
            "Dr. Kalam is one of the most distinguished scientists of India with the unique honour of receiving honorary doctorates from 30 universities and institutions. He has been awarded the coveted civilian awards - Padma Bhushan (1981) and Padma Vibhushan (1990) and the highest civilian award Bharat Ratna (1997).",
          ),
          BlogCard(
            imagePath: "assets/images/dr.apj.jpg",
            description:
            "Dr. Kalam is one of the most distinguished scientists of India with the unique honour of receiving honorary doctorates from 30 universities and institutions. He has been awarded the coveted civilian awards - Padma Bhushan (1981) and Padma Vibhushan (1990) and the highest civilian award Bharat Ratna (1997).",
          ),
          BlogCard(
            imagePath: "assets/images/dr.apj.jpg",
            description:
            "Dr. Kalam is one of the most distinguished scientists of India with the unique honour of receiving honorary doctorates from 30 universities and institutions. He has been awarded the coveted civilian awards - Padma Bhushan (1981) and Padma Vibhushan (1990) and the highest civilian award Bharat Ratna (1997).",
          ),
          BlogCard(
            imagePath: "assets/images/dr.apj.jpg",
            description:
            "Dr. Kalam is one of the most distinguished scientists of India with the unique honour of receiving honorary doctorates from 30 universities and institutions. He has been awarded the coveted civilian awards - Padma Bhushan (1981) and Padma Vibhushan (1990) and the highest civilian award Bharat Ratna (1997).",
          ),
          BlogCard(
            imagePath: "assets/images/dr.apj.jpg",
            description:
            "Dr. Kalam is one of the most distinguished scientists of India with the unique honour of receiving honorary doctorates from 30 universities and institutions. He has been awarded the coveted civilian awards - Padma Bhushan (1981) and Padma Vibhushan (1990) and the highest civilian award Bharat Ratna (1997).",
          ),
          BlogCard(
            imagePath: "assets/images/dr.apj.jpg",
            description:
            "Dr. Kalam is one of the most distinguished scientists of India with the unique honour of receiving honorary doctorates from 30 universities and institutions. He has been awarded the coveted civilian awards - Padma Bhushan (1981) and Padma Vibhushan (1990) and the highest civilian award Bharat Ratna (1997).",
          ),
        ],
      ),
    );
  }
}
