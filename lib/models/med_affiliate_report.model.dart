import 'dart:ffi';

class MedAffiliateReport {
  MedAffiliateReport({
    required this.medAffiliateReportCombine,
    required this.message,
    required this.status,
    required this.clientIp,
  });

  MedAffiliateReportCombine medAffiliateReportCombine;
  String message;
  bool status;
  String clientIp;

  factory MedAffiliateReport.fromJson(Map<String, dynamic> json) =>
      MedAffiliateReport(
        medAffiliateReportCombine:
            MedAffiliateReportCombine.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        status: json["status"] == null ? null : json["status"],
        clientIp: json["client_ip"] == null ? null : json["client_ip"],
      );
}

class MedAffiliateReportCombine {
  MedAffiliateReportCombine({
    required this.med,
    required this.medCommissionCurrent,
    required this.commissions,
  });

  Med med;
  MedCommissionCurrent medCommissionCurrent;
  List<Commission> commissions;

  factory MedAffiliateReportCombine.fromJson(Map<String, dynamic> json) =>
      MedAffiliateReportCombine(
        med: Med.fromJson(json["med"]),
        medCommissionCurrent:
            MedCommissionCurrent.fromJson(json["med_commission"]),
        commissions: List<Commission>.from(
            json["commissions"].map((x) => Commission.fromJson(x))),
      );
}

// class Commission {
//   Commission({
//     required this.affiliateCommissionId,
//     required this.levelName,
//     required this.minMedPhase,
//     required this.maxMedPhase,
//     required this.bonusValue,
//     required this.orderNo,
//     required this.description,
//     required this.isMore,
//   });

//   int affiliateCommissionId;
//   String levelName;
//   int minMedPhase;
//   int maxMedPhase;
//   double bonusValue;
//   int orderNo;
//   dynamic description;
//   bool isMore;

//   factory Commission.fromJson(Map<String, dynamic> json) => Commission(
//         affiliateCommissionId: json["affiliate_commission_id"] == null
//             ? null
//             : json["affiliate_commission_id"],
//         levelName: json["level_name"] == null ? null : json["level_name"],
//         minMedPhase:
//             json["min_med_phase"] == null ? null : json["min_med_phase"],
//         maxMedPhase:
//             json["max_med_phase"] == null ? null : json["max_med_phase"],
//         bonusValue: json["bonus_value"] == null ? null : json["bonus_value"],
//         orderNo: json["order_no"] == null ? null : json["order_no"],
//         description: json["description"],
//         isMore: json["is_more"] == null ? null : json["is_more"],
//       );
// }

class Commission {
  Commission({
    this.id,
    this.tenCapDo,
    this.giaTriMin,
    this.giaTriMax,
    this.heSoHoaHong,
    this.sapXep,
    this.ghiChu,
    this.capDoCaoNhat,
  });

  int? id;
  String? tenCapDo;
  int? giaTriMin;
  int? giaTriMax;
  double? heSoHoaHong;
  int? sapXep;
  dynamic? ghiChu;
  bool? capDoCaoNhat;

  factory Commission.fromJson(Map<String, dynamic> json) => Commission(
        id: json["ID"] == null ? null : json["ID"],
        tenCapDo: json["TenCapDo"] == null ? null : json["TenCapDo"],
        giaTriMin: json["GiaTriMin"] == null ? null : json["GiaTriMin"],
        giaTriMax: json["GiaTriMax"] == null ? null : json["GiaTriMax"],
        heSoHoaHong: json["HeSoHoaHong"] == null ? null : json["HeSoHoaHong"],
        sapXep: json["SapXep"] == null ? null : json["SapXep"],
        ghiChu: json["GhiChu"],
        capDoCaoNhat:
            json["CapDoCaoNhat"] == null ? null : json["CapDoCaoNhat"],
      );
}

class Med {
  Med({
    this.medTotals,
    this.medSuccess,
    this.medWaiting,
    this.medCancel,
    this.medToday,
    this.medThisWeek,
    this.medLastWeek,
    this.medThisMonth,
    this.medLastMonth,
    this.medMoneysWaiting,
    this.medMoneysToday,
    this.medMoneysThisWeek,
    this.medMoneysLastWeek,
    this.medMoneysThisMonth,
    this.medMoneysLastMonth,
  });

  int? medTotals;
  int? medSuccess;
  int? medWaiting;
  int? medCancel;
  int? medToday;
  int? medThisWeek;
  int? medLastWeek;
  int? medThisMonth;
  int? medLastMonth;
  double? medMoneysWaiting;
  double? medMoneysToday;
  double? medMoneysThisWeek;
  double? medMoneysLastWeek;
  double? medMoneysThisMonth;
  double? medMoneysLastMonth;

  factory Med.fromJson(Map<String, dynamic> json) => Med(
        medTotals: json["med_totals"] == null ? null : json["med_totals"],
        medSuccess: json["med_success"] == null ? null : json["med_success"],
        medWaiting: json["med_waiting"] == null ? null : json["med_waiting"],
        medCancel: json["med_cancel"] == null ? null : json["med_cancel"],
        medToday: json["med_today"] == null ? null : json["med_today"],
        medThisWeek:
            json["med_this_week"] == null ? null : json["med_this_week"],
        medLastWeek:
            json["med_last_week"] == null ? null : json["med_last_week"],
        medThisMonth:
            json["med_this_month"] == null ? null : json["med_this_month"],
        medLastMonth:
            json["med_last_month"] == null ? null : json["med_last_month"],
        medMoneysWaiting: json["med_moneys_waiting"] == null
            ? null
            : json["med_moneys_waiting"],
        medMoneysToday:
            json["med_moneys_today"] == null ? null : json["med_moneys_today"],
        medMoneysThisWeek: json["med_moneys_this_week"] == null
            ? null
            : json["med_moneys_this_week"],
        medMoneysLastWeek: json["med_moneys_last_week"] == null
            ? null
            : json["med_moneys_last_week"],
        medMoneysThisMonth: json["med_moneys_this_month"] == null
            ? null
            : json["med_moneys_this_month"],
        medMoneysLastMonth: json["med_moneys_last_month"] == null
            ? null
            : json["med_moneys_last_month"],
      );
}

class MedCommissionCurrent {
  MedCommissionCurrent({
    this.currentLevelName,
    this.currentBonusValue,
    this.nextLevelName,
    this.nextBonusValue,
    this.leftMedNextLevel,
    this.isMaxLevel,
  });

  String? currentLevelName;
  double? currentBonusValue;
  String? nextLevelName;
  double? nextBonusValue;
  int? leftMedNextLevel;
  bool? isMaxLevel;

  factory MedCommissionCurrent.fromJson(Map<String, dynamic> json) =>
      MedCommissionCurrent(
        currentLevelName: json["current_level_name"] == null
            ? null
            : json["current_level_name"],
        currentBonusValue: json["current_bonus_value"] == null
            ? null
            : json["current_bonus_value"],
        nextLevelName:
            json["next_level_name"] == null ? null : json["next_level_name"],
        nextBonusValue:
            json["next_bonus_value"] == null ? null : json["next_bonus_value"],
        leftMedNextLevel: json["left_med_next_level"] == null
            ? null
            : json["left_med_next_level"],
        isMaxLevel: json["is_max_level"] == null ? null : json["is_max_level"],
      );
}
