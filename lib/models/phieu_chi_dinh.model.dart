class Phieuchidinh {
  Phieuchidinh({
    this.phieu,
    this.chitiet,
  });

  PhieuchidinhPhieu? phieu;
  List<PhieuchidinhChitiet>? chitiet;

  factory Phieuchidinh.fromJson(Map<String, dynamic> json) => Phieuchidinh(
        phieu: json["phieu"] == null
            ? null
            : PhieuchidinhPhieu.fromJson(json["phieu"]),
        chitiet: json["chitiet"] == null
            ? null
            : List<PhieuchidinhChitiet>.from(
                json["chitiet"].map((x) => PhieuchidinhChitiet.fromJson(x))),
      );
}

class PhieuchidinhChitiet {
  PhieuchidinhChitiet({
    this.stt,
    this.ma,
    this.ten,
    this.yNghia,
    this.nhom,
    this.tenNhom,
    this.giaGoc,
    this.giaThucTe,
    this.hoaHongBacSiChiDinh,
    this.ghiChu,
    this.idpcd,
    this.khongThucHien,
    this.nguoiChiDinh,
    this.nguoiDieuChinh,
    this.noiChiDinh,
    this.noiThucHien,
    this.ngay,
    this.ngayPcd,
    this.tgChiDinh,
    this.tgDieuChinh,
    this.tgThucHien,
    this.trangThai,
    this.daThucHien,
  });

  int? stt;
  String? ma;
  String? ten;
  dynamic? yNghia;
  String? nhom;
  String? tenNhom;
  double? giaGoc;
  double? giaThucTe;
  double? hoaHongBacSiChiDinh;
  dynamic? ghiChu;
  String? idpcd;
  dynamic? khongThucHien;
  dynamic? nguoiChiDinh;
  dynamic? nguoiDieuChinh;
  dynamic? noiChiDinh;
  dynamic? noiThucHien;
  DateTime? ngay;
  DateTime? ngayPcd;
  DateTime? tgChiDinh;
  dynamic? tgDieuChinh;
  DateTime? tgThucHien;
  dynamic? trangThai;
  bool? daThucHien;

  factory PhieuchidinhChitiet.fromJson(Map<String, dynamic> json) =>
      PhieuchidinhChitiet(
        stt: json["STT"] == null ? null : json["STT"],
        ma: json["Ma"] == null ? null : json["Ma"],
        ten: json["Ten"] == null ? null : json["Ten"],
        yNghia: json["YNghia"],
        nhom: json["Nhom"] == null ? null : json["Nhom"],
        tenNhom: json["TenNhom"] == null ? null : json["TenNhom"],
        giaGoc: json["GiaGoc"] == null ? null : json["GiaGoc"],
        giaThucTe: json["GiaThucTe"] == null ? null : json["GiaThucTe"],
        hoaHongBacSiChiDinh: json["HoaHongBacSiChiDinh"] == null
            ? null
            : json["HoaHongBacSiChiDinh"],
        ghiChu: json["GhiChu"],
        idpcd: json["IDPCD"] == null ? null : json["IDPCD"],
        khongThucHien: json["KhongThucHien"],
        nguoiChiDinh: json["NguoiChiDinh"],
        nguoiDieuChinh: json["NguoiDieuChinh"],
        noiChiDinh: json["NoiChiDinh"],
        noiThucHien: json["NoiThucHien"],
        ngay: json["Ngay"] == null ? null : DateTime.parse(json["Ngay"]),
        ngayPcd:
            json["NgayPCD"] == null ? null : DateTime.parse(json["NgayPCD"]),
        tgChiDinh: json["TGChiDinh"] == null
            ? null
            : DateTime.parse(json["TGChiDinh"]),
        tgDieuChinh: json["TGDieuChinh"],
        tgThucHien: json["TGThucHien"] == null
            ? null
            : DateTime.parse(json["TGThucHien"]),
        trangThai: json["TrangThai"],
        daThucHien: json["DaThucHien"] == null ? null : json["DaThucHien"],
      );
}

class PhieuchidinhPhieu {
  PhieuchidinhPhieu({
    this.id,
    this.soVaoVien,
    this.ngay,
    this.maBn,
    this.bsChiDinh,
    this.noiChiDinh,
    this.clsTuDo,
    this.soPhieu,
    this.trangThai,
    this.tgChiDinh,
    this.ngayCapNhat,
    this.mienPhi,
    this.coBhyt,
    this.hourDate,
    this.minuteDate,
    this.packageId,
  });

  String? id;
  String? soVaoVien;
  DateTime? ngay;
  String? maBn;
  String? bsChiDinh;
  String? noiChiDinh;
  bool? clsTuDo;
  String? soPhieu;
  String? trangThai;
  DateTime? tgChiDinh;
  String? ngayCapNhat;
  dynamic? mienPhi;
  bool? coBhyt;
  dynamic? hourDate;
  dynamic? minuteDate;
  dynamic? packageId;

  factory PhieuchidinhPhieu.fromJson(Map<String, dynamic> json) =>
      PhieuchidinhPhieu(
        id: json["ID"] == null ? null : json["ID"],
        soVaoVien: json["SoVaoVien"] == null ? null : json["SoVaoVien"],
        ngay: json["Ngay"] == null ? null : DateTime.parse(json["Ngay"]),
        maBn: json["MaBN"] == null ? null : json["MaBN"],
        bsChiDinh: json["BSChiDinh"] == null ? null : json["BSChiDinh"],
        noiChiDinh: json["NoiChiDinh"] == null ? null : json["NoiChiDinh"],
        clsTuDo: json["CLSTuDo"] == null ? null : json["CLSTuDo"],
        soPhieu: json["SoPhieu"] == null ? null : json["SoPhieu"],
        trangThai: json["TrangThai"] == null ? null : json["TrangThai"],
        tgChiDinh: json["TGChiDinh"] == null
            ? null
            : DateTime.parse(json["TGChiDinh"]),
        ngayCapNhat: json["NgayCapNhat"] == null ? null : json["NgayCapNhat"],
        mienPhi: json["MienPhi"],
        coBhyt: json["CoBHYT"] == null ? null : json["CoBHYT"],
        hourDate: json["HourDate"],
        minuteDate: json["MinuteDate"],
        packageId: json["Package_ID"],
      );
}
