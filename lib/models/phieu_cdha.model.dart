class PhieuCdha {
  PhieuCdha({
    this.phieu,
    this.chitiet,
  });

  PhieuCdhaPhieu? phieu;
  List<PhieuCdhaChitiet>? chitiet;

  factory PhieuCdha.fromJson(Map<String, dynamic> json) => PhieuCdha(
        phieu: json["phieu"] == null
            ? null
            : PhieuCdhaPhieu.fromJson(json["phieu"]),
        chitiet: json["chitiet"] == null
            ? null
            : List<PhieuCdhaChitiet>.from(
                json["chitiet"].map((x) => PhieuCdhaChitiet.fromJson(x))),
      );
}

class PhieuCdhaChitiet {
  PhieuCdhaChitiet({
    this.name,
    this.path,
  });

  String? name;
  String? path;

  factory PhieuCdhaChitiet.fromJson(Map<String, dynamic> json) =>
      PhieuCdhaChitiet(
        name: json["Name"] == null ? null : json["Name"],
        path: json["Path"] == null ? null : json["Path"],
      );
}

class PhieuCdhaPhieu {
  PhieuCdhaPhieu({
    this.id,
    this.idPhieuChiDinhCt,
    this.soVaoVien,
    this.ngay,
    this.khoaPhong,
    this.maBn,
    this.maDv,
    this.nguoiThucHien,
    this.dieuDuong,
    this.kyThuatVien,
    this.kyThuatVienPhu1,
    this.kyThuatVienPhu2,
    this.maMau,
    this.noiDung,
    this.hinhAnhJson,
    this.thoiGian,
    this.lyDoHuy,
    this.ketLuan,
    this.deNghi,
    this.loai,
    this.loaiCls,
    this.chanDoanTruocPt,
    this.chanDoanSauPt,
    this.loaiPhim,
    this.loaiThuThuat,
    this.ngayKinhCuoi,
    this.nsCapCuu,
    this.nsChanDoan,
    this.nsDieuTri,
    this.nsGpb,
    this.nsSinhThiet,
    this.ppThuThuat,
    this.ppVoCam,
    this.slPhim,
    this.trangThai,
    this.ngayCapNhat,
    this.nguoiCapNhat,
    this.maMauCls,
    this.soAnhChonIn,
    this.stt,
    this.coBhyt,
    this.soPhieu,
    this.bacSiGayMe,
    this.machineId,
    this.startDate,
    this.endDate,
  });

  String? id;
  String? idPhieuChiDinhCt;
  String? soVaoVien;
  DateTime? ngay;
  String? khoaPhong;
  String? maBn;
  String? maDv;
  String? nguoiThucHien;
  dynamic? dieuDuong;
  dynamic? kyThuatVien;
  String? kyThuatVienPhu1;
  String? kyThuatVienPhu2;
  dynamic? maMau;
  String? noiDung;
  String? hinhAnhJson;
  DateTime? thoiGian;
  dynamic? lyDoHuy;
  String? ketLuan;
  String? deNghi;
  int? loai;
  String? loaiCls;
  String? chanDoanTruocPt;
  String? chanDoanSauPt;
  dynamic? loaiPhim;
  String? loaiThuThuat;
  dynamic? ngayKinhCuoi;
  bool? nsCapCuu;
  bool? nsChanDoan;
  bool? nsDieuTri;
  bool? nsGpb;
  bool? nsSinhThiet;
  String? ppThuThuat;
  String? ppVoCam;
  int? slPhim;
  String? trangThai;
  String? ngayCapNhat;
  String? nguoiCapNhat;
  String? maMauCls;
  int? soAnhChonIn;
  int? stt;
  bool? coBhyt;
  String? soPhieu;
  String? bacSiGayMe;
  dynamic? machineId;
  DateTime? startDate;
  DateTime? endDate;

