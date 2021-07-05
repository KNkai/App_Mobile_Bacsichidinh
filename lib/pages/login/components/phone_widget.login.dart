import 'package:app_mobile_bacsichidinh/components/app_btn.dart';
import 'package:app_mobile_bacsichidinh/pages/login/login.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final LoginController controller = Get.find();
    return GetBuilder<LoginController>(builder: (controller) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: AppSize.kConstantPadding * 3),
          Padding(
            padding: const EdgeInsets.all(AppSize.kConstantPadding),
            child: Text(
              "Đăng Nhập",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: titleSize,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppSize.kConstantPadding),
            child: Text(
              "Chào mừng bạn đến với Doctor Check",
            ),
          ),
          const SizedBox(height: AppSize.kConstantPadding * 6),
          // if (controller.stateSendOTP == StateSendOTP.IsWaiting)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width * (2 / 3),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.person_rounded),
                        hintText: "Nhập Số Điện Thoại",
                        suffixIcon: SizedBox(
                          child: Center(
                            child: InkWell(
                              onTap: () => controller.phoneController!.clear(),
                              child: Icon(Icons.close_rounded),
                            ),
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(maxWidth: 40),
                        counterText: "",
                      ),
                      controller: controller.phoneController,
                      textAlign: TextAlign.center,
                      maxLength: 10,
                      keyboardType: TextInputType.numberWithOptions(
                        decimal: false,
                        signed: false,
                      ),
                      focusNode: controller.phoneFocusNode,
                    ),
                  ),
                  FutureBuilder<SupportState>(
                    future: controller.checkSupportDevice(),
                    builder: (_, value) {
                      if (value.data == SupportState.supported &&
                          controller.hasAccount())
                        return InkWell(
                          onTap: () => controller.authenticate(),
                          child: Container(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.only(
                                left: AppSize.kConstantPadding),
                            child: Image.asset(AppAsset.ic_fingerprint),
                          ),
                        );
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
              const SizedBox(height: AppSize.kConstantPadding * 10),
            ],
          ),
          AppBtnLoading(
              controller: controller.loginBtnController,
              onTap: () {
                controller.verifyPhoneNumber(controller.phoneController!.text);
                // controller.pageController.nextPage(
                //     duration: Duration(milliseconds: 100),
                //     curve: Curves.bounceIn);
              },
              title: "Đăng Nhập"),
          const SizedBox(height: AppSize.kConstantPadding * 3),
        ],
      );
    });
  }
}
