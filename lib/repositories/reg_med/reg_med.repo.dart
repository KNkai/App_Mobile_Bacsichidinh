import 'dart:convert';

import 'package:app_mobile_bacsichidinh/models/appoint_med_reg.model.dart';
import 'package:app_mobile_bacsichidinh/models/customer.model.dart';
import 'package:app_mobile_bacsichidinh/models/group_service.model.dart';
import 'package:app_mobile_bacsichidinh/models/med_services.model.dart';
import 'package:app_mobile_bacsichidinh/models/success_reg.model.dart';
import 'package:app_mobile_bacsichidinh/utils/app_http.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

const listMatchCustomers = 'list-match-customers';
const createCustomers = 'create-customer';
const groupService = 'get-groups/?cls=true';
const service = 'get-group-services/?group_id=';
const getAppointRegMed = 'get-appointment-med-reg/?';
const registerByDoctorUrl = 'register-by-doctor';

class RegMedRepositories {
  var box = GetStorage();
  var apiKey;
  Future<List<Customer>> fetchListMatchCustomers({
    // Future<List<Customer>> fetchListMatchCustomers({
    required String fullName,
    required int age,
  }) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      print('${AppHttp.baseUrlCustomer}$listMatchCustomers');

      final response = await http.post(
        Uri.parse('${AppHttp.baseUrlCustomer}$listMatchCustomers'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
        body: json.encode({"fullname": "$fullName", "bithday_year": age}),
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print("so luong tim thay o day: $res");
        print("so luong tim thay o day: ${res['total_items']}");
        if (res['total_items'] == 0 || res['total_items'] == null) return [];
        return List<Customer>.from(res['data'].map((e) => Customer.fromJson(e)))
            .toList();
        // return List<Customer>.from(res['data'].map((e) => Customer.fromJson(e)))
        //     .toList();
      } else {
        throw Exception('Failed to load fetchMedAffiliateReport');
      }
    } else {
      var abc;
      return abc;
    }
  }

  Future<Customer> fetchRegCustomer({
    // Future<Customer> fetchRegCustomer({
    required Customer customer,
    // required Customer customer,
    required int doctorId,
  }) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      print('${AppHttp.baseUrlCustomer}$createCustomers');
      print('${customer.gioiTinh.toString().split('.')[1]}');
      print('$doctorId');
      print('${customer.hoTen}');
      print('${customer.namSinh}');

      final response = await http.post(
        Uri.parse('${AppHttp.baseUrlCustomer}$createCustomers'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
        body: json.encode({
          "doctor_id": doctorId,
          "fullname": customer.hoTen,
          "bithday_year": customer.namSinh,
          "bithday_day": 1,
          "bithday_month": 1,
          "phone": "",
          "c_address": "",
          "country_code": "",
          "province_id": "",
          "district_id": "",
          "ward_id": "",
          "gender_id": "${customer.gioiTinh.toString().split('.')[1]}",
          "nation_id": "",
          "career_id": "",
          "marital_status_id": "",
          "dependent_name": "",
          "dependent_relative": "",
          "dependent_phone": "",
          "id_card": "",
          "email": ""
        }),
        // body: json.encode({
        //   "doctor_id": doctorId,
        //   "id_card": "",
        //   "DienThoai": "${customer.dienThoai}",
        //   "HoTen": "${customer.hoTen}",
        //   "c_address": "",
        //   "country_code": "",
        //   "province_id": "",
        //   "district_id": "",
        //   "ward_id": "",
        //   "nation_id": 0,
        //   "gender_id": customer.gioiTinh,
        //   "career_id": 0,
        //   "marital_status_id": 0,
        //   "blood_group_id": 0,
        //   "customer_dependent_type_id": 0,
        //   "customer_dependent_person": "",
        //   "bithday_year": customer.bithdayYear,
        //   "email": ""
        // }),
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print("thong tin get ve: ${res}");
        return Customer.fromJson(res['data']);
      } else {
        throw Exception('Failed to load fetchRegCustomer');
      }
    } else {
      var abc;
      return abc;
    }
  }

  Future<List<GroupService>> fetchGroupServices() async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      // print('${AppHttp.baseUrlMed}$groupService');

      final response = await http.get(
        Uri.parse('${AppHttp.baseUrlMed}$groupService'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        // print(apiKey);
        // print("so luong tim thay: ${res['data']}");
        if (res['data'] == 0) return [];
        print("in ra gropu service: $res");
        return List<GroupService>.from(
            res['data'].map((e) => GroupService.fromJson(e))).toList();
      } else {
        throw Exception('Failed to load fetchGroupServices');
      }
    } else {
      var abc;
      return abc;
    }
  }

  Future<List<MedService>> fetchServicesById(String id) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      // print('${AppHttp.baseUrlMed}$service');

      final response = await http.get(
        Uri.parse(
            '${AppHttp.baseUrlMed}$service$id&affiliate=true&package=false&cls=true'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print(apiKey);
        // print("so luong tim thay: ${res['data']['services']}");
        if (res['data']['services'] == 0) return [];
        return List<MedService>.from(
                res['data']['services'].map((e) => MedService.fromJson(e)))
            .toList();
      } else {
        throw Exception('Failed to load fetchServicesById');
      }
    } else {
      var abc;
      return abc;
    }
  }

  Future<AppointMedRed> fetchAppointRegMed({
    required int doctorId,
    required String customerBarcode,
  }) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      // print('${AppHttp.baseUrlMed}$service');

      final response = await http.get(
        Uri.parse(
            '${AppHttp.baseUrlMed}${getAppointRegMed}doctor_id=$doctorId&customer_ref_code=$customerBarcode'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print(apiKey);
        return AppointMedRed.fromJson(res);
      } else {
        throw Exception('Failed to load fetchAppointRegMed');
      }
    } else {
      var abc;
      return abc;
    }
  }

  Future<SuccessReg> registerByDoctor({
    required int doctorId,
    required int clinicId,
    required String doctorName,
    // required int customerId,
    required String medChanDoan,
    required String bookingNote,
    required List<String> serviceIds,
    required String customerRefCode,
  }) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      // print('${AppHttp.baseUrlMed}$service');
      print(reFormatDoctorId(serviceIds));
      final response = await http.post(
        Uri.parse('${AppHttp.baseUrlMed}$registerByDoctorUrl'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
        body: json.encode({
          "doctor_id": doctorId,
          "doctor_name": doctorName,
          "clinic_id": clinicId,
          "customer_ref_code": customerRefCode,
          "med_chandoan": "$medChanDoan",
          "booking_note": "$bookingNote",
          "service_ids": "${reFormatDoctorId(serviceIds)}",
          "booking_date_time": DateTime.now().add(Duration(days: 1)).toString()
        }),
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print(apiKey);
        return SuccessReg.fromJson(res);
      } else {
        throw Exception(
            'Failed to load fetchAppointRegMed ${response.statusCode}');
      }
    } else {
      var abc;
      return abc;
    }
  }
}

String reFormatDoctorId(List<String> listServicesId) {
  String result = '';
  listServicesId.forEach((e) {
    if (e == listServicesId.last) {
      result += "$e";
    } else {
      result += "$e, ";
    }
  });
  return result;
}
