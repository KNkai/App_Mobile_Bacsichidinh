import 'package:app_mobile_bacsichidinh/components/app_btn.dart';
import 'package:app_mobile_bacsichidinh/components/app_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_table.dart';
import 'package:app_mobile_bacsichidinh/pages/reg_med/reg_med.page.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.controller.dart';

class HomeListCustomer extends StatelessWidget {
  const HomeListCustomer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();
    return Column(children: [
      AppCard(
        child: Row(
          children: [
            const SizedBox(width: AppSize.kConstantPadding),
            Expanded(
              child: TextField(
                controller: controller.searchTextField,
                focusNode: controller.searchFocusNode,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Tìm kiếm nhanh khách hàng...",
                  hintStyle: TextStyle(fontStyle: FontStyle.italic),
                  // prefixIcon: Icon(
                  //   Icons.search,
                  //   color: AppColor.primary,
                  // ),
                ),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(width: AppSize.kConstantPadding),
            SizedBox(
              width: 50,
              child: AppBtnLoading(
                controller: controller.btnSearchController,
                onTap: () async {
                  controller.searchFocusNode.unfocus();
                  if (controller.searchTextField.text == '') {
                    await controller.getCustomerOverView();
                    controller.isSearch.value = false;
                  } else {
                    await controller.getCustomerSearchOverView();
                    controller.isSearch.value = true;
                  }

                  controller.btnSearchController.success();
                  await 1.delay();
                  controller.btnSearchController.reset();
                },
                title: '',
                centerWidget: Icon(Icons.search),
              ),
            ),
          ],
        ),
      ),
      Obx(() {
        return controller.isSearch.value
            ? _ListSearchHomeCustomer(controller: controller)
            : _ListHomeCustomer(controller: controller);
      }),
    ]);
  }
}

class _ListHomeCustomer extends StatelessWidget {
  const _ListHomeCustomer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Obx(() {
        if (controller.customerOverview.value.customerOverviewCombine != null) {
          return AppTable(
            title: controller.customerOverview.value.customerOverviewCombine!
                        .listCustomer!.length ==
                    0
                ? "Chưa có khách hàng nào."
                : 'Khách hàng được chỉ định',
            action: const SizedBox.shrink(),
            listItem: [
              for (var item in controller.customerOverview.value
                  .customerOverviewCombine!.listCustomer!)
                InkWell(
                  onTap: () async {
                    await Get.to(
                      RegMed(customer: item),
                      preventDuplicates: false,
                    );
                  },
                  child: ItemTableUser(
                    name: item.hoTen!,
                    address: interpolate([
                          item.diaChi!,
                          item.tenPhuongXa == null ? '' : item.tenPhuongXa!,
                          item.tenQuanHuyen == null ? '' : item.tenQuanHuyen!,
                          item.tenTinhThanh == null ? '' : item.tenTinhThanh!,
                        ]) ??
                        '',
                    // address: interpolate([
                    //       item.cAddress!,
                    //       item.wardName == null ? '' : item.wardName!,
                    //       item.districtName == null ? '' : item.districtName!,
                    //       item.provinceName == null ? '' : item.provinceName!,
                    //     ]) ??
                    //     '',
                  ),
                ),
            ],
          );
        } else {
          return Container(
            child: Text("Chưa có khách hàng nào."),
          );
        }
      }),
    );
  }
}

class _ListSearchHomeCustomer extends StatelessWidget {
  const _ListSearchHomeCustomer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Obx(() {
        if (controller.customerSearchOverview.value.customerOverviewCombine !=
            null) {
          print(
              "in trong view: ${controller.customerSearchOverview.value.customerOverviewCombine!.listCustomer!.length}");
          return AppTable(
            title: controller.customerSearchOverview.value
                        .customerOverviewCombine!.listCustomer!.length ==
                    0
                ? "Không tìm thấy khách hàng nào"
                : '${controller.customerSearchOverview.value.customerOverviewCombine!.listCustomer!.length} khách hàng được tìm thấy',
            action: const SizedBox.shrink(),
            listItem: [
              for (var item in controller.customerSearchOverview.value
                  .customerOverviewCombine!.listCustomer!)
                InkWell(
                  onTap: () async {
                    await Get.to(
                      RegMed(customer: item),
                      preventDuplicates: false,
                    );
                  },
                  child: ItemTableUser(
                    name: item.hoTen!,
                    address: interpolate([
                          item.diaChi!,
                          item.tenPhuongXa == null ? '' : item.tenPhuongXa!,
                          item.tenQuanHuyen == null ? '' : item.tenQuanHuyen!,
                          item.tenTinhThanh == null ? '' : item.tenTinhThanh!,
                        ]) ??
                        '',
                    // address: interpolate([
                    //       item.cAddress!,
                    //       item.wardName == null ? '' : item.wardName!,
                    //       item.districtName == null ? '' : item.districtName!,
                    //       item.provinceName == null ? '' : item.provinceName!,
                    //     ]) ??
                    //     '',
                  ),
                ),
            ],
          );
        } else {
          return Container(
            child: Text("Chưa có khách hàng nào."),
          );
        }
      }),
    );
  }
}
