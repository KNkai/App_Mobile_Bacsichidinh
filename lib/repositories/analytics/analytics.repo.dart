import 'dart:convert';

import 'package:app_mobile_bacsichidinh/models/med_affiliate_report.model.dart';
import 'package:app_mobile_bacsichidinh/models/med_commission.model.dart';
import 'package:app_mobile_bacsichidinh/utils/app_http.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AnalyticRepositories {
  final box = GetStorage();
  var apiKey;
  static const getMedCommissionsUrl = 'get-med-commissions/?';
  static const getMedAffiliateReportUrl = 'get-med-affiliate-report/?';
  Future<MedCommissionAll> fetchMedCommissions(
      {required MedCommissionModelRequired medCommissionModelRequired}) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);

      final response = await http.get(
        Uri.parse(
            '${AppHttp.baseUrlDoctor}${getMedCommissionsUrl}doctor_id=${medCommissionModelRequired.doctorId}&clinic_id=${medCommissionModelRequired.clinicId}&commission_type=${medCommissionModelRequired.commissionType}&start_date=${medCommissionModelRequired.startDate}&end_date=${medCommissionModelRequired.endDate}&page_number=${medCommissionModelRequired.pageNumber}&page_size=${medCommissionModelRequired.pageSize}&key_word='),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print("in trong analyticsRepo: $res");
        return MedCommissionAll.fromJson(res);
      } else {
        throw Exception('Failed to load fetchMedCommissions');
      }
    } else {
      var abc;
      return abc;
    }
  }

  Future<MedAffiliateReport> fetchMedAffiliateReport(
      {required int doctorId}) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      final response = await http.get(
        Uri.parse(
            '${AppHttp.baseUrlDoctor}${getMedAffiliateReportUrl}doctor_id=$doctorId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print(res);
        return MedAffiliateReport.fromJson(res);
      } else {
        throw Exception('Failed to load fetchMedAffiliateReport');
      }
    } else {
      var abc;
      return abc;
    }
  }
}

class MedCommissionModelRequired {
  final int doctorId;
  final String clinicId;
  final int commissionType;
  final String startDate;
  final String endDate;
  int pageSize;
  int pageNumber;

  MedCommissionModelRequired({
    required this.doctorId,
    required this.clinicId,
    required this.commissionType,
    required this.startDate,
    required this.endDate,
    required this.pageSize,
    required this.pageNumber,
  });
}
