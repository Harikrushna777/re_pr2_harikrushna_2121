import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:re_pr2_harikrushna_2121/controllers/login_controller.dart';
import 'package:re_pr2_harikrushna_2121/controllers/password_controller.dart';
import 'package:re_pr2_harikrushna_2121/helpers/api_helper.dart';

import '../../helpers/auth_hepler.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  String emailid = "";
  String password = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  PasswordController passwordController = Get.put(
    PasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    FirstLoginController firstLoginController = Get.put(FirstLoginController());

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.blue,
      ),
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
                  "Login Your Account",
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
                ElevatedButton(
                  onPressed: () async {
                    bool login = await FirebaseAuthHelper.firebaseAuthHelper
                        .loginWithUserNamePassword(
                      email: emailid,
                      password: password,
                    );
                    if (login) {
                      Get.toNamed('/home');
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
