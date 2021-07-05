import 'paging.model.dart';

class NotifyOverView {
  NotifyOverView({
    this.notifyOverViewCombine,
    this.message,
    this.status,
    this.totalItems,
    this.clientIp,
  });

  NotifyOverViewCombine? notifyOverViewCombine;
  String? message;
  bool? status;
  int? totalItems;
  String? clientIp;

  factory NotifyOverView.fromJson(Map<String, dynamic> json) => NotifyOverView(
        notifyOverViewCombine: json["data"] == null
            ? null
            : NotifyOverViewCombine.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        totalItems: json["total_items"] == null ? null : json["total_items"],
        clientIp: json["client_ip"] == null ? null : json["client_ip"],
      );
}

class NotifyOverViewCombine {
  NotifyOverViewCombine({
    this.listNoti,
    this.paging,
  });

  List<Notify>? listNoti;
  Paging? paging;

  factory NotifyOverViewCombine.fromJson(Map<String, dynamic> json) =>
      NotifyOverViewCombine(
        listNoti: json["data"] == null
            ? null
            : List<Notify>.from(json["data"].map((x) => Notify.fromJson(x))),
        paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
      );
}

class Notify {
  Notify({
    this.rowNumber,
    this.messageId,
    this.userId,
    this.messageType,
    this.messageTitle,
    this.messageContent,
    this.medId,
    this.articleId,
    this.writeDate,
    this.isPublic,
    this.isRead,
  });

  int? rowNumber;
  String? messageId;
  int? userId;
  String? messageType;
  String? messageTitle;
  String? messageContent;
  dynamic? medId;
  int? articleId;
  DateTime? writeDate;
  bool? isPublic;
  int? isRead;

  factory Notify.fromJson(Map<String, dynamic> json) => Notify(
        rowNumber: json["RowNumber"] == null ? null : json["RowNumber"],
        messageId: json["message_id"] == null ? null : json["message_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        messageType: json["message_type"] == null ? null : json["message_type"],
        messageTitle:
            json["message_title"] == null ? null : json["message_title"],
        messageContent:
            json["message_content"] == null ? null : json["message_content"],
        medId: json["med_id"],
        articleId: json["article_id"] == null ? null : json["article_id"],
        writeDate: json["write_date"] == null
            ? null
            : DateTime.parse(json["write_date"]),
        isPublic: json["is_public"] == null ? null : json["is_public"],
        isRead: json["is_read"] == null ? null : json["is_read"],
      );
}
