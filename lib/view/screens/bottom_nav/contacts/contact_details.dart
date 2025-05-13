import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utlis/app_color.dart';

class ContactsDetails extends StatefulWidget {
  final String username;
  final String number;
  const ContactsDetails({super.key, required this.username, required this.number});

  @override
  State<ContactsDetails> createState() => _ContactsDetailsState();
}

class _ContactsDetailsState extends State<ContactsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        backgroundColor: AppColors.appBarColor,
         title:Column(
           children:  [
             Text(widget.username,style: const TextStyle(color: AppColors.textPrimary),),
             Text(widget.number,style: const TextStyle(color: AppColors.textPrimary)),
           ],
         ),
        actions: [
          const Icon(Icons.network_wifi),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    decoration: const BoxDecoration(
                        color: Colors.blueGrey,
                      borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(20),
                        topRight:Radius.circular(20),
                      )
                    ),

                    child:const Column(
                      children: [
                        ListTile(leading: Icon(Icons.call ,color: Colors.blueAccent,), title: Text("Call"),),
                        ListTile(leading: Icon(FontAwesomeIcons.whatsapp ,color: Colors.green,), title: Text("WhatsApp"),),
                        ListTile(leading: Icon(Icons.message ,color: Colors.blueAccent,), title: Text("Text Message"),),
                        ListTile(leading: Icon(Icons.copy ,color: Colors.blueAccent,), title: Text("Copy"),),
                        ListTile(leading: Icon(Icons.download ,color: Colors.blueAccent,), title: Text("Export Report"),),
                        ListTile(leading: Icon(Icons.call ,color: Colors.blueAccent,), title: Text("Call"),),
                        ListTile(leading: Icon(Icons.favorite_outline ,color: Colors.blueAccent,), title: Text("Favorite"),),
                      ],
                    )

                  );
                },
              );
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.more_vert),
            ),
          ),
        ],
      ),
    );
  }
}
