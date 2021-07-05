import 'package:intl/intl.dart';

class BookingListOverview {
  BookingListOverview({
    this.listBookingCustomer,
    this.status,
    this.totalItems,
  });

  List<BookingCustomer>? listBookingCustomer;
  bool? status;
  int? totalItems;

  factory BookingListOverview.fromJson(Map<String, dynamic> json) =>
      BookingListOverview(
        listBookingCustomer: json["data"] == null
            ? null
            : List<BookingCustomer>.from(
                json["data"].map((x) => BookingCustomer.fromJson(x))),
        status: json["status"] == null ? null : json["status"],
        totalItems: json["total_items"] == null ? null : json["total_items"],
      );
}

class BookingCustomer {
  BookingCustomer({
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
    this.ngay,
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
  String? chanDoanPhu;
  String? chanDoanKhac;
  String? ghiChu;
  String? bacSiChiDinhGhiChu;
  dynamic? hoiChuan;
  dynamic? trieuChung;
  dynamic? dienBienBenh;
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
  String? nguoiThanHoTen;
  String? nguoiThanQuanHe;
  dynamic? nguonGioithieu;
  String? nguoiGt;
  int? ngaySinh;
  int? thangSinh;
  int? namSinh;
  String? email;
  dynamic? anh;
  dynamic? daKichHoat;
  DateTime? ngayCapNhat;
  String? trangThai;
  DateTime? ngayBacSiChiDinh;
  DateTime? ngay;
  DateTime? tgVao;
  bool? daChiHoaHongBscd;
  String? active;
  String? medTrangThai;

  factory BookingCustomer.fromJson(Map<String, dynamic> json) =>
      BookingCustomer(
        rowNumber: json["RowNumber"] == null ? null : json["RowNumber"],
        soVaoVien: json["SoVaoVien"] == null ? null : json["SoVaoVien"],
        clinicId: json["ClinicId"] == null ? null : json["ClinicId"],
        lydoVv: json["LydoVV"] == null ? null : json["LydoVV"],
        chanDoanChinh:
            json["ChanDoanChinh"] == null ? null : json["ChanDoanChinh"],
        chanDoanPhu: json["ChanDoanPhu"] == null ? null : json["ChanDoanPhu"],
        chanDoanKhac:
            json["ChanDoanKhac"] == null ? null : json["ChanDoanKhac"],
        ghiChu: json["GhiChu"] == null ? null : json["GhiChu"],
        bacSiChiDinhGhiChu: json["BacSiChiDinhGhiChu"] == null
            ? null
            : json["BacSiChiDinhGhiChu"],
        hoiChuan: json["HoiChuan"],
        trieuChung: json["TrieuChung"],
        dienBienBenh: json["DienBienBenh"],
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
        nguoiThanHoTen:
            json["NguoiThanHoTen"] == null ? null : json["NguoiThanHoTen"],
        nguoiThanQuanHe:
            json["NguoiThanQuanHe"] == null ? null : json["NguoiThanQuanHe"],
        nguonGioithieu: json["NguonGioithieu"],
        nguoiGt: json["NguoiGT"] == null ? null : json["NguoiGT"],
        ngaySinh: json["NgaySinh"] == null ? null : json["NgaySinh"],
        thangSinh: json["ThangSinh"] == null ? null : json["ThangSinh"],
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
        ngay: json["Ngay"] == null ? null : DateTime.parse(json["Ngay"]),
        tgVao: json["TGVao"] == null ? null : DateTime.parse(json["TGVao"]),
        daChiHoaHongBscd:
            json["DaChiHoaHongBSCD"] == null ? null : json["DaChiHoaHongBSCD"],
        active: json["Active"] == null ? null : json["Active"],
        medTrangThai:
            json["MedTrangThai"] == null ? null : json["MedTrangThai"],
      );
}

var demoBookingModel = BookingListOverview(
  status: true,
  totalItems: 3,
  listBookingCustomer: [
    BookingCustomer(
        rowNumber: 1,
        soVaoVien: "2",
        clinicId: 2,
        lydoVv: "Bác sĩ Hector Hoàng chỉ định",
        chanDoanChinh: "",
        chanDoanPhu: "",
        chanDoanKhac: "",
        ghiChu: "",
        bacSiChiDinhGhiChu: "Ghi chú đặt lịch hẹn chỉ định...",
        hoiChuan: null,
        trieuChung: null,
        dienBienBenh: null,
        maBn: "DCPK21062500002",
        dienThoai: "+84-964889998",
        soCmnd: "225079496",
        hoTen: "Hoàng Công Hoà",
        diaChi: "287 Phan Văn Hớn",
        quocTich: "VN",
        tinhThanh: "701",
        quanHuyen: "70123",
        phuongXa: "7012301",
        gioiTinh: "M",
        tenGioiTinh: "Nam",
        tenPhuongXa: "Phường Tân Thới Nhất",
        tenQuanHuyen: "Quận 12",
        tenTinhThanh: "Hồ Chí Minh",
        danToc: "25",
        ngheNghiep: "KHAC",
        ttHonnhan: "KH",
        nguoiThanHoTen: "",
        nguoiThanQuanHe: "",
        nguonGioithieu: null,
        nguoiGt: "1",
        ngaySinh: 24,
        thangSinh: 11,
        namSinh: 1980,
        email: "conghoa.hoang@doctorcheck.vn",
        anh: null,
        daKichHoat: null,
        ngayCapNhat: DateTime.parse("2021-06-25T00:00:00+07:00"),
        trangThai: "Chờ_thực_hiện",
        ngayBacSiChiDinh: DateTime.parse("2021-07-02T14:31:29.503+07:00"),
        ngay: DateTime.parse("2021-07-02T00:00:00+07:00"),
        tgVao: DateTime.parse("2021-07-02T14:31:29.503+07:00"),
        daChiHoaHongBscd: false,
        active: "active",
        medTrangThai: "InProgress"),
    BookingCustomer(
        rowNumber: 2,
        soVaoVien: "9",
        clinicId: 2,
        lydoVv: "Bác sĩ Hector Hoàng chỉ định",
        chanDoanChinh: "chuan doan a",
        chanDoanPhu: null,
        chanDoanKhac: null,
        ghiChu: "ghi chu b",
        bacSiChiDinhGhiChu: "ghi chu b",
        hoiChuan: null,
        trieuChung: null,
        dienBienBenh: null,
        maBn: "DCPK21070100006",
        dienThoai: "",
        soCmnd: "",
        hoTen: "Tong  V A",
        diaChi: "",
        quocTich: "",
        tinhThanh: "",
        quanHuyen: "",
        phuongXa: "",
        gioiTinh: "F",
        tenGioiTinh: "Nữ",
        tenPhuongXa: null,
        tenQuanHuyen: null,
        tenTinhThanh: null,
        danToc: "",
        ngheNghiep: "",
        ttHonnhan: "",
        nguoiThanHoTen: "",
        nguoiThanQuanHe: "",
        nguonGioithieu: null,
        nguoiGt: "1",
        ngaySinh: 1,
        thangSinh: 1,
        namSinh: 1999,
        email: null,
        anh: null,
        daKichHoat: null,
        ngayCapNhat: DateTime.parse("2021-07-01T14:51:02.367+07:00"),
        trangThai: "Chờ_thực_hiện",
        ngayBacSiChiDinh: DateTime.parse("2021-07-02T14:52:25.173+07:00"),
        ngay: DateTime.parse("2021-07-02T00:00:00+07:00"),
        tgVao: DateTime.parse("2021-07-02T14:52:25.173+07:00"),
        daChiHoaHongBscd: false,
        active: "active",
        medTrangThai: "InProgress"),
    BookingCustomer(
        rowNumber: 3,
        soVaoVien: "5",
        clinicId: 2,
        lydoVv: "Bác sĩ Hector Hoàng chỉ định",
        chanDoanChinh: "",
        chanDoanPhu: "",
        chanDoanKhac: "",
        ghiChu: "Theo chỉ định, không cần khám",
        bacSiChiDinhGhiChu: "Theo chỉ định, không cần khám",
        hoiChuan: null,
        trieuChung: null,
        dienBienBenh: null,
        maBn: "DCPK21062800004",
        dienThoai: "+84-988616887",
        soCmnd: "2250198578",
        hoTen: "Lê Bá Quốc Thịnh",
        diaChi: "189/6A Điện Biên Phủ",
        quocTich: "VN",
        tinhThanh: "701",
        quanHuyen: "70129",
        phuongXa: "7012921",
        gioiTinh: "M",
        tenGioiTinh: "Nam",
        tenPhuongXa: "Phường 15",
        tenQuanHuyen: "Quận Bình Thạnh",
        tenTinhThanh: "Hồ Chí Minh",
        danToc: "25",
        ngheNghiep: "NVVP",
        ttHonnhan: "KH",
        nguoiThanHoTen: "",
        nguoiThanQuanHe: "",
        nguonGioithieu: null,
        nguoiGt: "1",
        ngaySinh: null,
        thangSinh: null,
        namSinh: 1989,
        email: "quocthinh.le@doctorcheck.vn",
        anh: null,
        daKichHoat: null,
        ngayCapNhat: DateTime.parse("2021-06-30T00:00:00+07:00"),
        trangThai: "Chờ_thực_hiện",
        ngayBacSiChiDinh: DateTime.parse("2021-06-28T11:36:00+07:00"),
        ngay: DateTime.parse("2021-06-28T00:00:00+07:00"),
        tgVao: DateTime.parse("2021-06-28T11:36:00+07:00"),
        daChiHoaHongBscd: false,
        active: "active",
        medTrangThai: "Done"),
  ],
);
