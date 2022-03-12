import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:ouniee/constants/firebase.dart';
import 'package:ouniee/constants/style.dart';
import 'package:ouniee/controllers/auth_controller.dart';
import 'package:ouniee/controllers/menu_controller.dart';
import 'package:ouniee/controllers/navigation_controller.dart';

import 'package:ouniee/controllers/staff_data_controller.dart';
import 'package:ouniee/controllers/submitted_application_controller.dart';
import 'package:ouniee/pages/landing_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
    Get.put(AuthController());
    Get.put(StaffDataController());
    Get.put(SubmittedApplicationsController());
    Get.put(NavigationController());
    Get.put(MenuController());
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "OUniee",
      scrollBehavior: MyCustomScrollBehavior(), // <== add here
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

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
