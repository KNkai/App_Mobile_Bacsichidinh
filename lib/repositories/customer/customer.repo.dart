import 'dart:convert';
import 'package:app_mobile_bacsichidinh/models/customer.model.dart';
import 'package:app_mobile_bacsichidinh/utils/app_http.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

const registerByDoctorUrl = 'get-customers/?';
const getDoctorCustomerUrl = 'get-doctor-customers/?';

class CustomerRepositories {
  var box = GetStorage();
  var apiKey;
  // Future<CustomerOverview> fetchListCustomer({
  Future<CustomerOverview> fetchListCustomer({
    required int pageNumber,
    required int pageSize,
  }) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      // print('${AppHttp.baseUrlMed}$service');
      print(apiKey);
      print(
          '${AppHttp.baseUrlCustomer}${registerByDoctorUrl}page_number=$pageNumber&page_size=$pageSize');
      final response = await http.get(
        Uri.parse(
            '${AppHttp.baseUrlCustomer}${registerByDoctorUrl}page_number=$pageNumber&page_size=$pageSize'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print(apiKey);
        print("dừng ở đây: $res");
        if (res['data'] is bool)
          return CustomerOverview(
              // return CustomerOverview(
              clientIp: 'client_ip',
              customerOverviewCombine:
                  // customerOverviewCombine:
                  CustomerOverviewCombine(listCustomer: []),
              message: res['message'],
              status: res['status'],
              totalItems: 0);
        return CustomerOverview.fromJson(res);
      } else {
        throw Exception('Failed to load fetchListCustomer');
      }
    } else {
      var abc;
      return abc;
    }
  }

  Future<CustomerOverview> fetchListCustomerSearch({
    required int doctorId,
    required int pageNumber,
    required int pageSize,
    required String keyWord,
  }) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      // print('${AppHttp.baseUrlMed}$service');
      print(apiKey);
      print(
          '${AppHttp.baseUrlCustomer}${getDoctorCustomerUrl}doctor_id=$doctorId&page_number=$pageNumber&page_size=$pageSize&key_word=$keyWord');
      final response = await http.get(
        Uri.parse(
            '${AppHttp.baseUrlCustomer}${getDoctorCustomerUrl}doctor_id=$doctorId&page_number=$pageNumber&page_size=$pageSize&key_word=$keyWord'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print(apiKey);
        print("dừng ở đây: $res");
        if (res['data'] is bool)
          return CustomerOverview(
              // return CustomerOverview(
              clientIp: 'client_ip',
              customerOverviewCombine:
                  // customerOverviewCombine:
                  CustomerOverviewCombine(listCustomer: []),
              message: res['message'],
              status: res['status'],
              totalItems: 0);
        return CustomerOverview.fromJson(res);
      } else {
        throw Exception('Failed to load fetchListCustomer');
      }
    } else {
      var abc;
      return abc;
    }
  }
}
