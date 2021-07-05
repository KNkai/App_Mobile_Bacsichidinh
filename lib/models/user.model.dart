class Users {
  Users({
    required this.doctorId,
    this.doctorRefCode,
    required this.firebaseUid,
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.email,
    this.fullname,
    this.avatarPath,
    this.messageUnreadCount,
    required this.status,
  });

  int doctorId;
  String? doctorRefCode;
  String firebaseUid;
  String username;
  String password;
  String phoneNumber;
  String email;
  String? fullname;
  String? avatarPath;
  int? messageUnreadCount;
  String status;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        doctorId: json["doctor_id"] == null ? null : json["doctor_id"],
        doctorRefCode:
            json["doctor_ref_code"] == null ? null : json["doctor_ref_code"],
        firebaseUid: json["firebase_uid"] == null ? null : json["firebase_uid"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        email: json["email"] == null ? null : json["email"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        avatarPath: json["avatar_path"] == null ? null : json["avatar_path"],
        messageUnreadCount: json["message_unread_count"] == null
            ? null
            : json["message_unread_count"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "doctor_id": doctorId,
        "doctor_ref_code": doctorRefCode == null ? null : doctorRefCode,
        "firebase_uid": firebaseUid,
        "username": username,
        "password": password,
        "phone_number": phoneNumber,
        "email": email,
        "fullname": fullname == null ? null : fullname,
        "avatar_path": avatarPath == null ? null : avatarPath,
        "message_unread_count":
            messageUnreadCount == null ? null : messageUnreadCount,
        "status": status,
      };
}
