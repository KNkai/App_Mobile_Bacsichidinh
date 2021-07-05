import 'package:app_mobile_bacsichidinh/components/app_btn.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../home.controller.dart';

class HomeQuickBooking extends StatelessWidget {
  const HomeQuickBooking({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find();

    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: AppSize.kConstantPadding * 2),
      child: Card(
        color: Colors.white.withOpacity(0.7),
        child: Padding(
          padding: const EdgeInsets.all(AppSize.kConstantPadding * 2),
          child: Column(
            children: [
              Text(
                "Chỉ định cận lâm sàng mới",
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: AppSize.kConstantPadding),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      child: TextField(
                        controller: controller.fullNameTextField,
                        decoration: InputDecoration(
                          fillColor: AppColor.white,
                          filled: true,
                          labelText: "Họ và tên",
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSize.kConstantPadding * 2),
                          border: InputBorder.none,
                          labelStyle: TextStyle(color: AppColor.primary),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSize.kConstantPadding / 2),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                      child: Container(
                        color: AppColor.white,
                        width: double.infinity,
                        child: DropdownButtonHideUnderline(
                          child: Obx(
                            () => Container(
                              alignment: AlignmentDirectional.center,
                              child: DropdownButton<bool>(
                                style: TextStyle(color: AppColor.primary),
                                value: controller.gender.value,
                                isDense: false,
                                isExpanded: true,
                                items: [
                                  DropdownMenuItem<bool>(
                                    child: Center(child: Text('Nam')),
                                    value: true,
                                  ),
                                  DropdownMenuItem<bool>(
                                    child: Center(child: Text('Nữ')),
                                    value: false,
                                  ),
                                ],
                                onChanged: (_) {
                                  controller.onChangeGender(_);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.kConstantPadding),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                        child: Obx(
                          () => TextField(
                            controller: controller.bodTextField,
                            keyboardType: TextInputType.numberWithOptions(
                                decimal: false, signed: false),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 4,
                            onChanged: (_) {
                              if (_.length == 4) {
                                if (int.parse(_) > DateTime.now().year ||
                                    int.parse(_) < 1900) {
                                  controller.bodValidate.value = true;

                                  controller.ageTextField.value = 'Tuổi';
                                } else {
                                  controller.bodValidate.value = false;
                                  controller.ageTextField.value =
                                      "${DateTime.now().year - int.parse(_)}";
                                }
                              } else {
                                print(_.length);
                                controller.bodValidate.value = false;
                                controller.ageTextField.value = 'Tuổi';
                              }
                            },
                            decoration: InputDecoration(
                              counterText: "",
                              // errorText:
                              //     controller.bodValidate.value
                              //         ? ""
                              //         : null,
                              fillColor: AppColor.white,
                              filled: true,
                              labelText: controller.bodValidate.value
                                  ? "Vui lòng nhập đúng năm sinh"
                                  : "Năm sinh",
                              labelStyle: TextStyle(
                                color: controller.bodValidate.value
                                    ? Colors.red
                                    : AppColor.primary,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppSize.kConstantPadding * 2),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.kConstantPadding / 2),
                    Expanded(
                      flex: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                        child: Obx(
                          () => TextField(
                            enabled: false,
                            decoration: InputDecoration(
                              counterText: "",
                              fillColor: AppColor.white,
                              filled: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppSize.kConstantPadding * 2),
                              border: InputBorder.none,
                              labelText: controller.ageTextField.value,
                              labelStyle: TextStyle(color: AppColor.primary),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSize.kConstantPadding),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Obx(
                  () => TextField(
                    controller: controller.phoneTextField,
                    keyboardType: TextInputType.numberWithOptions(
                        decimal: false, signed: false),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 10,
                    decoration: InputDecoration(
                      counterText: '',
                      fillColor: AppColor.white,
                      filled: true,
                      labelText:
                          "Số điện thoại \b ${controller.countPhoneNumber.value == 0 ? '' : controller.countPhoneNumber.toString() + "/10"}",
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: AppSize.kConstantPadding * 2),
                      border: InputBorder.none,
                      labelStyle: TextStyle(color: AppColor.primary),
                    ),
                    onChanged: (_) {
                      controller.countPhoneNumber.value = _.length;
                    },
                  ),
                ),
              ),
              const SizedBox(height: AppSize.kConstantPadding * 2),
              Container(
                  child: AppBtnLoading(
                controller: controller.regBtnController,
                onTap: () => controller.regMed(),
                title: 'Tiếp tục',
              )),
            ],
          ),
        ),
      ),
    );
  }
}
