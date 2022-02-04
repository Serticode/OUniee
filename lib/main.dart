import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:ouniee/config/config.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/menu_controller.dart';
import 'package:ouniee/controllers/navigation_controller.dart';
//import 'package:ouniee/pages/dashboard.dart';
import 'package:ouniee/pages/landing_page.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MenuController());
  Get.put(NavigationController());
  final configurations = Configurations();

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: configurations.apiKey,
          appId: configurations.appId,
          messagingSenderId: configurations.messagingSenderId,
          projectId: configurations.projectId));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "OUniee",
      theme: ThemeData(
          scaffoldBackgroundColor: active.withOpacity(.05),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          })),
      home: const LandingPage(),
    );
  }
}
