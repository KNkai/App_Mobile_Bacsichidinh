import 'package:app_mobile_bacsichidinh/models/paging.model.dart';

class ArticleOverview {
  ArticleOverview({
    this.articleCombineOverview,
    this.message,
    this.status,
    this.totalItems,
    this.clientIp,
  });

  ArticleCombineOverview? articleCombineOverview;
  String? message;
  bool? status;
  int? totalItems;
  String? clientIp;

  factory ArticleOverview.fromJson(Map<String, dynamic> json) =>
      ArticleOverview(
        articleCombineOverview: json["data"] == null
            ? null
            : ArticleCombineOverview.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        totalItems: json["total_items"] == null ? null : json["total_items"],
        clientIp: json["client_ip"] == null ? null : json["client_ip"],
      );
}

class ArticleCombineOverview {
  ArticleCombineOverview({
    this.listArticle,
    this.paging,
  });

  List<Article>? listArticle;
  Paging? paging;

  factory ArticleCombineOverview.fromJson(Map<String, dynamic> json) =>
      ArticleCombineOverview(
        listArticle: json["data"] == null
            ? null
            : List<Article>.from(json["data"].map((x) => Article.fromJson(x))),
        paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
      );
}

class Article {
  Article({
    this.rowNumber,
    this.articleId,
    this.articleCategoryId,
    this.articleTitle,
    this.articleShortContent,
    this.writeDate,
    this.createDate,
    this.isPublished,
    this.isRead,
  });

  int? rowNumber;
  int? articleId;
  int? articleCategoryId;
  String? articleTitle;
  String? articleShortContent;
  DateTime? writeDate;
  DateTime? createDate;
  bool? isPublished;
  int? isRead;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        rowNumber: json["RowNumber"] == null ? null : json["RowNumber"],
        articleId: json["article_id"] == null ? null : json["article_id"],
        articleCategoryId: json["article_category_id"] == null
            ? null
            : json["article_category_id"],
        articleTitle:
            json["article_title"] == null ? null : json["article_title"],
        articleShortContent: json["article_short_content"] == null
            ? null
            : json["article_short_content"],
        writeDate: json["write_date"] == null
            ? null
            : DateTime.parse(json["write_date"]),
        createDate: json["create_date"] == null
            ? null
            : DateTime.parse(json["create_date"]),
        isPublished: json["is_published"] == null ? null : json["is_published"],
        isRead: json["is_read"] == null ? null : json["is_read"],
      );
}
