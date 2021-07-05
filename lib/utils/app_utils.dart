import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'app_color.dart';

String appConvertDateTime(DateTime time, {String format = "dd/MM/yyyy"}) {
  return time == null ? '' : DateFormat(format).format(time.toLocal());
}

// Center kLoadingSpinner = const Center(
//   child: SpinKitCircle(
//     color: Color(0xff008080),
//     size: 50.0,
//   ),
// );

bool appCheckListEmpty(List list) {
  if (list == null) return true;

  return list.isEmpty;
}

snackBarError(String message, {Widget? title}) {
  return Get.snackbar(
    "",
    "",
    duration: Duration(seconds: 3),
    titleText: title == null ? const SizedBox.shrink() : title,
    messageText: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    animationDuration: Duration(milliseconds: 300),
    backgroundColor: Colors.red,
    snackPosition: SnackPosition.BOTTOM,
  );
}

snackBarSuccess(String message, {Widget? title}) {
  return Get.snackbar(
    "",
    "",
    duration: Duration(seconds: 3),
    titleText: title == null ? const SizedBox.shrink() : title,
    messageText: Text(
      message,
      style: TextStyle(color: Colors.white),
    ),
    animationDuration: Duration(milliseconds: 1000),
    backgroundColor: AppColor.primary,
    snackPosition: SnackPosition.BOTTOM,
  );
}

// Get.snackbar(
//         "Chào mừng bạn đã đến với Doctor Check",
//         "Chúc bạn một ngày mới làm việc vui vẻ!",
//         colorText: AppColor.white,
//         backgroundColor: AppColor.primary,
//         duration: Duration(seconds: 2),
//         animationDuration: Duration(milliseconds: 170),
//         snackPosition: SnackPosition.BOTTOM,
//       );

loadMore(List<dynamic> currentList, List<dynamic> listAll) {
  if (listAll.length - currentList.length > 10) {
    currentList.addAll(
        listAll.getRange(currentList.length, currentList.length + 10).toList());
  } else {
    currentList.addAll(listAll.getRange(currentList.length, listAll.length));
  }
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

interpolate(List<String> params) {
  String result = '';
  for (int i = 0; i <= params.length - 1; i++) {
    if (params[i] != '') {
      if (i == params.length - 1) {
        result += "${params[i]}.";
      } else {
        result += "${params[i]}, ";
      }
    }
  }
  if (result.trim() == '') return 'Chưa có địa chỉ';
  return result;
}

String buildBarcode(
  String data, {
  String? filename,
  double? width,
  double? height,
  double? fontHeight,
}) {
  /// Create the Barcode
  Barcode bc = Barcode.code128();
  final svg = bc.toSvg(
    data,
    width: width ?? 200,
    height: height ?? 80,
    fontHeight: fontHeight,
  );
  return svg;
}
