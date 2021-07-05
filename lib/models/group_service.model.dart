import 'package:app_mobile_bacsichidinh/models/med_services.model.dart';

class GroupService {
  GroupService({
    required this.serviceGroupId,
    required this.serviceGroupName,
    required this.orderNo,
    // required this.description,
    required this.sType,
    this.listService,
  });

  final String serviceGroupId;
  final String serviceGroupName;
  final int orderNo;
  // final String description;
  final String sType;
  List<MedService>? listService;

  factory GroupService.fromJson(Map<String, dynamic> json) => GroupService(
        serviceGroupId: json["Ma"] == null ? null : json["Ma"],
        serviceGroupName: json["Ten"] == null ? null : json["Ten"],
        sType: json["PhanLoai"] == null ? null : json["PhanLoai"],
        orderNo: json["STT"] == null ? null : json["STT"],
      );

  // Map<String, dynamic> toJson() => {
  //       "service_group_id": serviceGroupId == null ? null : serviceGroupId,
  //       "service_group_name":
  //           serviceGroupName == null ? null : serviceGroupName,
  //       "order_no": orderNo == null ? null : orderNo,
  //       "description": description == null ? null : description,
  //       "s_type": sType == null ? null : sType,
  //     };
}
