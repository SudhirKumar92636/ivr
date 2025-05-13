import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_test_app/view/widgets/custom_buttons.dart';

class HelpSupportFromScreen extends StatelessWidget {
  const HelpSupportFromScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SimController controller = Get.put(SimController());
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: const Color(0xFF283747),
      appBar: AppBar(
        backgroundColor: const Color(0xFF283747),
        title: const Text('Contact Us', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Obx(() => DropdownButtonFormField(
                isExpanded: true,
                dropdownColor: const Color(0xFF34495E),
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.grey,
                value: controller.selectedSim.value.isEmpty
                    ? null : controller.selectedSim.value,
                decoration: InputDecoration(
                  hintText: 'Select type',
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
                  filled: true,
                  fillColor: const Color(0xFF34495E),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: const TextStyle(color: Colors.white, fontSize: 18),
                items: controller.simOptions.map((sim) {
                  return DropdownMenuItem(
                    value: sim,
                    child: Text(
                      sim,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  controller.selectedSim.value = value ?? '';
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Select Your Type';
                  }
                  return null;
                },
              )),


              const SizedBox(height: 8),
              // Name Field
              TextFormField(
                decoration: InputDecoration(
                  fillColor: const Color(0xFF34495E),
                  filled: true,
                  label: RichText(
                    text: const TextSpan(
                      text: 'Name',
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              // Contact Number Field
              TextFormField(
                decoration: InputDecoration(
                  fillColor: const Color(0xFF34495E),
                  filled: true,
                  label: RichText(
                    text: const TextSpan(
                      text: 'Contact Number',
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your contact number';
                  }
                  if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                    return 'Please enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              // Contact Email Field
              TextFormField(
                decoration: InputDecoration(
                  fillColor: const Color(0xFF34495E),
                  filled: true,
                  label: RichText(
                    text: const TextSpan(
                      text: 'Contact Email',
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              // Country Field
              TextFormField(
                decoration: InputDecoration(
                  fillColor: const Color(0xFF34495E),
                  filled: true,
                  label: RichText(
                    text: const TextSpan(
                      text: 'Country',
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your country';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),
              // Message Field
              TextFormField(
                maxLines: 5,
                decoration: InputDecoration(
                  fillColor: const Color(0xFF34495E),
                  filled: true,
                  label: RichText(
                    text: const TextSpan(
                      text: 'Message',
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blueGrey),
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your message';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              // Submit Button
              CustomButton(
                text: "Submit",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Proceed with the submission
                    Get.snackbar("Success", "Your query has been submitted", backgroundColor: Colors.green, colorText: Colors.white);
                  } else {
                    // If validation fails
                    Get.snackbar("Error", "Please fill all required fields", backgroundColor: Colors.red, colorText: Colors.white);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SimController extends GetxController {
  RxString selectedSim = ''.obs;
  final simOptions = ['Select type','Feedback', 'Report a Bug', 'Inquiry'];
  void onInit() {
    super.onInit();
    if (simOptions.isNotEmpty) {
      selectedSim.value = simOptions[0];
    }
  }
}
