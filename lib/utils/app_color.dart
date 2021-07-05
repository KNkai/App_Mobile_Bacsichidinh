// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xff00556E);
  static const Color second = Color(0xffFDB714);
  static const Color loading = Color(0xff00CCE9);
  static const Color hasSale = Color(0xff97C102);
  static const Color promotionSale = Color(0xffee3335);
  static const Color grey = Color(0xffe5e5e5);
  static const Color ticketNew = Color(0xfff9b514);
  static const Color boldGrey = Color(0xff9b9b9b);
  static const Color white = Colors.white;
  static const Color bgItem = Color(0xffF3F3F3);
  static const Color price = Color(0xffE8760E);

  static LinearGradient backgroundPrimary = LinearGradient(
    colors: [primary, primary.withOpacity(0.5)],
    stops: [0, 0.7],
  );
}
