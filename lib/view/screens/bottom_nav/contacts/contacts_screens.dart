
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../controller/conact_controller.dart';
import '../../../utlis/app_color.dart';
import '../../../widgets/custom_search_text_fields.dart';
import 'contact_details.dart';
import 'favourite_contacts.dart';
import 'widgets/custom_contact_widgets.dart';

class ContactsScreens extends StatefulWidget {
  const ContactsScreens({super.key});

  @override
  State<ContactsScreens> createState() => _ContactsScreensState();
}

class _ContactsScreensState extends State<ContactsScreens> {
  final ContactsController controller = Get.put(ContactsController());
  final TextEditingController searchController = TextEditingController();

   @override
  void initState() {
    controller.loadFavouriteContacts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // AppBar Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06, vertical: 10),
              child: Row(
                children: [
                  Text(
                    'Contacts',
                    style: TextStyle(
                        color:AppColors.textPrimary,
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.copy, color: AppColors.iconColor)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.sim_card_alert, color: AppColors.iconColor)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.sim_card, color: AppColors.iconColor)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.sim_card, color: AppColors.iconColor)),
                ],
              ),
            ),

            // Search Bar
            CustomSearchTextField(
              hintText: 'Search contact',
              controller: searchController,
              onChanged: (value) {
                controller.filterContacts(value);
              },
            ),

            // Contacts List
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.permissionDenied.value) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Permission denied', style: TextStyle(fontSize: 18)),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: controller.requestContactPermission,
                          child: const Text('Request Permission'),
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () => openAppSettings(),
                          child: const Text('Open App Settings'),
                        ),
                      ],
                    ),
                  );
                }

                final contactsToShow = controller.filteredContactsList;
                return ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Favorite Button
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.yellowAccent, width: 2),
                                ),
                                child: CircleAvatar(
                                  maxRadius: 25,
                                  foregroundColor: Colors.yellowAccent,
                                  backgroundColor: Colors.black54,
                                  child: IconButton(
                                    onPressed: () {
                                      Get.to(const FavouriteContacts());
                                    },
                                    icon: Icon(Icons.favorite_outlined, color: Colors.yellow[800], size: 35),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text("Add Contacts", style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),

                          // Horizontal Favourite Contacts
                          Obx(() {
                            if (controller.favouriteContacts.isEmpty) {
                              return const SizedBox();
                            }
                            return SizedBox(
                              height: 90,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.favouriteContacts.length,
                                separatorBuilder: (_, __) => const SizedBox(width: 12),
                                itemBuilder: (_, index) {
                                  final fav = controller.favouriteContacts[index];
                                  final name = fav.displayName.isNotEmpty ? fav.displayName : 'Unknown';
                                  final number = fav.phones.isNotEmpty ? fav.phones.first.number : 'Unknown';

                                  return Column(
                                    children: [
                                      CircleAvatar(
                                        radius: 28,
                                        backgroundColor: Colors.grey.shade800,
                                        backgroundImage: fav.photoOrThumbnail != null
                                            ? MemoryImage(fav.photoOrThumbnail!)
                                            : null,
                                        child: fav.photoOrThumbnail == null
                                            ? Text(
                                          name,
                                          style: const TextStyle(color: Colors.white, fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                        )
                                            : null,
                                      ),
                                      const SizedBox(height: 5),
                                      SizedBox(
                                        width: 70,
                                        child: Text(
                                          number,
                                          style: const TextStyle(color: Colors.white, fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            );
                          }),
                        ],
                      ),
                    ),

                    // Contact List
                    if (contactsToShow.isEmpty)
                      const Center(child: Text('No contacts found', style: TextStyle(color: Colors.white)))
                    else
                      ...contactsToShow.map((contact) {
                        final name = contact.displayName.isNotEmpty ? contact.displayName : "Unknown";
                        final phone = contact.phones.isNotEmpty ? contact.phones.first.number : "No Number";

                        return GestureDetector(
                          onTap: () {
                            Get.to(ContactsDetails(
                              username: name,
                              number: phone,
                            ));
                          },
                          child: CustomContactWidget(
                            name: name,
                            phoneNumber: phone,
                            totalCalls: 5,
                            photo: contact.photo,
                          ),
                        );
                      }),
                  ],
                );
              }),
            ),

          ],
        ),
      ),
    );
  }
}
