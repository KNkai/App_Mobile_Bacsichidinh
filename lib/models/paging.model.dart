class Paging {
  Paging({
    required this.pageNumber,
    required this.pageSize,
    required this.totalCount,
    required this.totalPage,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  int pageNumber;
  int pageSize;
  int totalCount;
  int totalPage;
  bool hasPreviousPage;
  bool hasNextPage;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        pageNumber: json["page_number"] == null ? null : json["page_number"],
        pageSize: json["page_size"] == null ? null : json["page_size"],
        totalCount: json["total_count"] == null ? null : json["total_count"],
        totalPage: json["total_page"] == null ? null : json["total_page"],
        hasPreviousPage: json["has_previous_page"] == null
            ? null
            : json["has_previous_page"],
        hasNextPage:
            json["has_next_page"] == null ? null : json["has_next_page"],
      );

  Map<String, dynamic> toJson() => {
        "page_number": pageNumber,
        "page_size": pageSize,
        "total_count": totalCount,
        "total_page": totalPage,
        "has_previous_page": hasPreviousPage,
        "has_next_page": hasNextPage,
      };
}
