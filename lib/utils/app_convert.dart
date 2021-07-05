import 'package:intl/intl.dart';

class AppConvert {
  static var oCcy = new NumberFormat("#,##0VNĐ");
}

List<List<T>> chunk<T>(List<T>? array, int size) {
  List<List<T>> chunks = [];
  if (array != null)
    for (var i = 0; i < array.length; i += size) {
      chunks.add(
          array.sublist(i, i + size > array.length ? array.length : i + size));
    }
  return chunks;
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.inCaps).join(" ");
}

String appCurrency(num? money) {
  if (money == null) return 'VNĐ';
  if (money is double) money = money.toInt();
  if (money == 0) return '0 VNĐ';
  if (money <= 999) return '$money VNĐ';
  return NumberFormat('##,000 VNĐ').format(money);
}
