import 'package:app_mobile_bacsichidinh/models/paging.model.dart';

class MedCommissionAll {
  MedCommissionAll({
    this.medCommissionCombine,
    this.message,
    this.status,
    this.totalItems,
    this.clientIp,
  });

  MedCommissionCombine? medCommissionCombine;
  String? message;
  bool? status;
  int? totalItems;
  String? clientIp;

  factory MedCommissionAll.fromJson(Map<String, dynamic> json) =>
      MedCommissionAll(
        medCommissionCombine: json["data"] == null
            ? null
            : MedCommissionCombine.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        totalItems: json["total_items"] == null ? null : json["total_items"],
        clientIp: json["client_ip"] == null ? null : json["client_ip"],
      );
}

class MedCommissionCombine {
  MedCommissionCombine({
    this.listMedCommission,
    this.paging,
  });

  List<MedCommission>? listMedCommission;
  Paging? paging;

  factory MedCommissionCombine.fromJson(Map<String, dynamic> json) =>
      MedCommissionCombine(
        listMedCommission: json["data"] == null
            ? null
            : List<MedCommission>.from(
                json["data"].map((x) => MedCommission.fromJson(x))),
        paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
      );
}

class MedCommission {
  MedCommission({
    this.rowNumber,
    this.soVaoVien,
    this.clinicId,
    this.lydoVv,
    this.chanDoanChinh,
    this.chanDoanPhu,
    this.chanDoanKhac,
    this.ghiChu,
    this.bacSiChiDinhGhiChu,
    this.hoiChuan,
    this.trieuChung,
    this.dienBienBenh,
    this.giaBacSiChiDinh,
    this.hoaHongBacSiChiDinh,
    this.maBn,
    this.dienThoai,
    this.soCmnd,
    this.hoTen,
    this.diaChi,
    this.quocTich,
    this.tinhThanh,
    this.quanHuyen,
    this.phuongXa,
    this.gioiTinh,
    this.tenGioiTinh,
    this.tenPhuongXa,
    this.tenQuanHuyen,
    this.tenTinhThanh,
    this.danToc,
    this.ngheNghiep,
    this.ttHonnhan,
    this.nguoiThanHoTen,
    this.nguoiThanQuanHe,
    this.nguonGioithieu,
    this.nguoiGt,
    this.ngaySinh,
    this.thangSinh,
    this.namSinh,
    this.email,
    this.anh,
    this.daKichHoat,
    this.ngayCapNhat,
    this.trangThai,
    this.ngayBacSiChiDinh,
    this.tgVao,
    this.daChiHoaHongBscd,
    this.active,
    this.medTrangThai,
  });

  int? rowNumber;
  String? soVaoVien;
  int? clinicId;
  String? lydoVv;
  String? chanDoanChinh;
  dynamic? chanDoanPhu;
  dynamic? chanDoanKhac;
  String? ghiChu;
  String? bacSiChiDinhGhiChu;
  dynamic? hoiChuan;
  dynamic? trieuChung;
  dynamic? dienBienBenh;
  double? giaBacSiChiDinh;
  double? hoaHongBacSiChiDinh;
  String? maBn;
  String? dienThoai;
  String? soCmnd;
  String? hoTen;
  String? diaChi;
  String? quocTich;
  String? tinhThanh;
  String? quanHuyen;
  String? phuongXa;
  String? gioiTinh;
  String? tenGioiTinh;
  String? tenPhuongXa;
  String? tenQuanHuyen;
  String? tenTinhThanh;
  String? danToc;
  String? ngheNghiep;
  String? ttHonnhan;
  dynamic? nguoiThanHoTen;
  String? nguoiThanQuanHe;
  dynamic? nguonGioithieu;
  String? nguoiGt;
  dynamic? ngaySinh;
  dynamic? thangSinh;
  int? namSinh;
  String? email;
  dynamic? anh;
  dynamic? daKichHoat;
  DateTime? ngayCapNhat;
  String? trangThai;
  DateTime? ngayBacSiChiDinh;
  DateTime? tgVao;
  bool? daChiHoaHongBscd;
  String? active;
  String? medTrangThai;

