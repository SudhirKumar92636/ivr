import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../services/api_services.dart';
import '../../../utlis/app_color.dart';
import '../../../widgets/custom_search_text_fields.dart';
import '../../bottom_nav/call_history/call_history.dart';

class GetAllOutGoingCall extends StatelessWidget {
  const GetAllOutGoingCall({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController dialController = TextEditingController();
    double screenWidth = MediaQuery.of(context).size.width;
    TextEditingController searchController = TextEditingController();
    ApiServices apiServices = Get.put(ApiServices());

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        body:SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchTextField(
                hintText: 'Search product',
                controller: searchController,
                onChanged: (value) {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 4),
                child: const Text(
                  "Today",
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(child:  Obx(() {
                if (apiServices.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (apiServices.outGoingCallList.isEmpty) {
                  return const Center(child: Text('No Calls Found'));
                } else {
                  return ListView.builder(
                    itemCount: apiServices.outGoingCallList.length,
                    itemBuilder: (context, index) {
                      var call = apiServices.outGoingCallList[index];
                      return CallTile(
                        name: "UnKnown" ?? '',
                        number: call.phoneno ?? '',
                        time: call.startTime ?? '',
                        duration: call.endTime ?? '',
                        simNumber: '1' ?? '',
                      );
                    },
                  );
                }
              }),)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow[800],
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              backgroundColor: Colors.black,
              builder: (context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                      padding: const EdgeInsets.all(16),
                      height: 420,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: dialController,
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.center,
                            readOnly: true,
                            maxLines: null,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.backspace_outlined),
                                onPressed: () {
                                  setState(() {
                                    if (dialController.text.isNotEmpty) {
                                      dialController.text =
                                          dialController.text.substring(0, dialController.text.length - 1);
                                    }
                                  });
                                },
                                color: Colors.redAccent,
                              ),
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.copy, color:AppColors.iconColor),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: GridView.builder(
                              itemCount: 12,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1.9,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) {
                                final dialPad = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '*', '0', '#'];
                                return TextButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.all(16),
                                    elevation: 4,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      if (dialController.text.length <= 15) {
                                        dialController.text += dialPad[index];
                                      }
                                    });
                                  },
                                  child: Text(
                                    dialPad[index],
                                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
                              Icon(FontAwesomeIcons.simCard, color: Colors.green),
                              Icon(Icons.dialpad, color: Colors.green),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          },
          child: const Icon(Icons.dialpad, color: Colors.black),
        ),
      ),
    );
  }
}
