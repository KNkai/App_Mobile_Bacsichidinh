import 'package:app_mobile_bacsichidinh/pages/splash_screen/spalsh_screen.page.dart';
import 'package:app_mobile_bacsichidinh/pages/wallthrought/wallthrought.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'components/app_navbar.dart';

route() => [
      GetPage(name: '/', page: () => AppNavBar()),
      GetPage(name: '/login', page: () => SplashScreenPage()),
      GetPage(
          name: '/wallthrough',
          page: () => WallthroughtPage(),
          transition: Transition.cupertino),
    ];
