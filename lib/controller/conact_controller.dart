import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactsController extends GetxController {
  RxList<Contact> contactsList = <Contact>[].obs;
  RxList<Contact> filteredContactsList = <Contact>[].obs;
  RxBool isLoading = true.obs;
  RxBool permissionDenied = false.obs;

  final RxSet<String> favouriteContactIds = <String>{}.obs;
  RxList<Contact> favouriteContacts = <Contact>[].obs;

  @override
  void onInit() {
    super.onInit();
    requestContactPermission();
    loadFavouriteContacts();
  }

  Future<void> requestContactPermission() async {
    final status = await Permission.contacts.request();

    if (status.isGranted) {
      permissionDenied.value = false;
      await fetchContacts();
    } else {
      permissionDenied.value = true;
      isLoading.value = false;
    }
  }

  Future<void> fetchContacts() async {
    try {
      isLoading.value = true;
      final contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,
      );

      contactsList.value = contacts;
      filteredContactsList.value = contacts;
      isLoading.value = false;

      updateFavouriteList();
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(
        'Error',
        'Error fetching contacts: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void filterContacts(String query) {
    final lowerQuery = query.toLowerCase();

    if (lowerQuery.isEmpty) {
      filteredContactsList.value = contactsList;
    } else {
      filteredContactsList.value = contactsList.where((contact) {
        final name = contact.displayName.toLowerCase();
        final matchesName = name.contains(lowerQuery);

        final matchesPhone = contact.phones.any(
              (phone) => phone.number.toLowerCase().contains(lowerQuery),
        );

        return matchesName || matchesPhone;
      }).toList();
    }
  }

  void refresh() {
    isLoading.value = true;
    permissionDenied.value = false;
    requestContactPermission();
  }


  void toggleFavourite(Contact contact) async {
    if (favouriteContactIds.contains(contact.id)) {
      favouriteContactIds.remove(contact.id);
    } else {
      favouriteContactIds.add(contact.id);
    }
    updateFavouriteList();
    saveFavouriteContacts();
  }

  void updateFavouriteList() {
    favouriteContacts.value = contactsList
        .where((contact) => favouriteContactIds.contains(contact.id))
        .toList();
  }


  bool isFavourite(Contact contact) => favouriteContactIds.contains(contact.id);


  Future<void> saveFavouriteContacts() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favourite_ids', favouriteContactIds.toList());
  }


  Future<void> loadFavouriteContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final favIds = prefs.getStringList('favourite_ids') ?? [];
    favouriteContactIds.addAll(favIds);
    updateFavouriteList(); // Update favourite contacts list immediately after loading
  }
}
