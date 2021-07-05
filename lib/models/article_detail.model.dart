class ArticleDetail {
  ArticleDetail({
    this.articleId,
    this.articleCategoryId,
    this.articleCategoryType,
    this.articleCategoryName,
    this.articleTitle,
    this.writeDate,
    this.articleShortContent,
    this.articleContent,
    this.isPublished,
  });

  int? articleId;
  int? articleCategoryId;
  String? articleCategoryType;
  String? articleCategoryName;
  String? articleTitle;
  DateTime? writeDate;
  String? articleShortContent;
  String? articleContent;
  bool? isPublished;

  factory ArticleDetail.fromJson(Map<String, dynamic> json) => ArticleDetail(
        articleId: json["article_id"] == null ? null : json["article_id"],
        articleCategoryId: json["article_category_id"] == null
            ? null
            : json["article_category_id"],
        articleCategoryType: json["article_category_type"] == null
            ? null
            : json["article_category_type"],
        articleCategoryName: json["article_category_name"] == null
            ? null
            : json["article_category_name"],
        articleTitle:
            json["article_title"] == null ? null : json["article_title"],
        writeDate: json["write_date"] == null
            ? null
            : DateTime.parse(json["write_date"]),
        articleShortContent: json["article_short_content"] == null
            ? null
            : json["article_short_content"],
        articleContent:
            json["article_content"] == null ? null : json["article_content"],
        isPublished: json["is_published"] == null ? null : json["is_published"],
      );
}
