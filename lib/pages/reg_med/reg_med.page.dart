import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_btn.dart';
import 'package:app_mobile_bacsichidinh/components/app_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_expansion_tile_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/models/customer.model.dart';
import 'package:app_mobile_bacsichidinh/pages/reg_med/reg_med.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_convert.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:app_mobile_bacsichidinh/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegMed extends StatelessWidget {
  final Customer customer;
  // final Customer customer;
  const RegMed({Key? key, required this.customer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // appBar: AppBarCustom.appBarNomal("Thống Kê"),
      child: GetBuilder<RegMedController>(
        init: RegMedController(customer: customer),
        builder: (controller) {
          return Column(
            children: [
              AppBarCustom.appBarNomal("Đăng Ký Khám Chỉ Định"),
              Expanded(
                child: Container(
                  width: double.infinity,
                  // height: Get.height * (3 / 4),
                  padding: const EdgeInsets.only(
                    left: AppSize.kConstantPadding * 2,
                    right: AppSize.kConstantPadding * 2,
                    bottom: AppSize.kConstantPadding,
                  ),
                  child: DefaultTabController(
                    length: 2,
                    child: Container(
                      // height: Get.height,
                      child: TabBarView(
                        controller: controller.tabController,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          DiagnoisPage(
                            controller: controller,
                            customer: customer,
                          ),
                          ServicesPage(
                            customer: customer,
                            controller: controller,
                          ),
                        ],
                      ),
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

class DiagnoisPage extends StatelessWidget {
  const DiagnoisPage({
    Key? key,
    required this.customer,
    required this.controller,
  }) : super(key: key);

  final Customer customer;
  final RegMedController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InformationCustomer(
            customer: customer,
            address: controller.address(),
            isRegMed: true,
          ),
          _DiagnoisField(controller: controller),
          _NoteWidget(controller: controller),
          const SizedBox(height: AppSize.kConstantPadding),
          if (false)
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Xác nhận khám"),
                  const SizedBox(width: AppSize.kConstantPadding),
                  // Obx(
                  //   () => FlutterSwitch(
                  //     value: controller.isExamine.value,
                  //     onToggle: (val) {
                  //       controller.isExamine.value = val;
                  //     },
                  //     activeText: "Có",
                  //     inactiveText: "Không",
                  //     showOnOff: true,
                  //     width: Get.width / 4,
                  //     height: AppSize.kConstantPadding * 4.5,
                  //     padding: AppSize.kConstantPadding,
                  //     activeColor: AppColor.primary,
                  //   ),
                  // ),
                ],
              ),
            ),
          SizedBox(
            height: 100,
            child: AppBtnLoading(
              controller: controller.acceptDiagnoisBtn,
              onTap: () => controller.goToServicesPage(),
              title: "Chọn dịch vụ",
            ),
          ),
        ],
      ),
    );
  }
}

class ServicesPage extends StatelessWidget {
  ServicesPage({
    Key? key,
    required this.customer,
    required this.controller,
  }) : super(key: key);

  final Customer customer;
  final RegMedController controller;

  @override
  Widget build(BuildContext context) {
    return GetX<RegMedController>(builder: (_) {
      return Stack(
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppCard(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Center(
                            child: Text("Chỉ định dịch vụ"),
                          ),
                        ),
                        const SizedBox(height: AppSize.kConstantPadding * 2),
                        for (var item in _.listGroupService)
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: AppSize.kConstantPadding),
                            child: ExpansionTileCard(
                              title: Container(
                                child: Text(
                                  item.serviceGroupName,
                                  style: TextStyle(
                                      color: AppColor.primary,
                                      fontSize: titleSize - 5,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              subtitle: Text(
                                // item.y,
                                "",
                                style: TextStyle(fontSize: subTitleSize),
                              ),
                              // leading: ,
                              children: <Widget>[
                                Divider(
                                  thickness: 1.0,
                                  height: 1.0,
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 8.0,
                                    ),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: List.generate(
                                          item.listService!.length,
                                          (index) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: double.infinity,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          item
                                                              .listService![
                                                                  index]
                                                              .ten!,
                                                          style: TextStyle(
                                                              color: item
                                                                      .listService![
                                                                          index]
                                                                      .selection
                                                                  ? AppColor
                                                                      .second
                                                                  : AppColor
                                                                      .primary),
                                                        ),
                                                        Text(
                                                          appCurrency(item
                                                                  .listService![
                                                                      index]
                                                                  .giaThucTe ??
                                                              0),
                                                          style: TextStyle(
                                                              fontSize:
                                                                  subTitleSize),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Checkbox(
                                                    value: item
                                                        .listService![index]
                                                        .selection,
                                                    onChanged: (check) {
                                                      item.listService![index]
                                                          .selection = check!;
                                                      _.getTotalAmount();
                                                      _.listGroupService
                                                          .refresh();
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  AppCard(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Center(
                            child: Text("Danh sách dịch vụ đã chỉ định"),
                          ),
                        ),
                        for (var item in controller.listGroupService)
                          for (var subItem in item.listService!)
                            if (subItem.selection)
                              Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            subItem.ten!,
                                            style: TextStyle(
                                              color: AppColor.primary,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          icon: Icon(Icons.delete_forever),
                                          onPressed: () {
                                            subItem.selection = false;
                                            _.getTotalAmount();
                                            _.listGroupService.refresh();
                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        appCurrency(
                                          subItem.giaThucTe,
                                        ),
                                        style: TextStyle(
                                          fontSize: miniTitleSize,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        'Ý nghĩa: ${subItem.yNghia ?? ''}',
                                        style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontStyle: FontStyle.italic,
                                          fontSize: subTitleSize,
                                        ),
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    const Divider(),
                                  ],
                                ),
                              ),
                        const SizedBox(height: AppSize.kConstantPadding * 2),
                      ],
                    ),
                  ),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: AppColor.white,
              height: 100,
              padding: const EdgeInsets.all(AppSize.kConstantPadding / 2),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "TỔNG TIỀN",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primary,
                        ),
                      ),
                      Spacer(),
                      Text(
                        appCurrency(_.totalPrice.value),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.second,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  AppBtnLoading(
                    controller: controller.acceptServiceBtn,
                    onTap: () => controller.registerByDoctor(),
                    title: "ĐĂNG KÝ KHÁM",
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}

class _NoteWidget extends StatelessWidget {
  final RegMedController controller;
  const _NoteWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Text("Ghi chú khác"),
                  const Spacer(),
                  TextButton(
                    onPressed: () => controller.noteFocusController.unfocus(),
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(color: AppColor.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return AppColor.second;
                          }
                          return AppColor
                              .primary; // Use the component's default.
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              controller: controller.noteTextController,
              maxLines: 3,
              focusNode: controller.noteFocusController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Nhập nội dung ghi chú...",
                hintStyle: TextStyle(color: AppColor.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DiagnoisField extends StatelessWidget {
  final RegMedController controller;

  const _DiagnoisField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Text("Chuẩn đoán"),
                  const Spacer(),
                  TextButton(
                    onPressed: () =>
                        controller.diagnoisFocusController.unfocus(),
                    child: Text(
                      "Xác nhận",
                      style: TextStyle(color: AppColor.white),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return AppColor.second;
                          }
                          return AppColor
                              .primary; // Use the component's default.
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextField(
              controller: controller.diagnoisTextController,
              maxLines: 3,
              focusNode: controller.diagnoisFocusController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Nhập nội dung chẩn đoán...",
                hintStyle: TextStyle(color: AppColor.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationCustomer extends StatelessWidget {
  const InformationCustomer({
    Key? key,
    required this.customer,
    required this.address,
    this.isRegMed = false,
  }) : super(key: key);

  final Customer customer;
  final String address;
  final bool isRegMed;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: AppColor.white),
                image: customer.anh == null || customer.anh == ""
                    ? DecorationImage(
                        image: AssetImage(AppAsset.avatar),
                        fit: BoxFit.fitHeight,
                      )
                    : DecorationImage(
                        image: NetworkImage(customer.anh),
                        fit: BoxFit.fitHeight,
                      ),
              ),
            ),
            const SizedBox(height: AppSize.kConstantPadding),
            Text(
              "${customer.hoTen}",
              style: TextStyle(fontSize: titleSize),
            ),
            Text(
                "${customer.gioiTinh == GioiTinh.M ? "Nam" : "Nữ"}, ${DateTime.now().year - customer.namSinh!} Tuổi"),
            const SizedBox(height: AppSize.kConstantPadding / 2),
            Container(
              child: SvgPicture.string(
                buildBarcode(customer.ma!),
                fit: BoxFit.fill,
                width: Get.width / 2,
              ),
            ),
            const SizedBox(height: AppSize.kConstantPadding),
            Container(
              child: Row(
                children: [
                  Text(
                    "Số điện thoại: ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("${customer.dienThoai}"),
                ],
              ),
            ),
            if (customer.soCmnd != '')
              Column(
                children: [
                  const SizedBox(height: AppSize.kConstantPadding),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "CMND/CCCD: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("${customer.soCmnd}"),
                      ],
                    ),
                  ),
                ],
              ),
            if (address != '')
              Column(
                children: [
                  const SizedBox(height: AppSize.kConstantPadding),
                  Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Địa chỉ: ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(address),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            if (isRegMed)
              Column(
                children: [
                  const SizedBox(height: AppSize.kConstantPadding),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Thời gian: ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(DateFormat('HH:MM - dd/MM/yyyy')
                            .format(DateTime.now().add(Duration(minutes: 15)))
                            .toString()),
                      ],
                    ),
                  ),
                ],
              ),
            const SizedBox(height: AppSize.kConstantPadding),
          ],
        ),
      ),
    );
  }
}
