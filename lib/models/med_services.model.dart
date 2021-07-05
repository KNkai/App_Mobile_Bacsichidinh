/*
class MedService {
  MedService({
    this.serviceId,
    this.serviceRefCode,
    this.sType,
    this.serviceCategoryId,
    this.serviceGroupId,
    this.serviceGroupName,
    this.serviceName,
    this.serviceMeaning,
    this.servicePrices,
    this.durationMinutes,
    this.servicePricesReality,
    this.affiliateCommissions,
    this.isPromotions,
    this.selection = false,
  });

  int? serviceId;
  String? serviceRefCode;
  String? sType;
  int? serviceCategoryId;
  int? serviceGroupId;
  String? serviceGroupName;
  String? serviceName;
  String? serviceMeaning;
  double? servicePrices;
  int? durationMinutes;
  double? servicePricesReality;
  double? affiliateCommissions;
  bool? isPromotions;
  bool selection;

  factory MedService.fromJson(Map<String, dynamic> json) => MedService(
        serviceId: json["service_id"] == null ? null : json["service_id"],
        serviceRefCode:
            json["service_ref_code"] == null ? null : json["service_ref_code"],
        sType: json["s_type"] == null ? null : json["s_type"],
        serviceCategoryId: json["service_category_id"] == null
            ? null
            : json["service_category_id"],
        serviceGroupId:
            json["service_group_id"] == null ? null : json["service_group_id"],
        serviceGroupName: json["service_group_name"] == null
            ? null
            : json["service_group_name"],
        serviceName: json["service_name"] == null ? null : json["service_name"],
        serviceMeaning:
            json["service_meaning"] == null ? null : json["service_meaning"],
        servicePrices:
            json["service_prices"] == null ? null : json["service_prices"],
        durationMinutes:
            json["duration_minutes"] == null ? null : json["duration_minutes"],
        servicePricesReality: json["service_prices_reality"] == null
            ? null
            : json["service_prices_reality"],
        affiliateCommissions: json["affiliate_commissions"] == null
            ? null
            : json["affiliate_commissions"],
        isPromotions:
            json["is_promotions"] == null ? null : json["is_promotions"],
      );

  Map<String, dynamic> toJson() => {
        "service_id": serviceId == null ? null : serviceId,
        "service_ref_code": serviceRefCode == null ? null : serviceRefCode,
        "s_type": sType == null ? null : sType,
        "service_category_id":
            serviceCategoryId == null ? null : serviceCategoryId,
        "service_group_id": serviceGroupId == null ? null : serviceGroupId,
        "service_group_name":
            serviceGroupName == null ? null : serviceGroupName,
        "service_name": serviceName == null ? null : serviceName,
        "service_meaning": serviceMeaning == null ? null : serviceMeaning,
        "service_prices": servicePrices == null ? null : servicePrices,
        "duration_minutes": durationMinutes == null ? null : durationMinutes,
        "service_prices_reality":
            servicePricesReality == null ? null : servicePricesReality,
        "affiliate_commissions":
            affiliateCommissions == null ? null : affiliateCommissions,
        "is_promotions": isPromotions == null ? null : isPromotions,
      };
}
*/

class MedService {
  MedService({
    this.ma,
    this.ten,
    this.yNghia,
    this.nhom,
    this.tenNhom,
    this.giaGoc,
    this.giaThucTe,
    this.hoaHongBacSiChiDinh,
    this.selection = false,
  });

  String? ma;
  String? ten;
  dynamic? yNghia;
  String? nhom;
  String? tenNhom;
  double? giaGoc;
  double? giaThucTe;
  double? hoaHongBacSiChiDinh;
  bool selection;

  factory MedService.fromJson(Map<String, dynamic> json) => MedService(
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
      );

  Map<String, dynamic> toJson() => {
        "Ma": ma == null ? null : ma,
        "Ten": ten == null ? null : ten,
        "YNghia": yNghia,
        "Nhom": nhom == null ? null : nhom,
        "TenNhom": tenNhom == null ? null : tenNhom,
        "GiaGoc": giaGoc == null ? null : giaGoc,
        "GiaThucTe": giaThucTe == null ? null : giaThucTe,
        "HoaHongBacSiChiDinh":
            hoaHongBacSiChiDinh == null ? null : hoaHongBacSiChiDinh,
      };
}
