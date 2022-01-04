import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:ouniee/controllers/menu_controller.dart';
import 'package:ouniee/controllers/navigation_controller.dart';
import 'package:ouniee/pages/dashboard.dart';
import 'package:ouniee/pages/landing_page.dart';

void main() {
  Get.put(MenuController());
  Get.put(NavigationController());
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
          scaffoldBackgroundColor: const Color(0xFFADA5A0).withAlpha(60),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          })),
      home: const LandingPage(), //Dashboard(),
    );
  }
}
