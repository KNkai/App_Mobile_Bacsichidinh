import 'package:app_mobile_bacsichidinh/controllers.dart';
import 'package:app_mobile_bacsichidinh/routes.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:app_mobile_bacsichidinh/utils/app_string.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/auth_binding.dart';
import 'helper/no_splash_factory.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    return GetMaterialApp(
      initialBinding: BindingController(),
      defaultTransition: Transition.rightToLeft,
      title: AppString.TITLEAPP,
      theme: ThemeData(
        splashFactory: const NoSplashFactory(),
        fontFamily: "UTM_Neo_Sans_Intel",
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: AppColor.primary,
            unselectedItemColor: Color(0xff9B9B9B),
            selectedLabelStyle: TextStyle(fontSize: 13.0),
            unselectedLabelStyle: TextStyle(fontSize: 13.0),
            showSelectedLabels: true),
        textTheme: const TextTheme(bodyText2: TextStyle(fontSize: 17)),
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      getPages: route(),
      initialRoute: '/login',
    );
  }
}
