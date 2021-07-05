class SuccessReg {
  SuccessReg({
    this.infoSuccessReg,
    this.message,
    this.status,
    this.clientIp,
  });

  InfoSuccessReg? infoSuccessReg;
  String? message;
  bool? status;
  String? clientIp;

  factory SuccessReg.fromJson(Map<String, dynamic> json) => SuccessReg(
        infoSuccessReg:
            json["data"] == null ? null : InfoSuccessReg.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        clientIp: json["client_ip"] == null ? null : json["client_ip"],
      );
}

class InfoSuccessReg {
  InfoSuccessReg({
    this.medId,
    this.customerId,
    this.clinicId,
    this.packageId,
    this.medTypeId,
    this.medChandoan,
    this.medLydoKham,
    this.medBookingSourceId,
    this.affiliateDoctorsId,
    this.affiliateDoctorsNote,
    this.bookingDate,
    this.bookingNote,
    this.receptionNote,
    this.visitDate,
    this.medStatusId,
    this.medCancelReason,
    this.writeDate,
    this.affiliateDoctorsIsPayment,
    this.isExam,
  });

  String? medId;
  int? customerId;
  int? clinicId;
  dynamic? packageId;
  int? medTypeId;
  String? medChandoan;
  String? medLydoKham;
  int? medBookingSourceId;
  int? affiliateDoctorsId;
  String? affiliateDoctorsNote;
  DateTime? bookingDate;
  String? bookingNote;
  dynamic? receptionNote;
  DateTime? visitDate;
  int? medStatusId;
  dynamic? medCancelReason;
  DateTime? writeDate;
  bool? affiliateDoctorsIsPayment;
  bool? isExam;

  factory InfoSuccessReg.fromJson(Map<String, dynamic> json) => InfoSuccessReg(
        medId: json["med_id"] == null ? null : json["med_id"],
        customerId: json["customer_id"] == null ? null : json["customer_id"],
        clinicId: json["clinic_id"] == null ? null : json["clinic_id"],
        packageId: json["package_id"],
        medTypeId: json["med_type_id"] == null ? null : json["med_type_id"],
        medChandoan: json["med_chandoan"] == null ? null : json["med_chandoan"],
        medLydoKham: json["med_lydo_kham"],
        medBookingSourceId: json["med_booking_source_id"] == null
            ? null
            : json["med_booking_source_id"],
        affiliateDoctorsId: json["affiliate_doctors_id"] == null
            ? null
            : json["affiliate_doctors_id"],
        affiliateDoctorsNote: json["affiliate_doctors_note"] == null
            ? null
            : json["affiliate_doctors_note"],
        bookingDate: json["booking_date"] == null
            ? null
            : DateTime.parse(json["booking_date"]),
        bookingNote: json["booking_note"] == null ? null : json["booking_note"],
        receptionNote: json["reception_note"],
        visitDate: json["visit_date"] == null
            ? null
            : DateTime.parse(json["visit_date"]),
        medStatusId:
            json["med_status_id"] == null ? null : json["med_status_id"],
        medCancelReason: json["med_cancel_reason"],
        writeDate: json["write_date"] == null
            ? null
            : DateTime.parse(json["write_date"]),
        affiliateDoctorsIsPayment: json["affiliate_doctors_is_payment"] == null
            ? null
            : json["affiliate_doctors_is_payment"],
        isExam: json["is_exam"] == null ? null : json["is_exam"],
      );
}
