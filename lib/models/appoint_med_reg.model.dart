import 'customer.model.dart';
import 'med_services.model.dart';

class AppointMedRed {
  AppointMedRed({
    this.appointMedRedCombine,
    this.message,
    this.status,
    this.clientIp,
  });

  AppointMedRedCombine? appointMedRedCombine;
  String? message;
  bool? status;
  String? clientIp;

  factory AppointMedRed.fromJson(Map<String, dynamic> json) => AppointMedRed(
        appointMedRedCombine: json["data"] == null
            ? null
            : AppointMedRedCombine.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        clientIp: json["client_ip"] == null ? null : json["client_ip"],
      );
}

class AppointMedRedCombine {
  AppointMedRedCombine({
    this.customer,
    this.med,
    this.medServices,
    this.isAllowModifyCustomer,
  });

  // Customer? customer;
  Customer? customer;
  MedNew? med;
  List<MedService>? medServices;
  bool? isAllowModifyCustomer;

  factory AppointMedRedCombine.fromJson(Map<String, dynamic> json) =>
      AppointMedRedCombine(
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        med: json["med"] == null ? null : MedNew.fromJson(json["med"]),
        medServices: json["med_services"] == null
            ? null
            : List<MedService>.from(
                json["med_services"].map((x) => MedService.fromJson(x))),
        isAllowModifyCustomer: json["is_allow_modify_customer"] == null
            ? null
            : json["is_allow_modify_customer"],
      );
}