  factory PhieuCdhaPhieu.fromJson(Map<String, dynamic> json) => PhieuCdhaPhieu(
        id: json["ID"] == null ? null : json["ID"],
        idPhieuChiDinhCt:
            json["IDPhieuChiDinhCT"] == null ? null : json["IDPhieuChiDinhCT"],
        soVaoVien: json["SoVaoVien"] == null ? null : json["SoVaoVien"],
        ngay: json["Ngay"] == null ? null : DateTime.parse(json["Ngay"]),
        khoaPhong: json["KhoaPhong"] == null ? null : json["KhoaPhong"],
        maBn: json["MaBN"] == null ? null : json["MaBN"],
        maDv: json["MaDV"] == null ? null : json["MaDV"],
        nguoiThucHien:
            json["NguoiThucHien"] == null ? null : json["NguoiThucHien"],
        dieuDuong: json["DieuDuong"],
        kyThuatVien: json["KyThuatVien"],
        kyThuatVienPhu1:
            json["KyThuatVien_Phu1"] == null ? null : json["KyThuatVien_Phu1"],
        kyThuatVienPhu2:
            json["KyThuatVien_Phu2"] == null ? null : json["KyThuatVien_Phu2"],
        maMau: json["MaMau"],
        noiDung: json["NoiDung"] == null ? null : json["NoiDung"],
        hinhAnhJson: json["HinhAnhJson"] == null ? null : json["HinhAnhJson"],
        thoiGian:
            json["ThoiGian"] == null ? null : DateTime.parse(json["ThoiGian"]),
        lyDoHuy: json["LyDoHuy"],
        ketLuan: json["KetLuan"] == null ? null : json["KetLuan"],
        deNghi: json["DeNghi"] == null ? null : json["DeNghi"],
        loai: json["Loai"] == null ? null : json["Loai"],
        loaiCls: json["LoaiCLS"] == null ? null : json["LoaiCLS"],
        chanDoanTruocPt:
            json["ChanDoanTruocPT"] == null ? null : json["ChanDoanTruocPT"],
        chanDoanSauPt:
            json["ChanDoanSauPT"] == null ? null : json["ChanDoanSauPT"],
        loaiPhim: json["LoaiPhim"],
        loaiThuThuat:
            json["LoaiThuThuat"] == null ? null : json["LoaiThuThuat"],
        ngayKinhCuoi: json["NgayKinhCuoi"],
        nsCapCuu: json["NS_CapCuu"] == null ? null : json["NS_CapCuu"],
        nsChanDoan: json["NS_ChanDoan"] == null ? null : json["NS_ChanDoan"],
        nsDieuTri: json["NS_DieuTri"] == null ? null : json["NS_DieuTri"],
        nsGpb: json["NS_GPB"] == null ? null : json["NS_GPB"],
        nsSinhThiet: json["NS_SinhThiet"] == null ? null : json["NS_SinhThiet"],
        ppThuThuat: json["PP_ThuThuat"] == null ? null : json["PP_ThuThuat"],
        ppVoCam: json["PP_VoCam"] == null ? null : json["PP_VoCam"],
        slPhim: json["SLPhim"] == null ? null : json["SLPhim"],
        trangThai: json["TrangThai"] == null ? null : json["TrangThai"],
        ngayCapNhat: json["NgayCapNhat"] == null ? null : json["NgayCapNhat"],
        nguoiCapNhat:
            json["NguoiCapNhat"] == null ? null : json["NguoiCapNhat"],
        maMauCls: json["MaMauCLS"] == null ? null : json["MaMauCLS"],
        soAnhChonIn: json["SoAnhChonIn"] == null ? null : json["SoAnhChonIn"],
        stt: json["STT"] == null ? null : json["STT"],
        coBhyt: json["CoBHYT"] == null ? null : json["CoBHYT"],
        soPhieu: json["SoPhieu"] == null ? null : json["SoPhieu"],
        bacSiGayMe: json["BacSiGayMe"] == null ? null : json["BacSiGayMe"],
        machineId: json["MachineId"],
        startDate: json["StartDate"] == null
            ? null
            : DateTime.parse(json["StartDate"]),
        endDate:
            json["EndDate"] == null ? null : DateTime.parse(json["EndDate"]),
      );
}
