import 'package:app_mobile_bacsichidinh/utils/app_http.dart';
import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final Map? data;

  ApiRequest({
    required this.url,
    this.data,
  });

  Dio _dio() {
    // Put your authorization token here
    return Dio(
      BaseOptions(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'X-ApiKey': AppHttp.xApiKey,
        },
      ),
    );
  }

  void get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {
    print(AppHttp.baseUrlDoctor + this.url);
    print(_dio());
    await _dio()
        .get(
      AppHttp.baseUrlDoctor + this.url,
    )
        .then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
