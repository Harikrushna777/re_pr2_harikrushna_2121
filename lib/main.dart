// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:re_pr2_harikrushna_2121/controllers/login_controller.dart';
// import 'package:re_pr2_harikrushna_2121/firebase_options.dart';
import 'package:re_pr2_harikrushna_2121/views/screens/cartpage.dart';
import 'package:re_pr2_harikrushna_2121/views/screens/detailpage.dart';
import 'package:re_pr2_harikrushna_2121/views/screens/favorite_page.dart';
import 'package:re_pr2_harikrushna_2121/views/screens/homepage.dart';
import 'package:re_pr2_harikrushna_2121/views/screens/image_page.dart';
import 'package:re_pr2_harikrushna_2121/views/screens/login_page.dart';
import 'package:re_pr2_harikrushna_2121/views/screens/sign_up_page.dart';
import 'package:re_pr2_harikrushna_2121/views/screens/splash_screen.dart';

import 'controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding
  await Firebase.initializeApp(
    option: DefaultFirebaseOptions.currentPlatform,
  )
  runApp(const MyApp());
}

FirstLoginController firstTimeCheck = Get.put(FirstLoginController());
final ThemeController themeController = Get.put(ThemeController());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: themeController.models.theme.value
            ? Brightness.light
            : Brightness.dark,
      ),
      initialRoute: '/splash_screen',
      getPages: [
        GetPage(
          name: '/splash_screen',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/login_page',
          page: () => LoginPage(),
        ),
        GetPage(
          name: '/sign_up_page',
          page: () => SignUpPage(),
        ),
        GetPage(
          name: '/home',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/detail_page',
          page: () => DetailPage(),
        ),
        GetPage(
          name: '/image_page',
          page: () => const ImagePage(),
        ),
        GetPage(
          name: '/cart_page',
          page: () => CartPage(),
        ),
        GetPage(
          name: '/favorite_page',
          page: () => FavoritePage(),
        ),
      ],
    );
  }
}
