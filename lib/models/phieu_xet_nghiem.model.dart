class Phieuxetnghiem {
  Phieuxetnghiem({
    this.phieu,
    this.chitiet,
  });

  PhieuxetnghiemPhieu? phieu;
  List<PhieuxetnghiemChitiet>? chitiet;

  factory Phieuxetnghiem.fromJson(Map<String, dynamic> json) => Phieuxetnghiem(
        phieu: json["phieu"] == null
            ? null
            : PhieuxetnghiemPhieu.fromJson(json["phieu"]),
        chitiet: json["chitiet"] == null
            ? null
            : List<PhieuxetnghiemChitiet>.from(
                json["chitiet"].map((x) => PhieuxetnghiemChitiet.fromJson(x))),
      );
}

class PhieuxetnghiemChitiet {
  PhieuxetnghiemChitiet({
    this.tenNhom,
    this.maNhom,
    this.maDv,
    this.tenDv,
    this.maXn,
    this.tenXn,
    this.ketQua,
    this.binhThuong,
    this.lechTren,
    this.lechDuoi,
    this.csbt,
    this.donVi,
    this.ghiChu,
    this.maMay,
    this.mayXn,
    this.ngay,
    this.tgTra,
    this.nguoiTra,
  });

  String? tenNhom;
  String? maNhom;
  String? maDv;
  String? tenDv;
  String? maXn;
  String? tenXn;
  String? ketQua;
  bool? binhThuong;
  bool? lechTren;
  bool? lechDuoi;
  String? csbt;
  String? donVi;
  dynamic? ghiChu;
  String? maMay;
  dynamic? mayXn;
  DateTime? ngay;
  DateTime? tgTra;
  String? nguoiTra;

  factory PhieuxetnghiemChitiet.fromJson(Map<String, dynamic> json) =>
      PhieuxetnghiemChitiet(
        tenNhom: json["TenNhom"] == null ? null : json["TenNhom"],
        maNhom: json["MaNhom"] == null ? null : json["MaNhom"],
        maDv: json["MaDV"] == null ? null : json["MaDV"],
        tenDv: json["TenDV"] == null ? null : json["TenDV"],
        maXn: json["MaXN"] == null ? null : json["MaXN"],
        tenXn: json["TenXN"] == null ? null : json["TenXN"],
        ketQua: json["KetQua"] == null ? null : json["KetQua"],
        binhThuong: json["BinhThuong"] == null ? null : json["BinhThuong"],
        lechTren: json["LechTren"] == null ? null : json["LechTren"],
        lechDuoi: json["LechDuoi"] == null ? null : json["LechDuoi"],
        csbt: json["CSBT"] == null ? null : json["CSBT"],
        donVi: json["DonVi"] == null ? null : json["DonVi"],
        ghiChu: json["GhiChu"],
        maMay: json["MaMay"] == null ? null : json["MaMay"],
        mayXn: json["MayXN"],
        ngay: json["Ngay"] == null ? null : DateTime.parse(json["Ngay"]),
        tgTra: json["TGTra"] == null ? null : DateTime.parse(json["TGTra"]),
        nguoiTra: json["NguoiTra"] == null ? null : json["NguoiTra"],
      );
}

class PhieuxetnghiemPhieu {
  PhieuxetnghiemPhieu({
    this.id,
    this.sid,
    this.maBn,
    this.soVaoVien,
    this.ngay,
    this.nguoiChiDinh,
    this.noiChiDinh,
    this.tgChiDinh,
    this.tgTiepNhan,
    this.tgThucHien,
    this.tgTraKq,
    this.tgHenTraKq,
    this.kyThuatVien,
    this.nguoiThucHien,
    this.soLanIn,
    this.ketLuan,
    this.daDuyet,
    this.trangThai,
    this.nguoiTao,
    this.ngayTao,
    this.nguoiCapNhat,
    this.ngayCapNhat,
    this.noiThucHien,
    this.lyDoHuy,
    this.machineId,
    this.startDate,
    this.endDate,
  });

  String? id;
  String? sid;
  String? maBn;
  String? soVaoVien;
  DateTime? ngay;
  String? nguoiChiDinh;
  String? noiChiDinh;
  DateTime? tgChiDinh;
  DateTime? tgTiepNhan;
  DateTime? tgThucHien;
  DateTime? tgTraKq;
  DateTime? tgHenTraKq;
  String? kyThuatVien;
  String? nguoiThucHien;
  int? soLanIn;
  String? ketLuan;
  bool? daDuyet;
  String? trangThai;
  String? nguoiTao;
  String? ngayTao;
  String? nguoiCapNhat;
  String? ngayCapNhat;
  String? noiThucHien;
  dynamic? lyDoHuy;
  String? machineId;
  DateTime? startDate;
  DateTime? endDate;

  factory PhieuxetnghiemPhieu.fromJson(Map<String, dynamic> json) =>
      PhieuxetnghiemPhieu(
        id: json["ID"] == null ? null : json["ID"],
        sid: json["SID"] == null ? null : json["SID"],
        maBn: json["MaBN"] == null ? null : json["MaBN"],
        soVaoVien: json["SoVaoVien"] == null ? null : json["SoVaoVien"],
        ngay: json["Ngay"] == null ? null : DateTime.parse(json["Ngay"]),
        nguoiChiDinh:
            json["NguoiChiDinh"] == null ? null : json["NguoiChiDinh"],
        noiChiDinh: json["NoiChiDinh"] == null ? null : json["NoiChiDinh"],
        tgChiDinh: json["TGChiDinh"] == null
            ? null
            : DateTime.parse(json["TGChiDinh"]),
        tgTiepNhan: json["TGTiepNhan"] == null
            ? null
            : DateTime.parse(json["TGTiepNhan"]),
        tgThucHien: json["TGThucHien"] == null
            ? null
            : DateTime.parse(json["TGThucHien"]),
        tgTraKq:
            json["TGTraKQ"] == null ? null : DateTime.parse(json["TGTraKQ"]),
        tgHenTraKq: json["TGHenTraKQ"],
        kyThuatVien: json["KyThuatVien"] == null ? null : json["KyThuatVien"],
        nguoiThucHien:
            json["NguoiThucHien"] == null ? null : json["NguoiThucHien"],
        soLanIn: json["SoLanIn"] == null ? null : json["SoLanIn"],
        ketLuan: json["KetLuan"] == null ? null : json["KetLuan"],
        daDuyet: json["DaDuyet"] == null ? null : json["DaDuyet"],
        trangThai: json["TrangThai"] == null ? null : json["TrangThai"],
        nguoiTao: json["NguoiTao"] == null ? null : json["NguoiTao"],
        ngayTao: json["NgayTao"] == null ? null : json["NgayTao"],
        nguoiCapNhat:
            json["NguoiCapNhat"] == null ? null : json["NguoiCapNhat"],
        ngayCapNhat: json["NgayCapNhat"] == null ? null : json["NgayCapNhat"],
        noiThucHien: json["NoiThucHien"] == null ? null : json["NoiThucHien"],
        lyDoHuy: json["LyDoHuy"],
        machineId: json["MachineId"] == null ? null : json["MachineId"],
        startDate: json["StartDate"] == null
            ? null
            : DateTime.parse(json["StartDate"]),
        endDate:
            json["EndDate"] == null ? null : DateTime.parse(json["EndDate"]),
      );
}
