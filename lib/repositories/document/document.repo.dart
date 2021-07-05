import 'dart:convert';

import 'package:app_mobile_bacsichidinh/models/article.model.dart';
import 'package:app_mobile_bacsichidinh/models/article_category.model.dart';
import 'package:app_mobile_bacsichidinh/models/article_detail.model.dart';
import 'package:app_mobile_bacsichidinh/utils/app_http.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

const getArticleDetailUrl = 'get-article-detail/?';
const getRegimenDetailUrl = 'get-regimen-detail';
const getArticleCategoriesUrl = 'get-article-categories';
const getRegimenCategoriesUrl = 'get-regimen-categories';
const getArticlesUrl = 'get-articles/?';
const getRegimensUrl = 'get-regimens';

class DocumentRepositories {
  var box = GetStorage();
  var apiKey;

  Future<List<ArticleCate>> fetchAllArticleCate() async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      print('${AppHttp.baseUrlDoc}$getArticleCategoriesUrl');

      final response = await http.get(
        Uri.parse('${AppHttp.baseUrlDoc}$getArticleCategoriesUrl'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        // print("so luong tim thay o day: ${res['data']}");
        if (res['status'] == false) return [];
        return List<ArticleCate>.from(
            res['data'].map((e) => ArticleCate.fromJson(e))).toList();
      } else {
        throw Exception('Failed to load fetchAllArticleCate');
      }
    } else {
      var abc;
      return abc;
    }
  }

  Future<List<Article>> fetchAllArticleByCate(
      {required int doctorId,
      required int cateId,
      required int pageNum,
      required int pageSize}) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      print(
          '${AppHttp.baseUrlDoc}${getArticlesUrl}doctor_id=$doctorId&article_category_id=$cateId&page_number=$pageNum&page_size=$pageSize&key_word=');

      final response = await http.get(
        Uri.parse(
            '${AppHttp.baseUrlDoc}${getArticlesUrl}doctor_id=$doctorId&article_category_id=$cateId&page_number=$pageNum&page_size=$pageSize&key_word='),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print("so luong tim thay o day: ${res['data']}");
        if (res['status'] == false) return [];
        return List<Article>.from(
            res['data']['data'].map((e) => Article.fromJson(e))).toList();
      } else {
        throw Exception('Failed to load fetchAllArticleCate');
      }
    } else {
      var abc;
      return abc;
    }
  }

  Future<ArticleDetail> fetchAllArticleDetailById({
    required int doctorId,
    required int id,
  }) async {
    if (box.read(AppKey.apiKey) != null) {
      apiKey = box.read(AppKey.apiKey);
      print(
          '${AppHttp.baseUrlDoc}${getArticleDetailUrl}doctor_id=$doctorId&id=$id');

      final response = await http.get(
        Uri.parse(
            '${AppHttp.baseUrlDoc}${getArticleDetailUrl}doctor_id=$doctorId&id=$id'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'X-ApiKey': apiKey,
        },
      );

      if (response.statusCode == 200) {
        var res = json.decode(Utf8Codec().decode(response.bodyBytes));
        print("so luong tim thay o day: ${res['data']}");
        if (res['status'] == false)
          return ArticleDetail(articleContent: 'failed');
        return ArticleDetail.fromJson(res['data']['article']);
      } else {
        throw Exception('Failed to load fetchAllArticleCate');
      }
    } else {
      var abc;
      return abc;
    }
  }
}
