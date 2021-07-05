import 'dart:convert';

import 'package:app_mobile_bacsichidinh/models/med_commission.model.dart';
import 'package:app_mobile_bacsichidinh/utils/app_http.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

const getAppointments = 'get-appointments/?';

class BookingRepositories {
  final box = GetStorage();
  var apiKey;

  Future<MedCommissionAll> fetchAppointments(
      {required AppointmentsRequired appointmentsRequired}) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);

      final response = await http.get(
        Uri.parse(
            '${AppHttp.baseUrlMed}${getAppointments}doctor_id=${appointmentsRequired.doctorId}&clinic_id=${appointmentsRequired.clinicId}&med_status_id=${appointmentsRequired.medStatusId}&page_number=${appointmentsRequired.pageNumber}&page_size=${appointmentsRequired.pageSize}&key_word='),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );
      print(
          '${AppHttp.baseUrlMed}${getAppointments}doctor_id=${appointmentsRequired.doctorId}&clinic_id=${appointmentsRequired.clinicId}&med_status_id=${appointmentsRequired.medStatusId}&page_number=${appointmentsRequired.pageNumber}&page_size=${appointmentsRequired.pageSize}&key_word=');

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print("in trong analyticsRepo: $res");
        return MedCommissionAll.fromJson(res);
      } else {
        throw Exception('Failed to load fetchAppointments');
      }
    } else {
      var abc;
      return abc;
    }
  }
}

class AppointmentsRequired {
  final int doctorId;
  final String clinicId;
  final int medStatusId;
  int pageSize;
  int pageNumber;

  AppointmentsRequired({
    required this.doctorId,
    required this.clinicId,
    required this.medStatusId,
    required this.pageSize,
    required this.pageNumber,
  });
}
