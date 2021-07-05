class Phieuthu {
  Phieuthu({
    this.phieu,
    this.chitiet,
  });

  PhieuthuPhieu? phieu;
  List<PhieuthuChitiet>? chitiet;

  factory Phieuthu.fromJson(Map<String, dynamic> json) => Phieuthu(
        phieu: json["phieu"] == null
            ? null
            : PhieuthuPhieu.fromJson(json["phieu"]),
        chitiet: json["chitiet"] == null
            ? null
            : List<PhieuthuChitiet>.from(
                json["chitiet"].map((x) => PhieuthuChitiet.fromJson(x))),
      );
}

class PhieuthuChitiet {
  PhieuthuChitiet({
    this.id,
    this.idPhieuThu,
    this.iddvThamChieuCt,
    this.ngay,
    this.maBn,
    this.soVaoVien,
    this.tgThuTien,
    this.maDv,
    this.donVi,
    this.maKho,
    this.ghiChu,
    this.soLuong,
    this.donGia,
    this.giam,
    this.soGiam,
    this.tang,
    this.soTang,
    this.thanhToan,
    this.loaiPhieu,
    this.trangThai,
    this.ngayCapNhat,
    this.nguoiCapNhat,
    this.daHoanTra,
    this.tgHoanTra,
    this.nguoiHoanTra,
    this.tinh100,
    this.tinhBhyt,
    this.tinhCl,
    this.tiLeBhyt,
    this.donGiaBh,
    this.bhChi,
    this.ptPhi,
    this.dvPhi,
    this.tinhDvPhi,
    this.tiLeTtdm,
    this.packageId,
  });

  String? id;
  String? idPhieuThu;
  String? iddvThamChieuCt;
  DateTime? ngay;
  String? maBn;
  String? soVaoVien;
  DateTime? tgThuTien;
  String? maDv;
  String? donVi;
  String? maKho;
  String? ghiChu;
  double? soLuong;
  double? donGia;
  double? giam;
  double? soGiam;
  double? tang;
  double? soTang;
  double? thanhToan;
  int? loaiPhieu;
  String? trangThai;
  String? ngayCapNhat;
  String? nguoiCapNhat;
  dynamic? daHoanTra;
  dynamic? tgHoanTra;
  dynamic? nguoiHoanTra;
  bool? tinh100;
  bool? tinhBhyt;
  bool? tinhCl;
  double? tiLeBhyt;
  double? donGiaBh;
  double? bhChi;
  double? ptPhi;
  double? dvPhi;
  bool? tinhDvPhi;
  double? tiLeTtdm;
  dynamic? packageId;

  factory PhieuthuChitiet.fromJson(Map<String, dynamic> json) =>
      PhieuthuChitiet(
        id: json["ID"] == null ? null : json["ID"],
        idPhieuThu: json["IDPhieuThu"] == null ? null : json["IDPhieuThu"],
        iddvThamChieuCt:
            json["IDDVThamChieuCT"] == null ? null : json["IDDVThamChieuCT"],
        ngay: json["Ngay"] == null ? null : DateTime.parse(json["Ngay"]),
        maBn: json["MaBN"] == null ? null : json["MaBN"],
        soVaoVien: json["SoVaoVien"] == null ? null : json["SoVaoVien"],
        tgThuTien: json["TGThuTien"] == null
            ? null
            : DateTime.parse(json["TGThuTien"]),
        maDv: json["MaDV"] == null ? null : json["MaDV"],
        donVi: json["DonVi"] == null ? null : json["DonVi"],
        maKho: json["MaKho"] == null ? null : json["MaKho"],
        ghiChu: json["GhiChu"] == null ? null : json["GhiChu"],
        soLuong: json["SoLuong"] == null ? null : json["SoLuong"],
        donGia: json["DonGia"] == null ? null : json["DonGia"],
        giam: json["Giam"] == null ? null : json["Giam"],
        soGiam: json["SoGiam"] == null ? null : json["SoGiam"],
        tang: json["Tang"] == null ? null : json["Tang"],
        soTang: json["SoTang"] == null ? null : json["SoTang"],
        thanhToan: json["ThanhToan"] == null ? null : json["ThanhToan"],
        loaiPhieu: json["LoaiPhieu"] == null ? null : json["LoaiPhieu"],
        trangThai: json["TrangThai"] == null ? null : json["TrangThai"],
        ngayCapNhat: json["NgayCapNhat"] == null ? null : json["NgayCapNhat"],
        nguoiCapNhat:
            json["NguoiCapNhat"] == null ? null : json["NguoiCapNhat"],
        daHoanTra: json["DaHoanTra"],
        tgHoanTra: json["TGHoanTra"],
        nguoiHoanTra: json["NguoiHoanTra"],
        tinh100: json["Tinh100"] == null ? null : json["Tinh100"],
        tinhBhyt: json["TinhBHYT"] == null ? null : json["TinhBHYT"],
        tinhCl: json["TinhCL"] == null ? null : json["TinhCL"],
        tiLeBhyt: json["TiLeBHYT"] == null ? null : json["TiLeBHYT"],
        donGiaBh: json["DonGiaBH"] == null ? null : json["DonGiaBH"],
        bhChi: json["BHChi"] == null ? null : json["BHChi"],
        ptPhi: json["PTPhi"] == null ? null : json["PTPhi"],
        dvPhi: json["DVPhi"] == null ? null : json["DVPhi"],
        tinhDvPhi: json["TinhDVPhi"] == null ? null : json["TinhDVPhi"],
        tiLeTtdm: json["TiLeTTDM"] == null ? null : json["TiLeTTDM"],
        packageId: json["Package_ID"],
      );
}

