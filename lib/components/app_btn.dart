import 'package:app_mobile_bacsichidinh/components/app_rounded_loading_button.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBtn extends StatelessWidget {
  final String title;
  final Function onClick;
  final double height;
  final double? width;
  final Widget? centerWidget;
  AppBtn({
    Key? key,
    required this.title,
    required this.onClick,
    this.height = 50,
    this.width,
    this.centerWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(),
      child: Container(
        height: height,
        width: width ?? Get.width * 0.5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: AppColor.primary,
          // gradient: LinearGradient(
          //     colors: [Color(0xff00566E), Color(0xff00A2D4)], stops: [0, 0.7]),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: AppSize.kConstantPadding),
              child: centerWidget ??
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppBtnLoading extends StatelessWidget {
  const AppBtnLoading(
      {Key? key,
      required this.controller,
      required this.onTap,
      required this.title,
      this.height = 50,
      this.width = 300,
      this.centerWidget})
      : super(key: key);
  final RoundedLoadingButtonController controller;
  final VoidCallback onTap;
  final String title;
  final double height;
  final double width;
  final Widget? centerWidget;

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      child: Padding(
        padding: const EdgeInsets.all(AppSize.kConstantPadding),
        child: Container(
          child: centerWidget ??
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
        ),
      ),
      controller: controller,
      color: AppColor.primary,
      successColor: AppColor.second,
      onPressed: onTap,
      height: height,
      width: width,
    );
  }
}
