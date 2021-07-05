import 'dart:convert';

import 'package:app_mobile_bacsichidinh/utils/app_http.dart';
import 'package:dio/dio.dart' as d;

class AppClient {
  AppClient._();
  static final AppClient instance = AppClient._();

  d.Dio? _dio;

  void init() {
    _dio = d.Dio(d.BaseOptions(
      baseUrl: AppHttp.baseUrlDoctor,
      connectTimeout: 70000,
    ));
    // install later
  }

  void installToken({required String xToken}) {
    // _dio!.options.headers['x-token'] = xToken;
    // _dio!.options.headers['content-Type'] = 'application/json';
    // _dio!.options.headers["Accept"] = "application/json";
    // _dio!.options.headers['X-ApiKey'] = AppHttp.xApiKey;

    _dio!.options = d.BaseOptions(headers: {
      'content-Type': 'application/json',
      "Accept": "application/json",
      "charset": "utf-8",
      'X-ApiKey': AppHttp.xApiKey,
    });
  }

  void unInstallToken() {
    _dio!.options.headers['X-ApiKey'] = null;
  }

  bool checkExistToken() => _dio!.options.headers['x-token'] != null;
  String showToken() => _dio!.options.headers['x-token'];

  // Future<Response> execute(String query, String typeApi,
  //     {Map<String, dynamic> variables}) async {
  //   return await _post({
  //     'variables': variables == null ? {} : jsonEncode(variables),
  //     'query': query
  //   }, _dio, baseUrlDoctor + typeApi)
  //       .first;
  // }

  Future<Response> execute(String typeApi,
      {Map<String, dynamic>? variables}) async {
    var dio = d.Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers["charset"] = "utf-8";
    dio.options.headers['X-ApiKey'] = AppHttp.xApiKey;
    // dio.options = d.BaseOptions(headers: {
    //   'content-Type': 'application/json',
    //   "Accept": "application/json",
    //   "charset": "utf-8",
    //   'X-ApiKey': AppHttp.xApiKey,
    // });
    return await _get(dio, AppHttp.baseUrlDoctor + typeApi).first;
  }

  Future<Response> executeWithError(String query,
      {Map<String, dynamic>? variables}) async {
    return await _postError({
      'variables': variables == null ? {} : jsonEncode(variables),
      'query': query
    }, _dio!)
        .first;
  }

  Stream<Response> _postError(dynamic body, d.Dio dio) async* {
    final httpResponse = await dio.post("", data: body);

    Response response;

    try {
      response = Response(
          data: httpResponse.data['data'] as Map<String, dynamic>,
          errors: httpResponse.data['errors'] != null
              ? (httpResponse.data['errors'] as List)
                  .map((e) => GraphQLError(message: e['message']))
                  .toList()
              : null);
    } catch (e) {
      throw Exception("Parser exception in _postError function class Api");
    }

    yield Response(
      errors: response.errors,
      data: response.data,
    );
  }

  Stream<Response> _get(d.Dio dio, String url) async* {
    print(url);
    // var dios = d.Dio();
    // final httpResponse = await dios.get(url);
    final httpResponse = await dio.get(url);

    Response response;

    try {
      response = Response(data: httpResponse.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception("Parser exception in _get function class Api + $e");
    }

    yield Response(
      data: response.data,
    );
  }
  // Stream<Response> _post(dynamic body, d.Dio dio, String url) async* {
  //   // print(url);
  //   // var dios = d.Dio();
  //   // final httpResponse = await dios.get(url);
  //   final httpResponse = await dio.post(url, data: body);

  //   Response response;

  //   try {
  //     response =
  //         Response(data: httpResponse.data['data'] as Map<String, dynamic>);
  //   } catch (e) {
  //     throw Exception("Parser exception in _post function class Api");
  //   }

  //   yield Response(
  //     data: response.data,
  //   );
  // }
}

class Response {
  final List<GraphQLError>? errors;

  final Map<String, dynamic>? data;

  const Response({
    this.errors,
    this.data,
  });
}

class GraphQLError {
  final String message;

  GraphQLError({required this.message});
}
