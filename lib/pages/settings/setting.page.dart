import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/pages/settings/setting.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: GetBuilder<SettingController>(
        init: SettingController(),
        builder: (controller) {
          return Column(
            children: [
              AppBarCustom.appBarNomal("Cài Đặt"),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(AppSize.kConstantPadding),
                          child: Row(
                            children: [
                              Text("Ảnh nền"),
                              const Spacer(),
                              FlutterSwitch(
                                value: controller.isBackGround!,
                                onToggle: (val) =>
                                    controller.onChangeBackground(val),
                                activeText: "Hình ảnh",
                                inactiveText: "Đơn sắc",
                                showOnOff: true,
                                width: Get.width / 3,
                                height: AppSize.kConstantPadding * 4.5,
                                padding: AppSize.kConstantPadding,
                                activeColor: AppColor.primary,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            for (var item in controller.isBackGround!
                                ? controller.listBackground
                                    .where((e) => e.type == 2)
                                : controller.listBackground
                                    .where((e) => e.type == 1))
                              InkWell(
                                onTap: () =>
                                    controller.onSelectBackground(item.id),
                                child: Container(
                                  width: Get.width / 5,
                                  height: Get.width / 5,
                                  child: Stack(
                                    children: [
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: AppColor.primary,
                                              width: 3,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                AppSize.borderRadius),
                                            image: item.type == 2
                                                ? DecorationImage(
                                                    image:
                                                        NetworkImage(item.data),
                                                    fit: BoxFit.fitHeight,
                                                  )
                                                : null,
                                            color: item.type == 1
                                                ? HexColor.fromHex(item.data)
                                                : AppColor.white,
                                          ),
                                        ),
                                      ),
                                      if (controller.select == item.id)
                                        Positioned(
                                          top: 5,
                                          right: 5,
                                          child: Icon(
                                            Icons.check_rounded,
                                            color: AppColor.primary,
                                            size: 30,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: AppSize.kConstantPadding * 3),
                        Padding(
                          padding: EdgeInsets.all(AppSize.kConstantPadding),
                          child: Row(
                            children: [
                              Text("Đăng nhập một lần"),
                              const Spacer(),
                              FlutterSwitch(
                                value: controller.onlyLogin!,
                                onToggle: (val) =>
                                    controller.onChangeOnlyLogin(val),
                                activeText: "Có",
                                inactiveText: "Không",
                                showOnOff: true,
                                width: Get.width / 3,
                                height: AppSize.kConstantPadding * 4.5,
                                padding: AppSize.kConstantPadding,
                                activeColor: AppColor.primary,
                              ),
                            ],
                          ),
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
