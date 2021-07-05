import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_btn.dart';
import 'package:app_mobile_bacsichidinh/components/app_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/models/customer.model.dart';
import 'package:app_mobile_bacsichidinh/pages/reg_new_customer/reg_new_customer.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class RegNewCustomer extends StatelessWidget {
  final Customer customerTemp;
  const RegNewCustomer({Key? key, required this.customerTemp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // appBar: AppBarCustom.appBarNomal("Thống Kê"),
      child: GetBuilder<RegNewCustomerController>(
        init: RegNewCustomerController(),
        builder: (controller) {
          customerTemp.gioiTinh == GioiTinh.M
              ? controller.gender.value = true
              : controller.gender.value = false;
          return Column(
            children: [
              AppBarCustom.appBarNomal("Đăng Ký Mới"),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.kConstantPadding * 2),
                child: AppCard(
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text('Xác nhận thông tin khách hàng'),
                        const SizedBox(height: AppSize.kConstantPadding),
                        Container(
                          child: Row(
                            children: [
                              Text("Tên: ${customerTemp.hoTen}"),
                              const Spacer(),
                              Obx(
                                () => FlutterSwitch(
                                  value: controller.gender.value,
                                  onToggle: (val) {
                                    controller.onChangeGender(val);
                                  },
                                  activeText: "Nam",
                                  inactiveText: "Nữ",
                                  showOnOff: true,
                                  width: Get.width / 4,
                                  height: AppSize.kConstantPadding * 4.5,
                                  padding: AppSize.kConstantPadding,
                                  activeColor: AppColor.primary,
                                  inactiveColor: AppColor.second,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSize.kConstantPadding),
                        Container(
                          child: Row(
                            children: [
                              Text("Năm sinh: ${customerTemp.namSinh}"),
                              const Spacer(),
                              Text(
                                  "${DateTime.now().year - (customerTemp.namSinh as num)} Tuổi"),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSize.kConstantPadding),
                        Container(
                          child: Row(
                            children: [
                              Text("Số điện thoại: ${customerTemp.dienThoai}"),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSize.kConstantPadding * 5),
                        AppBtnLoading(
                          controller: controller.regBtnController,
                          onTap: () => controller.regCustomer(customerTemp),
                          title: "Đăng ký khám chỉ định",
                          height: 50,
                          width: Get.width / 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
