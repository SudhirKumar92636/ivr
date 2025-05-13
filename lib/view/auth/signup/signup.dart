// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_test_app/view/widgets/custom_buttons.dart';
// import '../../../controller/password_controller.dart';
// import '../../widgets/custom_text_fields.dart';
//
// class SignupScreens extends StatefulWidget {
//   const SignupScreens({super.key});
//
//   @override
//   State<SignupScreens> createState() => _SignupScreensState();
// }
// class _SignupScreensState extends State<SignupScreens> {
//   TextEditingController usernameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   final passwordControllers = Get.put(PasswordController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text("SignUp Screens"),
//           backgroundColor: Colors.blueGrey,
//         ),
//         body:Center(
//           child: SingleChildScrollView(
//             child: Padding(padding: const EdgeInsets.all(10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Image.asset("assets/images/check.png",width: 150, height: 150,),
//                   const SizedBox(height: 10,),
//                   CustomTextField(
//                     hintText: "Enter Your username",
//                     prefixIcon: Icons.person,
//                     controller: usernameController,
//                     keyboardType: TextInputType.text,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your username';
//                       }
//                       return null;
//                     },
//                   ),
//                   CustomTextField(
//                     hintText: "Enter Your phone number",
//                     prefixIcon: Icons.phone,
//                     controller: phoneController,
//                     keyboardType: TextInputType.phone,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your phone number';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10,),
//                   CustomTextField(
//                     hintText: "Enter Your Email",
//                     prefixIcon: Icons.email,
//                     controller: emailController,
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       return null;
//                     },
//                   ),
//                   const SizedBox(height: 10,),
//                   Obx(() => CustomTextField(
//                     hintText: "Enter your password",
//                     prefixIcon: Icons.lock,
//                     controller: passwordController,
//                     obscureText: passwordControllers.obscureText.value,
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         passwordControllers.obscureText.value
//                             ? Icons.visibility_off
//                             : Icons.visibility,
//                       ),
//                       onPressed: () {
//                         passwordControllers.toggleObscure();
//                       },
//                     ),
//                   )),
//                   const SizedBox(height: 20,),
//                   CustomButton(text: "SignUp", onPressed: (){})
//
//                 ],
//               ),),
//           ),
//         )
//
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_test_app/index.dart';
import 'package:new_test_app/view/widgets/custom_buttons.dart';
import '../../../controller/password_controller.dart';
import '../../widgets/custom_text_fields.dart';

class SignupScreens extends StatefulWidget {
  const SignupScreens({super.key});

  @override
  State<SignupScreens> createState() => _SignupScreensState();
}

class _SignupScreensState extends State<SignupScreens> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final passwordControllers = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // App Bar replacement
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xFF303F60),
                        ),
                        onPressed: () => Get.back(),
                      ),
                      const Expanded(
                        child: Text(
                          "Create Account",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF303F60),
                          ),
                        ),
                      ),
                      const SizedBox(width: 40), // for balancing
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                // Logo and welcome text
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/check.png",
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Join Us Today!",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF303F60),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Fill in your details to create an account",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.04),

                // Signup Form
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username field
                      const Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF303F60),
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        hintText: "Enter your username",
                        prefixIcon: Icons.person_outline,
                        controller: usernameController,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Phone number field
                      const Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF303F60),
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        hintText: "Enter your phone number",
                        prefixIcon: Icons.phone_outlined,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Email field
                      const Text(
                        "Email",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF303F60),
                        ),
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        hintText: "Enter your email address",
                        prefixIcon: Icons.email_outlined,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Password field
                      const Text(
                        "Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF303F60),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Obx(() => CustomTextField(
                        hintText: "Create a strong password",
                        prefixIcon: Icons.lock_outline,
                        controller: passwordController,
                        obscureText: passwordControllers.obscureText.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordControllers.obscureText.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.grey[600],
                          ),
                          onPressed: () {
                            passwordControllers.toggleObscure();
                          },
                        ),
                      )),

                      const SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(
                            width: 24,
                            height: 24,
                            child: Checkbox(
                              value: true,
                              activeColor: const Color(0xFF4C6FFF),
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: RichText(
                              text: const TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 14,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Terms of Service",
                                    style: TextStyle(
                                      color: Color(0xFF4C6FFF),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextSpan(text: " and "),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(
                                      color: Color(0xFF4C6FFF),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(IndexScreen());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4C6FFF),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Create Account",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                // Or signup with
                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        "Or signup with",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
                  ],
                ),

                const SizedBox(height: 20),

                // Social signup buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _socialSignupButton(
                      onTap: () {},
                      icon: Icons.g_mobiledata,
                      iconColor: Colors.red,
                    ),
                    const SizedBox(width: 20),
                    _socialSignupButton(
                      onTap: () {},
                      icon: Icons.facebook,
                      iconColor: Colors.blue,
                    ),
                    const SizedBox(width: 20),
                    _socialSignupButton(
                      onTap: () {},
                      icon: Icons.apple,
                      iconColor: Colors.black,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Already have account
                GestureDetector(
                  onTap: () {
                    Get.back(); // Go back to login screen
                  },
                  child: RichText(
                    text: const TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        color: Color(0xFF6B7280),
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "Login",
                          style: TextStyle(
                            color: Color(0xFF4C6FFF),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }


  // Social media login button
  Widget _socialSignupButton({
    required Function() onTap,
    required IconData icon,
    required Color iconColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
      ),
    );
  }
}