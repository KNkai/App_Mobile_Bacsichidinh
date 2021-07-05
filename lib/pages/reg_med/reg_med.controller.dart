import 'dart:convert';

import 'package:app_mobile_bacsichidinh/components/app_rounded_loading_button.dart';
import 'package:app_mobile_bacsichidinh/models/appoint_med_reg.model.dart';
import 'package:app_mobile_bacsichidinh/models/customer.model.dart';
import 'package:app_mobile_bacsichidinh/models/group_service.model.dart';
import 'package:app_mobile_bacsichidinh/models/med_services.model.dart';
import 'package:app_mobile_bacsichidinh/models/success_reg.model.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/pages/success_reg_med/success_reg_med.page.dart';
import 'package:app_mobile_bacsichidinh/repositories/reg_med/reg_med.repo.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_utils.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegMedController extends GetxController
    with SingleGetTickerProviderMixin {
  final Customer customer;
  // final Customer customer;

  Rx<double> totalPrice = 0.0.obs;

  RegMedController({required this.customer});
  final diagnoisTextController = TextEditingController();
  final diagnoisFocusController = FocusNode();
  final noteTextController = TextEditingController();
  final noteFocusController = FocusNode();

  var isExamine = true.obs;

  var acceptDiagnoisBtn = RoundedLoadingButtonController();
  var acceptServiceBtn = RoundedLoadingButtonController();

  late TabController tabController;

  PageController pageController = PageController();

  var scrollController = ScrollController();

  var isCheck = false.obs;

  final regMedRepo = RegMedRepositories();

  var listGroupService = <GroupService>[].obs;
  List<MedService> listMedServices = <MedService>[].obs;

  AppointMedRed appointMedRed = AppointMedRed();
  SuccessReg successReg = SuccessReg();

  final HomeController homeController = Get.find();

  List<Future> futureList = [];

  @override
  void onInit() async {
    tabController = TabController(length: 2, vsync: this);
    await getAllGroupServices();
    loadingDialog();
    await 2.delay();
    Get.back();
    getAndSetAppointRegMed();
    super.onInit();
  }

  loadingDialog() {
    return Get.defaultDialog(
      barrierDismissible: false,
      content: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
        ),
      ),
      title: "",
    );
  }

  getAndSetAppointRegMed() async {
    appointMedRed = await regMedRepo.fetchAppointRegMed(
      doctorId: homeController.currentUser!.doctorId,
      customerBarcode: customer.ma!,
    );
    diagnoisTextController.text =
        appointMedRed.appointMedRedCombine!.med == null
            ? ''
            : appointMedRed.appointMedRedCombine!.med!.chanDoanChinh!;
    noteTextController.text = appointMedRed.appointMedRedCombine!.med == null
        ? ''
        : appointMedRed.appointMedRedCombine!.med!.ghiChu!;
    // isExamine.value = appointMedRed.appointMedRedCombine!.med == null
    //     ? true
    //     : appointMedRed.appointMedRedCombine!.med!.isExam!;
    if (appointMedRed.appointMedRedCombine!.medServices != null)
      appointMedRed.appointMedRedCombine!.medServices!.forEach((e) {
        for (var item in listGroupService) {
          for (var subItem in item.listService!) {
            if (e.ma == subItem.ma) subItem.selection = true;
          }
        }
      });
    getTotalAmount();
    // print(appointMedRed.appointMedRedCombine!.medServices![0].serviceName);
  }

  Future getAllGroupServices() async {
    listGroupService.value = await regMedRepo.fetchGroupServices();

    listGroupService.forEach((e) async {
      listMedServices = await regMedRepo.fetchServicesById(e.serviceGroupId);
      e.listService = [];
      e.listService!.addAll(listMedServices);
      listGroupService.refresh();
      update();
    });
  }

  getTotalAmount() {
    totalPrice.value = 0.0;
    for (var item in listGroupService) {
      for (var subItem in item.listService!) {
        if (subItem.selection) totalPrice.value += subItem.giaThucTe as double;
      }
    }
  }

  GroupService convertBaseGroupServices(GroupService groupService) {
    GroupService baseGroupService = GroupService(
      serviceGroupId: groupService.serviceGroupId,
      serviceGroupName: groupService.serviceGroupName,
      orderNo: groupService.orderNo,
      // description: groupService.description,
      sType: groupService.sType,
      listService: <MedService>[],
    );
    return baseGroupService;
  }

  String address() {
    String add = interpolate([
      customer.diaChi ?? '',
      customer.tenPhuongXa ?? '',
      customer.tenQuanHuyen ?? '',
      customer.tenTinhThanh ?? '',
    ]);
    return add;
  }
  // String address() {
  //   String add = interpolate([
  //     customer.cAddress ?? '',
  //     customer.wardName ?? '',
  //     customer.districtName ?? '',
  //     customer.provinceName ?? '',
  //   ]);
  //   return add;
  // }

  goToServicesPage() async {
    await 0.5.delay();
    acceptDiagnoisBtn.success();
    await 0.5.delay();
    nextPageView(tabController);
    acceptDiagnoisBtn.reset();
  }

  backToDiagnoisePage() async {
    acceptServiceBtn.success();
    await 0.5.delay();
    previousPageView(tabController);
    acceptServiceBtn.reset();
  }

  registerByDoctor() async {
    if (getAllServiceId().length != 0) {
      successReg = await regMedRepo.registerByDoctor(
        doctorId: homeController.currentUser!.doctorId,
        clinicId: 2,

        // customerId: customer.ma!,
        medChanDoan: diagnoisTextController.text,
        bookingNote: noteTextController.text,
        serviceIds: getAllServiceId(),
        customerRefCode: customer.ma!,
        doctorName: homeController.currentUser!.fullname ?? '',
      );
      acceptServiceBtn.success();
      await 0.5.delay();
      Get.to(SuccessRegMedPage());
    } else {
      snackBarError('Bạn chưa chọn dịch vụ nào!');
      await 0.5.delay();
      acceptServiceBtn.reset();
    }
  }

  List<String> getAllServiceId() {
    List<String> listServiceIds = [];
    for (var item in listGroupService) {
      for (var subItem in item.listService!) {
        if (subItem.selection) listServiceIds.add(subItem.ma!);
      }
    }
    return listServiceIds;
  }
}

nextPageView(TabController tabController) {
  tabController.animateTo(1);
}

previousPageView(TabController tabController) {
  tabController.animateTo(0);
}
