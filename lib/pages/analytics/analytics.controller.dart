import 'package:app_mobile_bacsichidinh/components/app_rounded_loading_button.dart';
import 'package:app_mobile_bacsichidinh/models/med_affiliate_report.model.dart';
import 'package:app_mobile_bacsichidinh/models/med_commission.model.dart';
import 'package:app_mobile_bacsichidinh/models/paging.model.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/repositories/analytics/analytics.repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AnalyticsController extends GetxController {
  final pageSize = 10;
  var pageNumber = 1;
  final startDate = DateTime.now().subtract(const Duration(days: 4)).obs;
  final endDate = DateTime.now().add(const Duration(days: 3)).obs;
  String range = '';
  final Rx<FilterAnalyticsType> currentType = FilterAnalyticsType.TOTAL.obs;
  final AnalyticRepositories analyticRepo = AnalyticRepositories();
  ScrollController? scrollController;
  // ignore: deprecated_member_use

  final HomeController homeController = Get.find();
  final RoundedLoadingButtonController filterBtnController =
      RoundedLoadingButtonController();
  var medCommissionModelRequiredBase;

  @override
  void onInit() {
    getListMedCommission();
    getMedAffiliateReport();
    scrollController = ScrollController()
      ..addListener(() async {
        if (scrollController!.position.pixels ==
            scrollController!.position.maxScrollExtent) {
          getListMedCommissionLoadMore();
        }
      });
    super.onInit();
  }

  ///Med-affiliate-report
  final medAffiliateReport = MedAffiliateReport(
    message: '',
    status: false,
    clientIp: '',
    medAffiliateReportCombine: MedAffiliateReportCombine(
      commissions: [],
      med: Med(),
      medCommissionCurrent: MedCommissionCurrent(),
    ),
  ).obs;
  getMedAffiliateReport() async {
    medAffiliateReport.value = await analyticRepo.fetchMedAffiliateReport(
        doctorId: homeController.currentUser!.doctorId);
  }

  ///Med-Commissions
  final medCommissionAll = MedCommissionAll(
          totalItems: 0,
          message: '',
          medCommissionCombine: MedCommissionCombine(
            listMedCommission: [],
            paging: Paging(
              hasNextPage: false,
              hasPreviousPage: false,
              pageNumber: 0,
              pageSize: 10,
              totalCount: 0,
              totalPage: 0,
            ),
          ),
          status: false,
          clientIp: '')
      .obs;

  getListMedCommission() async {
    medCommissionAll.value.medCommissionCombine!.listMedCommission!.clear();
    pageNumber = 1;
    medCommissionModelRequiredBase = MedCommissionModelRequired(
      doctorId: homeController.currentUser!.doctorId,
      clinicId: '2',
      commissionType: FilterAnalyticsTypeModel.listFilterAnalytics
          .where((e) => e.analyticsType == currentType.value)
          .first
          .type,
      startDate: DateFormat('yyyy-MM-dd').format(startDate.value).toString(),
      endDate: DateFormat('yyyy-MM-dd').format(endDate.value).toString(),
      pageSize: pageSize,
      pageNumber: pageNumber,
    );
    medCommissionAll.value = await analyticRepo.fetchMedCommissions(
      medCommissionModelRequired: medCommissionModelRequiredBase,
    );
  }

  getListMedCommissionLoadMore() async {
    var medCommissionModelRequiredBaseLoadmore = MedCommissionModelRequired(
      doctorId: homeController.currentUser!.doctorId,
      clinicId: '2',
      commissionType: FilterAnalyticsTypeModel.listFilterAnalytics
          .where((e) => e.analyticsType == currentType.value)
          .first
          .type,
      startDate: DateFormat('yyyy-MM-dd').format(startDate.value).toString(),
      endDate: DateFormat('yyyy-MM-dd').format(endDate.value).toString(),
      pageSize: pageSize,
      pageNumber: pageNumber,
    );
    if (pageNumber <
        medCommissionAll.value.medCommissionCombine!.paging!.totalPage) {
      pageNumber++;
      medCommissionModelRequiredBaseLoadmore.pageNumber = pageNumber;
      medCommissionAll.value.medCommissionCombine!.listMedCommission!
          .addAll((await analyticRepo.fetchMedCommissions(
        medCommissionModelRequired: medCommissionModelRequiredBaseLoadmore,
      ))
              .medCommissionCombine!
              .listMedCommission!);
    }
    medCommissionAll.refresh();
    // print(pageNumber);
    // medCommissionAll.value.medCommissionCombine.listMedCommission.forEach((e) {
    //   print(e.barcode);
    // });
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      startDate.value = args.value.startDate;
      endDate.value = args.value.endDate ?? args.value.startDate;
      range = DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
          ' - ' +
          DateFormat('dd/MM/yyyy')
              .format(args.value.endDate ?? args.value.startDate)
              .toString();
    }
  }
}

enum FilterAnalyticsType {
  TOTAL,
  SUCCESS,
  WAITING,
  CANCEL,
}

class FilterAnalyticsTypeModel {
  final FilterAnalyticsType analyticsType;
  final String title;
  final int type;

  FilterAnalyticsTypeModel(
      {required this.type, required this.analyticsType, required this.title});

  static final listFilterAnalytics = [
    FilterAnalyticsTypeModel(
        type: 0, analyticsType: FilterAnalyticsType.TOTAL, title: "Tất cả"),
    FilterAnalyticsTypeModel(
        type: 1,
        analyticsType: FilterAnalyticsType.SUCCESS,
        title: "Đã thanh toán"),
    FilterAnalyticsTypeModel(
        type: 2,
        analyticsType: FilterAnalyticsType.WAITING,
        title: "Đang chờ thực hiện"),
    FilterAnalyticsTypeModel(
        type: 3, analyticsType: FilterAnalyticsType.CANCEL, title: "Đã hủy"),
  ];
}
