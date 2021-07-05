import 'dart:convert';

import 'package:app_mobile_bacsichidinh/models/user.model.dart';
import 'package:app_mobile_bacsichidinh/utils/app_http.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginRepositories {
  final box = GetStorage();
  var apiKey;
  static const url = 'verify/?token=';
  Future<dynamic> fetchUser(token) async {
    // print('${AppHttp.baseUrlDoctor}$url${AppHttp.tokenTemp}');
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      print("apiKey: $apiKey");
      print("url: ${AppHttp.baseUrlDoctor}$url$token");

      final response = await http.get(
        // Uri.parse('${AppHttp.baseUrlDoctor}$url${AppHttp.tokenTemp}'),
        Uri.parse('${AppHttp.baseUrlDoctor}$url$token'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );
      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));

        print("res: ${json.decode(Utf8Codec().decode(response.bodyBytes))}");
        if (res['data'] == null || res['data'] == false) return res['message'];
        return Users.fromJson(res['data']);
      } else {
        return "Tài khoản không tồn tại hoặc bị lỗi.\nVui lòng liên hệ với Doctor Check để được hỗ trợ";
        throw Exception('Failed to load User');
      }
    }
  }
}
