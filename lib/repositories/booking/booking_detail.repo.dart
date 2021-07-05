import 'dart:convert';

import 'package:app_mobile_bacsichidinh/models/booking_result.model.dart';
import 'package:app_mobile_bacsichidinh/utils/app_http.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

const getMedResult = 'get-meds-result/?';

class BookingDetailRepositories {
  final box = GetStorage();
  var apiKey;

  Future<BookingResultOverView> fetchMedResult(
      {required String customerId, required int doctorId}) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);

      final response = await http.get(
        Uri.parse(
            '${AppHttp.baseUrlMed}${getMedResult}doctor_id=$doctorId&customer_ref_code=$customerId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );
      print(
          '${AppHttp.baseUrlMed}${getMedResult}doctor_id=$doctorId&customer_ref_code=$customerId');

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print("in trong analyticsRepo: ${res['data']['customer']['Ma']}");
        print("in trong analyticsRepo: ${res['data']['results'][0]}");
        return BookingResultOverView.fromJson(res['data']);
      } else {
        throw Exception('Failed to load fetchMedResult');
      }
    } else {
      var abc;
      return abc;
    }
  }
}
