import 'dart:convert';

import 'package:app_mobile_bacsichidinh/models/notify.model.dart';
import 'package:app_mobile_bacsichidinh/models/paging.model.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_http.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

const getMessage = 'get-messages/?';

class NotificationRepositorie {
  var box = GetStorage();
  var apiKey;

  final HomeController homeController = Get.find();

  Future<NotifyOverView> fetchNotiByType({
    required String messageType,
    int pageNumber = 1,
    int pageSize = 10,
  }) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);

      // print('${AppHttp.baseUrlMed}$service');

      final response = await http.get(
        Uri.parse(
            '${AppHttp.baseUrlDoctor}${getMessage}doctor_id=${homeController.currentUser!.doctorId}&message_type=$messageType&page_number=$pageNumber&page_size=$pageSize&key_word='),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        // if (messageType == "ARTICLE") print(res);
        print("total :${res['total_items']}");
        print(apiKey);
        if (res['total_items'] == 0) {
          if (messageType == "ARTICLE") print("total :${res['total_items']}");

          return NotifyOverView(
              clientIp: res['client_ip'],
              message: res['message'],
              notifyOverViewCombine: NotifyOverViewCombine(
                paging: Paging.fromJson(res['data']['paging']),
                listNoti: [],
              ),
              status: res['status'],
              totalItems: res['total_items']);
        }
        return NotifyOverView.fromJson(res);
      } else {
        throw Exception('Failed to load fetchAppointRegMed');
      }
    } else {
      var abc;
      return abc;
    }
  }
}
