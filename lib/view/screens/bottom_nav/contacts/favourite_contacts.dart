import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_test_app/view/utlis/app_color.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../controller/conact_controller.dart';
import '../../../widgets/custom_search_text_fields.dart';

class FavouriteContacts extends StatefulWidget {
  const FavouriteContacts({super.key});

  @override
  State<FavouriteContacts> createState() => _FavouriteContactsState();
}

class _FavouriteContactsState extends State<FavouriteContacts> {
  final ContactsController controller = Get.put(ContactsController());
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: const Text("Add To Favourites"),
      ),
      body: Column(
        children: [
          CustomSearchTextField(
            hintText: 'Search contact',
            controller: searchController,
            onChanged: (value) {
              controller.filterContacts(value);
            },
          ),
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

              if (contactsToShow.isEmpty) {
                return const Center(
                  child: Text('No contacts found', style: TextStyle(color: Colors.white)),
                );
              }

              return ListView.builder(
                itemCount: contactsToShow.length,
                itemBuilder: (context, index) {
                  final contact = contactsToShow[index];
                  final name = contact.displayName.isNotEmpty ? contact.displayName : "Unknown";
                  final phone = contact.phones.isNotEmpty ? contact.phones.first.number : "No Number";

                  return Card(
                    color:Colors.white70,
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(name[0]),
                      ),
                      title: Text(name),
                      subtitle: Text(phone),
                      trailing: Obx(() {
                        final isFav = controller.isFavourite(contact);
                        return IconButton(
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            color: isFav ? Colors.red : Colors.black54,
                          ),
                          onPressed: () {
                            controller.toggleFavourite(contact);
                          },
                        );
                      }),

                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
