import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_test_app/view/utlis/app_color.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomContactWidget extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final int totalCalls;
  final Uint8List? photo;

  const CustomContactWidget({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.totalCalls,
    this.photo,
  });

  void _makePhoneCall(String phoneNumber) async {
    final Uri callUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(callUri)) {
      await launchUrl(callUri);
    } else {
      print('Could not launch $callUri');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double avatarSize = screenSize.width * 0.12;
    final double paddingSize = screenSize.width * 0.04;

       const Color backgroundColor = Color(0xFFF5F5F5);
    const Color avatarBorderColor = Color(0xFF1976D2);
    const Color textColor = AppColors.textPrimary;
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 2),
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: avatarSize,
                height: avatarSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: avatarBorderColor,
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: photo != null
                      ? Image.memory(photo!, fit: BoxFit.cover)
                      : Center(
                    child: Text(
                      name.isNotEmpty ? name[0].toUpperCase() : "",
                      style: TextStyle(
                        color: textColor,
                        fontSize: avatarSize * 0.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: paddingSize),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => _makePhoneCall(phoneNumber),
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      phoneNumber,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text(
                      'Add to Group',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    icon: const Icon(Icons.add, color:Colors.white),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:AppColors.buttonPrimary,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      shadowColor: Colors.transparent,
                    ),
                  ),
                  Text(
                    'Total Calls: $totalCalls',
                    style: const TextStyle(
                      color: textColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.copy, color: AppColors.iconColor), // Dark icon color
              ),
              IconButton(
                onPressed: () async {
                  final smsUri = Uri.parse("sms:$phoneNumber?body=Hey $name ");

                  if (await canLaunchUrl(smsUri)) {
                    await launchUrl(smsUri);
                  } else {
                    print("Message app not open.");
                  }
                },
                icon: const Icon(Icons.message, color: AppColors.iconColor),
              ),

              IconButton(
                onPressed: () async {
                  final whatsappNumber = "+91$phoneNumber";
                  final message = Uri.encodeComponent("Hey $name ");
                  final url = "https://wa.me/$whatsappNumber?text=$message";
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                  } else {
                    print("WhatsApp not open");
                  }
                },
                icon: const Icon(FontAwesomeIcons.whatsapp, color: AppColors.iconColor),
              ),
              IconButton(
                onPressed: () => _makePhoneCall(phoneNumber),
                icon: const Icon(Icons.call, color: Color(0xFF25D366)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