  factory MedCommission.fromJson(Map<String, dynamic> json) => MedCommission(
        rowNumber: json["RowNumber"] == null ? null : json["RowNumber"],
        soVaoVien: json["SoVaoVien"] == null ? null : json["SoVaoVien"],
        clinicId: json["ClinicId"] == null ? null : json["ClinicId"],
        lydoVv: json["LydoVV"] == null ? null : json["LydoVV"],
        chanDoanChinh:
            json["ChanDoanChinh"] == null ? null : json["ChanDoanChinh"],
        chanDoanPhu: json["ChanDoanPhu"],
        chanDoanKhac: json["ChanDoanKhac"],
        ghiChu: json["GhiChu"] == null ? null : json["GhiChu"],
        bacSiChiDinhGhiChu: json["BacSiChiDinhGhiChu"] == null
            ? null
            : json["BacSiChiDinhGhiChu"],
        hoiChuan: json["HoiChuan"],
        trieuChung: json["TrieuChung"],
        dienBienBenh: json["DienBienBenh"],
        giaBacSiChiDinh:
            json["GiaBacSiChiDinh"] == null ? null : json["GiaBacSiChiDinh"],
        hoaHongBacSiChiDinh: json["HoaHongBacSiChiDinh"] == null
            ? null
            : json["HoaHongBacSiChiDinh"],
        maBn: json["MaBN"] == null ? null : json["MaBN"],
        dienThoai: json["DienThoai"] == null ? null : json["DienThoai"],
        soCmnd: json["SoCMND"] == null ? null : json["SoCMND"],
        hoTen: json["HoTen"] == null ? null : json["HoTen"],
        diaChi: json["DiaChi"] == null ? null : json["DiaChi"],
        quocTich: json["QuocTich"] == null ? null : json["QuocTich"],
        tinhThanh: json["TinhThanh"] == null ? null : json["TinhThanh"],
        quanHuyen: json["QuanHuyen"] == null ? null : json["QuanHuyen"],
        phuongXa: json["PhuongXa"] == null ? null : json["PhuongXa"],
        gioiTinh: json["GioiTinh"] == null ? null : json["GioiTinh"],
        tenGioiTinh: json["TenGioiTinh"] == null ? null : json["TenGioiTinh"],
        tenPhuongXa: json["TenPhuongXa"] == null ? null : json["TenPhuongXa"],
        tenQuanHuyen:
            json["TenQuanHuyen"] == null ? null : json["TenQuanHuyen"],
        tenTinhThanh:
            json["TenTinhThanh"] == null ? null : json["TenTinhThanh"],
        danToc: json["DanToc"] == null ? null : json["DanToc"],
        ngheNghiep: json["NgheNghiep"] == null ? null : json["NgheNghiep"],
        ttHonnhan: json["TTHonnhan"] == null ? null : json["TTHonnhan"],
        nguoiThanHoTen: json["NguoiThanHoTen"],
        nguoiThanQuanHe:
            json["NguoiThanQuanHe"] == null ? null : json["NguoiThanQuanHe"],
        nguonGioithieu: json["NguonGioithieu"],
        nguoiGt: json["NguoiGT"] == null ? null : json["NguoiGT"],
        ngaySinh: json["NgaySinh"],
        thangSinh: json["ThangSinh"],
        namSinh: json["NamSinh"] == null ? null : json["NamSinh"],
        email: json["Email"] == null ? null : json["Email"],
        anh: json["Anh"],
        daKichHoat: json["DaKichHoat"],
        ngayCapNhat: json["NgayCapNhat"] == null
            ? null
            : DateTime.parse(json["NgayCapNhat"]),
        trangThai: json["TrangThai"] == null ? null : json["TrangThai"],
        ngayBacSiChiDinh: json["NgayBacSiChiDinh"] == null
            ? null
            : DateTime.parse(json["NgayBacSiChiDinh"]),
        tgVao: json["TGVao"] == null ? null : DateTime.parse(json["TGVao"]),
        daChiHoaHongBscd:
            json["DaChiHoaHongBSCD"] == null ? null : json["DaChiHoaHongBSCD"],
        active: json["Active"] == null ? null : json["Active"],
        medTrangThai:
            json["MedTrangThai"] == null ? null : json["MedTrangThai"],
      );
}
