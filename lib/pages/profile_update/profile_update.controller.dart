import 'package:app_mobile_bacsichidinh/components/app_btn.dart';
import 'package:app_mobile_bacsichidinh/components/app_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_rounded_loading_button.dart';
import 'package:app_mobile_bacsichidinh/models/user.model.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUpdateController extends GetxController {
  final HomeController homeController = Get.find();
  Rx<Users>? currentUser;
  RoundedLoadingButtonController updateBtnController =
      RoundedLoadingButtonController();
  RoundedLoadingButtonController? saveBtnController;
  @override
  void onInit() {
    currentUser = homeController.currentUser!.obs;
    super.onInit();
  }

  setCurrentUser({
    String title = '',
    String value = '',
  }) {
    // setCurrentUser(Users users) {
    // currentUser!.value = users;
    TextEditingController currentTextEditingController =
        TextEditingController();
    saveBtnController = RoundedLoadingButtonController();
    return Get.defaultDialog(
      title: 'Cập nhật $title',
      barrierDismissible: true,
      content: Container(
        width: Get.width - (AppSize.kConstantPadding * 2),
        child: Column(
          children: [
            AppCard(
              child: TextField(
                controller: currentTextEditingController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Nhập nội dung...',
                ),
              ),
            ),
            const SizedBox(height: AppSize.kConstantPadding),
            AppBtnLoading(
              controller: saveBtnController!,
              onTap: () {},
              title: 'Xác nhận',
            )
          ],
        ),
      ),
    );
  }
}
