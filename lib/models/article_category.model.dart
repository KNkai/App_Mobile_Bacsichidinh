class ArticleCate {
  ArticleCate({
    this.articleCategoryId,
    this.articleCategoryName,
    this.orderNo,
  });

  int? articleCategoryId;
  String? articleCategoryName;
  int? orderNo;

  factory ArticleCate.fromJson(Map<String, dynamic> json) => ArticleCate(
        articleCategoryId: json["article_category_id"] == null
            ? null
            : json["article_category_id"],
        articleCategoryName: json["article_category_name"] == null
            ? null
            : json["article_category_name"],
        orderNo: json["order_no"] == null ? null : json["order_no"],
      );

  Map<String, dynamic> toJson() => {
        "article_category_id":
            articleCategoryId == null ? null : articleCategoryId,
        "article_category_name":
            articleCategoryName == null ? null : articleCategoryName,
        "order_no": orderNo == null ? null : orderNo,
      };
}