class Meds {
  Meds({
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
  dynamic? medLydoKham;
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

  factory Meds.fromJson(Map<String, dynamic> json) => Meds(
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

class MedNew {
  MedNew({
    this.soVaoVien,
    this.maBn,
    this.ngay,
    this.doiTuong,
    this.lydoVv,
    this.chanDoanChinh,
    this.chanDoanPhu,
    this.chanDoanKhac,
    this.tgVao,
    this.tgRa,
    this.loaiVv,
    this.tongChiPhi,
    this.tongThu,
    this.tongTamUng,
    this.tamUng,
    this.giam,
    this.ghiChu,
    this.bsDieutri,
    this.khoaPhongDk,
    this.nguoiDangKy,
    this.masterId2,
    this.trangThai,
    this.ngayCapNhat,
    this.tienDichVuChuaThu,
    this.tienThuocChuaThu,
    this.trangThaiThu,
    this.saThai,
    this.soTuoiThai,
    this.loaiTgTinhThai,
    this.ngayKinhCuoi,
    this.ngayDuSanh,
    this.coBhyt,
    this.tienDichVuBhytChuaThu,
    this.tienThuocBhytChuaThu,
    this.stt,
    this.nghiHuongBhxh,
    this.nghiHuongBhxhDonVi,
    this.nghiHuongBhxhLyDo,
    this.nghiHuongBhxhNgayBd,
    this.nghiHuongBhxhNgayKt,
    this.nghiHuongBhxhSoNgay,
    this.nghiHuongBhxhSoSeri,
    this.nghiHuongBhxhGhiChu,
    this.nghiHuongBhxhHoTenCha,
    this.nghiHuongBhxhHoTenMe,
    this.nghiHuongBhxhTrangThai,
    this.nghiHuongBhxhQuyen,
    this.nghiHuongBhxhKyHieu,
    this.vip,
    this.trieuChung,
    this.hoiChuan,
    this.dienBienBenh,
    this.hourDate,
    this.minuteDate,
    this.packageId,
    this.package,
    this.endDate,
    this.clinicId,
    this.doctorId,
    this.ngayBacSiChiDinh,
    this.bacSiChiDinhGhiChu,
    this.daChiHoaHongBscd,
    this.active,
    this.medTrangThai,
  });

  String? soVaoVien;
  String? maBn;
  DateTime? ngay;
  String? doiTuong;
  String? lydoVv;
  String? chanDoanChinh;
  String? chanDoanPhu;
  String? chanDoanKhac;
  DateTime? tgVao;
  DateTime? tgRa;
  String? loaiVv;
  double? tongChiPhi;
  double? tongThu;
  double? tongTamUng;
  double? tamUng;
  double? giam;
  String? ghiChu;
  dynamic? bsDieutri;
  dynamic? khoaPhongDk;
  String? nguoiDangKy;
  dynamic? masterId2;
  String? trangThai;
  String? ngayCapNhat;
  double? tienDichVuChuaThu;
  double? tienThuocChuaThu;
  int? trangThaiThu;
  bool? saThai;
  double? soTuoiThai;
  String? loaiTgTinhThai;
  dynamic? ngayKinhCuoi;
  dynamic? ngayDuSanh;
  bool? coBhyt;
  double? tienDichVuBhytChuaThu;
  double? tienThuocBhytChuaThu;
  int? stt;
  dynamic? nghiHuongBhxh;
  dynamic? nghiHuongBhxhDonVi;
  dynamic? nghiHuongBhxhLyDo;
  dynamic? nghiHuongBhxhNgayBd;
  dynamic? nghiHuongBhxhNgayKt;
  dynamic? nghiHuongBhxhSoNgay;
  dynamic? nghiHuongBhxhSoSeri;
  dynamic? nghiHuongBhxhGhiChu;
  dynamic? nghiHuongBhxhHoTenCha;
  dynamic? nghiHuongBhxhHoTenMe;
  dynamic? nghiHuongBhxhTrangThai;
  dynamic? nghiHuongBhxhQuyen;
  dynamic? nghiHuongBhxhKyHieu;
  bool? vip;
  dynamic? trieuChung;
  dynamic? hoiChuan;
  dynamic? dienBienBenh;
  dynamic? hourDate;
  dynamic? minuteDate;
  dynamic? packageId;
  dynamic? package;
  DateTime? endDate;
  int? clinicId;
  int? doctorId;
  DateTime? ngayBacSiChiDinh;
  String? bacSiChiDinhGhiChu;
  bool? daChiHoaHongBscd;
  String? active;
  String? medTrangThai;

  factory MedNew.fromJson(Map<String, dynamic> json) => MedNew(
        soVaoVien: json["SoVaoVien"] == null ? null : json["SoVaoVien"],
        maBn: json["MaBN"] == null ? null : json["MaBN"],
        ngay: json["Ngay"] == null ? null : DateTime.parse(json["Ngay"]),
        doiTuong: json["DoiTuong"] == null ? null : json["DoiTuong"],
        lydoVv: json["LydoVV"] == null ? null : json["LydoVV"],
        chanDoanChinh:
            json["ChanDoanChinh"] == null ? null : json["ChanDoanChinh"],
        chanDoanPhu: json["ChanDoanPhu"] == null ? null : json["ChanDoanPhu"],
        chanDoanKhac:
            json["ChanDoanKhac"] == null ? null : json["ChanDoanKhac"],
        tgVao: json["TGVao"] == null ? null : DateTime.parse(json["TGVao"]),
        tgRa: json["TGRa"] == null ? null : DateTime.parse(json["TGRa"]),
        loaiVv: json["LoaiVV"] == null ? null : json["LoaiVV"],
        tongChiPhi: json["TongChiPhi"] == null ? null : json["TongChiPhi"],
        tongThu: json["TongThu"] == null ? null : json["TongThu"],
        tongTamUng: json["TongTamUng"] == null ? null : json["TongTamUng"],
        tamUng: json["TamUng"] == null ? null : json["TamUng"],
        giam: json["Giam"] == null ? null : json["Giam"],
        ghiChu: json["GhiChu"] == null ? null : json["GhiChu"],
        bsDieutri: json["BsDieutri"],
        khoaPhongDk: json["KhoaPhongDK"],
        nguoiDangKy: json["NguoiDangKy"] == null ? null : json["NguoiDangKy"],
        masterId2: json["MasterID2"],
        trangThai: json["TrangThai"] == null ? null : json["TrangThai"],
        ngayCapNhat: json["NgayCapNhat"] == null ? null : json["NgayCapNhat"],
        tienDichVuChuaThu: json["TienDichVuChuaThu"] == null
            ? null
            : json["TienDichVuChuaThu"],
        tienThuocChuaThu:
            json["TienThuocChuaThu"] == null ? null : json["TienThuocChuaThu"],
        trangThaiThu:
            json["TrangThaiThu"] == null ? null : json["TrangThaiThu"],
        saThai: json["SAThai"] == null ? null : json["SAThai"],
        soTuoiThai: json["SoTuoiThai"] == null ? null : json["SoTuoiThai"],
        loaiTgTinhThai:
            json["LoaiTGTinhThai"] == null ? null : json["LoaiTGTinhThai"],
        ngayKinhCuoi: json["NgayKinhCuoi"],
        ngayDuSanh: json["NgayDuSanh"],
        coBhyt: json["CoBHYT"] == null ? null : json["CoBHYT"],
        tienDichVuBhytChuaThu: json["TienDichVuBHYTChuaThu"] == null
            ? null
            : json["TienDichVuBHYTChuaThu"],
        tienThuocBhytChuaThu: json["TienThuocBHYTChuaThu"] == null
            ? null
            : json["TienThuocBHYTChuaThu"],
        stt: json["STT"] == null ? null : json["STT"],
        nghiHuongBhxh: json["NghiHuongBHXH"],
        nghiHuongBhxhDonVi: json["NghiHuongBHXH_DonVi"],
        nghiHuongBhxhLyDo: json["NghiHuongBHXH_LyDo"],
        nghiHuongBhxhNgayBd: json["NghiHuongBHXH_NgayBD"],
        nghiHuongBhxhNgayKt: json["NghiHuongBHXH_NgayKT"],
        nghiHuongBhxhSoNgay: json["NghiHuongBHXH_SoNgay"],
        nghiHuongBhxhSoSeri: json["NghiHuongBHXH_SoSeri"],
        nghiHuongBhxhGhiChu: json["NghiHuongBHXH_GhiChu"],
        nghiHuongBhxhHoTenCha: json["NghiHuongBHXH_HoTenCha"],
        nghiHuongBhxhHoTenMe: json["NghiHuongBHXH_HoTenMe"],
        nghiHuongBhxhTrangThai: json["NghiHuongBHXH_TrangThai"],
        nghiHuongBhxhQuyen: json["NghiHuongBHXH_Quyen"],
        nghiHuongBhxhKyHieu: json["NghiHuongBHXH_KyHieu"],
        vip: json["Vip"] == null ? null : json["Vip"],
        trieuChung: json["TrieuChung"],
        hoiChuan: json["HoiChuan"],
        dienBienBenh: json["DienBienBenh"],
        hourDate: json["HourDate"],
        minuteDate: json["MinuteDate"],
        packageId: json["Package_ID"],
        package: json["Package"],
        endDate:
            json["EndDate"] == null ? null : DateTime.parse(json["EndDate"]),
        clinicId: json["ClinicId"] == null ? null : json["ClinicId"],
        doctorId: json["DoctorId"] == null ? null : json["DoctorId"],
        ngayBacSiChiDinh: json["NgayBacSiChiDinh"] == null
            ? null
            : DateTime.parse(json["NgayBacSiChiDinh"]),
        bacSiChiDinhGhiChu: json["BacSiChiDinhGhiChu"] == null
            ? null
            : json["BacSiChiDinhGhiChu"],
        daChiHoaHongBscd:
            json["DaChiHoaHongBSCD"] == null ? null : json["DaChiHoaHongBSCD"],
        active: json["Active"] == null ? null : json["Active"],
        medTrangThai:
            json["MedTrangThai"] == null ? null : json["MedTrangThai"],
      );
}