class PhieuthuPhieu {
  PhieuthuPhieu({
    this.id,
    this.ngay,
    this.nguoiThu,
    this.quayThu,
    this.maBn,
    this.trangThai,
    this.soVaoVien,
    this.lyDoHuy,
    this.giam100,
    this.lyDoGiam,
    this.tongChiPhi,
    this.tongThu,
    this.giam,
    this.soGiam,
    this.tang,
    this.soTang,
    this.tamUng,
    this.thanhTamUng,
    this.thanhToan,
    this.hoanUng,
    this.ngayCapNhat,
    this.nguoiCapNhat,
    this.thoiGian,
    this.noiDungThu,
    this.tongGiam,
    this.tongTang,
    this.soPhieu,
    this.posid,
    this.idDuyetBhyt,
    this.thanhTienBh,
    this.bhChi,
    this.bnTraBh,
    this.huong100,
    this.stt,
    this.hoanTra,
    this.billCode,
    this.packageId,
    this.tienMat,
    this.tienThe,
    this.tienGoi,
    this.startDate,
    this.endDate,
  });

  String? id;
  DateTime? ngay;
  String? nguoiThu;
  String? quayThu;
  String? maBn;
  String? trangThai;
  String? soVaoVien;
  dynamic? lyDoHuy;
  bool? giam100;
  String? lyDoGiam;
  double? tongChiPhi;
  double? tongThu;
  double? giam;
  double? soGiam;
  double? tang;
  double? soTang;
  double? tamUng;
  double? thanhTamUng;
  double? thanhToan;
  double? hoanUng;
  String? ngayCapNhat;
  String? nguoiCapNhat;
  DateTime? thoiGian;
  String? noiDungThu;
  double? tongGiam;
  double? tongTang;
  String? soPhieu;
  dynamic? posid;
  String? idDuyetBhyt;
  double? thanhTienBh;
  double? bhChi;
  double? bnTraBh;
  bool? huong100;
  int? stt;
  dynamic? hoanTra;
  dynamic? billCode;
  dynamic? packageId;
  double? tienMat;
  double? tienThe;
  dynamic? tienGoi;
  dynamic? startDate;
  dynamic? endDate;

  factory PhieuthuPhieu.fromJson(Map<String, dynamic> json) => PhieuthuPhieu(
        id: json["ID"] == null ? null : json["ID"],
        ngay: json["Ngay"] == null ? null : DateTime.parse(json["Ngay"]),
        nguoiThu: json["NguoiThu"] == null ? null : json["NguoiThu"],
        quayThu: json["QuayThu"] == null ? null : json["QuayThu"],
        maBn: json["MaBN"] == null ? null : json["MaBN"],
        trangThai: json["TrangThai"] == null ? null : json["TrangThai"],
        soVaoVien: json["SoVaoVien"] == null ? null : json["SoVaoVien"],
        lyDoHuy: json["LyDoHuy"],
        giam100: json["Giam100"] == null ? null : json["Giam100"],
        lyDoGiam: json["LyDoGiam"] == null ? null : json["LyDoGiam"],
        tongChiPhi: json["TongChiPhi"] == null ? null : json["TongChiPhi"],
        tongThu: json["TongThu"] == null ? null : json["TongThu"],
        giam: json["Giam"] == null ? null : json["Giam"],
        soGiam: json["SoGiam"] == null ? null : json["SoGiam"],
        tang: json["Tang"] == null ? null : json["Tang"],
        soTang: json["SoTang"] == null ? null : json["SoTang"],
        tamUng: json["TamUng"] == null ? null : json["TamUng"],
        thanhTamUng: json["ThanhTamUng"] == null ? null : json["ThanhTamUng"],
        thanhToan: json["ThanhToan"] == null ? null : json["ThanhToan"],
        hoanUng: json["HoanUng"] == null ? null : json["HoanUng"],
        ngayCapNhat: json["NgayCapNhat"] == null ? null : json["NgayCapNhat"],
        nguoiCapNhat:
            json["NguoiCapNhat"] == null ? null : json["NguoiCapNhat"],
        thoiGian:
            json["ThoiGian"] == null ? null : DateTime.parse(json["ThoiGian"]),
        noiDungThu: json["NoiDungThu"] == null ? null : json["NoiDungThu"],
        tongGiam: json["TongGiam"] == null ? null : json["TongGiam"],
        tongTang: json["TongTang"] == null ? null : json["TongTang"],
        soPhieu: json["SoPhieu"] == null ? null : json["SoPhieu"],
        posid: json["POSID"],
        idDuyetBhyt: json["IDDuyetBHYT"] == null ? null : json["IDDuyetBHYT"],
        thanhTienBh: json["ThanhTienBH"] == null ? null : json["ThanhTienBH"],
        bhChi: json["BHChi"] == null ? null : json["BHChi"],
        bnTraBh: json["BNTraBH"] == null ? null : json["BNTraBH"],
        huong100: json["Huong100"] == null ? null : json["Huong100"],
        stt: json["STT"] == null ? null : json["STT"],
        hoanTra: json["HoanTra"],
        billCode: json["BillCode"],
        packageId: json["Package_ID"],
        tienMat: json["TienMat"] == null ? null : json["TienMat"],
        tienThe: json["TienThe"] == null ? null : json["TienThe"],
        tienGoi: json["TienGoi"],
        startDate: json["StartDate"],
        endDate: json["EndDate"],
      );
}
