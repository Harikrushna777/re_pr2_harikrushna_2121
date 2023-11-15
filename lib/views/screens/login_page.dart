import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:re_pr2_harikrushna_2121/controllers/login_controller.dart';
import 'package:re_pr2_harikrushna_2121/controllers/password_controller.dart';

import '../../helpers/auth_hepler.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  String emailid = "";
  String password = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PasswordController passwordController = Get.put(
    PasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    FirstLoginController firstLoginController = Get.put(FirstLoginController());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(40),
                Container(
                  height: 280,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://media.tenor.com/tkbRMbqhR2UAAAAC/app-online-store.gif"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "E-Commerce App",
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const Gap(10),
                Text(
                  "Crate New Account",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(20),
                TextFormField(
                  initialValue: emailid,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter User Email-ID";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (newValue) {
                    emailid = newValue!;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey.shade50,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    label: Text(
                      "Email-ID",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                Obx(
                  () => TextFormField(
                    initialValue: password,
                    textInputAction: TextInputAction.next,
                    maxLength: 8,
                    obscureText: passwordController.showPassword.value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (value.length != 8) {
                        return "Enter minimum 8 Characters";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      password = newValue!;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey.shade50,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      label: Text(
                        "Password",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          passwordController.changeShow();
                        },
                        icon: const Icon(Icons.remove_red_eye_outlined),
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        bool login = await FirebaseAuthHelper.firebaseAuthHelper
                            .registerUser(
                          email: emailid,
                          password: password,
                        );
                        if (login == true) {
                          Get.toNamed('/home');
                        } else {
                          log("$login");
                        }
                      },
                      child: Text(
                        "Sign In",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed('/sign_up_page');
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Or",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    FirebaseAuthHelper.firebaseAuthHelper.signWithGoogle();
                    Get.toNamed('/home');
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/2702/2702602.png'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () async {
                //     if (formKey.currentState!.validate()) {
                //       formKey.currentState!.save();
                //
                //       // String checkPassword = data?['password'];
                //       // int checkID = data?['emailid'];
                //       // log(checkPassword);
                //     //   if (password == checkPassword &&
                //     //       int.parse(emailid) == checkID) {
                //     //     Get.offNamed(
                //     //       "/HomePage",
                //     //       arguments: int.parse(emailid),
                //     //     );
                //     //   } else {
                //     //     Get.snackbar(
                //     //       "Password or Id",
                //     //       "Id or Password Wrong!!",
                //     //     );
                //     //   }
                //     // } else {
                //     //   Get.snackbar("Failed", "User Can't Axis..");
                //     // }
                //   },
                //   child: Container(
                //     height: s.height * 0.06,
                //     width: s.width * 0.4,
                //     decoration: const BoxDecoration(
                //       color: Color(0xFF27447C),
                //       borderRadius: BorderRadius.all(
                //         Radius.circular(20),
                //       ),
                //     ),
                //     alignment: Alignment.center,
                //     child: Text(
                //       "Submit",
                //       style: GoogleFonts.headlandOne(
                //         fontSize: 22,
                //         color: Colors.white,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
