import 'package:app_mobile_bacsichidinh/models/paging.model.dart';

class CustomerOverview {
  CustomerOverview({
    this.customerOverviewCombine,
    this.message,
    this.status,
    this.totalItems,
    this.clientIp,
  });

  CustomerOverviewCombine? customerOverviewCombine;
  String? message;
  bool? status;
  int? totalItems;
  String? clientIp;

  factory CustomerOverview.fromJson(Map<String, dynamic> json) =>
      CustomerOverview(
        customerOverviewCombine: json["data"] == null
            ? null
            : CustomerOverviewCombine.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        totalItems: json["total_items"] == null ? null : json["total_items"],
        clientIp: json["client_ip"] == null ? null : json["client_ip"],
      );
}

class CustomerOverviewCombine {
  CustomerOverviewCombine({
    this.listCustomer,
    this.paging,
  });

  List<Customer>? listCustomer;
  Paging? paging;

  factory CustomerOverviewCombine.fromJson(Map<String, dynamic> json) =>
      CustomerOverviewCombine(
        listCustomer: json["data"] == null
            ? null
            : List<Customer>.from(
                json["data"].map((x) => Customer.fromJson(x))),
        paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
      );
}

class Customer {
  Customer({
    this.rowNumber,
    this.ma,
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
    this.active,
  });

  int? rowNumber;
  String? ma;
  String? dienThoai;
  String? soCmnd;
  String? hoTen;
  String? diaChi;
  QuocTich? quocTich;
  String? tinhThanh;
  String? quanHuyen;
  String? phuongXa;
  GioiTinh? gioiTinh;
  TenGioiTinh? tenGioiTinh;
  String? tenPhuongXa;
  String? tenQuanHuyen;
  String? tenTinhThanh;
  String? danToc;
  String? ngheNghiep;
  TtHonnhan? ttHonnhan;
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
  Active? active;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        rowNumber: json["RowNumber"] == null ? null : json["RowNumber"],
        ma: json["Ma"] == null ? null : json["Ma"],
        dienThoai: json["DienThoai"] == null ? null : json["DienThoai"],
        soCmnd: json["SoCMND"] == null ? null : json["SoCMND"],
        hoTen: json["HoTen"] == null ? null : json["HoTen"],
        diaChi: json["DiaChi"] == null ? null : json["DiaChi"],
        quocTich: json["QuocTich"] == null
            ? null
            : quocTichValues.map![json["QuocTich"]],
        tinhThanh: json["TinhThanh"] == null ? null : json["TinhThanh"],
        quanHuyen: json["QuanHuyen"] == null ? null : json["QuanHuyen"],
        phuongXa: json["PhuongXa"] == null ? null : json["PhuongXa"],
        gioiTinh: json["GioiTinh"] == null
            ? null
            : gioiTinhValues.map![json["GioiTinh"]],
        tenGioiTinh: json["TenGioiTinh"] == null
            ? null
            : tenGioiTinhValues.map![json["TenGioiTinh"]],
        tenPhuongXa: json["TenPhuongXa"] == null ? null : json["TenPhuongXa"],
        tenQuanHuyen:
            json["TenQuanHuyen"] == null ? null : json["TenQuanHuyen"],
        tenTinhThanh:
            json["TenTinhThanh"] == null ? null : json["TenTinhThanh"],
        danToc: json["DanToc"] == null ? null : json["DanToc"],
        ngheNghiep: json["NgheNghiep"] == null ? null : json["NgheNghiep"],
        ttHonnhan: json["TTHonnhan"] == null
            ? null
            : ttHonnhanValues.map![json["TTHonnhan"]],
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
        active:
            json["Active"] == null ? null : activeValues.map![json["Active"]],
      );
}

enum Active { ACTIVE }

final activeValues = EnumValues({"active": Active.ACTIVE});

enum GioiTinh { M, F }

final gioiTinhValues = EnumValues({"F": GioiTinh.F, "M": GioiTinh.M});

enum QuocTich { VN }

final quocTichValues = EnumValues({"VN": QuocTich.VN});

enum TenGioiTinh { NAM, N }

final tenGioiTinhValues =
    EnumValues({"Nữ": TenGioiTinh.N, "Nam": TenGioiTinh.NAM});

enum TtHonnhan { KH, DT, EMPTY }

final ttHonnhanValues =
    EnumValues({"DT": TtHonnhan.DT, "": TtHonnhan.EMPTY, "KH": TtHonnhan.KH});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
