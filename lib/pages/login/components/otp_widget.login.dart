import 'package:app_mobile_bacsichidinh/components/app_btn.dart';
import 'package:app_mobile_bacsichidinh/components/app_navbar.dart';
import 'package:app_mobile_bacsichidinh/components/app_rounded_loading_button.dart';
import 'package:app_mobile_bacsichidinh/models/user.model.dart';
import 'package:app_mobile_bacsichidinh/pages/login/login.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPWidget extends StatelessWidget {
  const OTPWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSize.kConstantPadding * 3),
            Padding(
              padding: const EdgeInsets.all(AppSize.kConstantPadding),
              child: Text(
                "Xác nhận",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleSize,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSize.kConstantPadding,
                  horizontal: AppSize.kConstantPadding * 2),
              child: Text(
                "Nhận mã code 6 chữ số mà chúng tôi gửi qua số điện thoại",
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: AppSize.kConstantPadding),
              child: Text(
                controller.phoneController!.text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: titleSize,
                ),
              ),
            ),
            const SizedBox(height: AppSize.kConstantPadding * 6),
            SizedBox(
              width: Get.width * (2 / 3),
              child: PinCodeTextField(
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: AppColor.primary,
                  activeColor: AppColor.primary,
                  // disabledColor: AppColor.primary,
                  inactiveColor: AppColor.primary,
                  inactiveFillColor: AppColor.primary,
                  selectedFillColor: AppColor.primary,
                ),
                autoDisposeControllers: false,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: controller.otpController!,
                textStyle: TextStyle(color: AppColor.white),
                keyboardType: TextInputType.numberWithOptions(
                    decimal: false, signed: false),
                onChanged: (value) {
                  print(value);
                },
                appContext: context,
              ),
            ),
            const SizedBox(height: AppSize.kConstantPadding * 5),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hoặc",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: AppSize.kConstantPadding * 2),
              child: InkWell(
                onTap: () => controller.onBack(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      " Đăng nhập bằng số điện thoại khác",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: AppColor.primary),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.kConstantPadding * 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Chưa nhận được mã code,",
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    " Gửi lại sau 69s",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSize.kConstantPadding * 3),
            AppBtnLoading(
                controller: controller.otpVerifyButtonController,
                onTap: () {
                  if (controller.otpController!.text != "" &&
                      controller.otpController!.text.length == 6) {
                    controller
                        .loginWithFirebase(controller.otpController!.text);
                  }
                },
                title: "Xác Nhận"),
            const SizedBox(height: AppSize.kConstantPadding * 3),
          ],
        );
      },
    );
  }
}
