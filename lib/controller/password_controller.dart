import 'package:get/get.dart';

class PasswordController extends GetxController {
  var obscureText = true.obs;

  void toggleObscure() {
    obscureText.value = !obscureText.value;
  }
}
