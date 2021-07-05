import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_btn.dart';
import 'package:app_mobile_bacsichidinh/components/app_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/pages/profile_update/profile_update.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileUpdate extends StatelessWidget {
  const ProfileUpdate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: SingleChildScrollView(
        child: GetBuilder<ProfileUpdateController>(
            init: ProfileUpdateController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppBarCustom.appBarProfile(
                      controller.currentUser!.value.avatarPath!,
                      "Thông tin chi tiết",
                      Hero(
                        tag: 'appbar_profile',
                        child: Material(
                          color: Colors.transparent,
                          child: CircleAvatarCustom(
                            imageAvatar:
                                controller.currentUser!.value.avatarPath!,
                          ),
                        ),
                      ),
                      isUpdatePage: true,
                    ),
                    Container(
                      child: Text(
                        controller.currentUser!.value.fullname!,
                        style: TextStyle(
                          color: AppColor.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: titleSize,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.kConstantPadding * 4,
                        vertical: AppSize.kConstantPadding,
                      ),
                      child: Divider(
                        thickness: 1,
                        color: AppColor.primary,
                      ),
                    ),
                    UpdateProfileField(
                      title: 'Email',
                      value: controller.currentUser!.value.email,
                      onTap: () => controller.setCurrentUser(
                        title: 'Email',
                        value: controller.currentUser!.value.email,
                      ),
                    ),
                    UpdateProfileField(
                      title: 'Điện thoại',
                      value: controller.currentUser!.value.phoneNumber
                          .replaceAll('+84-', '0'),
                      onTap: () {},
                    ),
                    UpdateProfileField(
                      title: 'Địa chỉ',
                      value: '3 cộng hòa',
                      onTap: () {},
                    ),
                    UpdateProfileField(
                      title: 'Thành phố',
                      value: '287 cộng hòa',
                      onTap: () {},
                    ),
                    Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: UpdateProfileField(
                            // horizontalPadding: 0,
                            title: 'Quận',
                            value: 'Tân Bình',
                            onTap: () {},
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: UpdateProfileField(
                            title: 'Phường',
                            value: '13',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 100,
                      child: AppBtnLoading(
                        controller: controller.updateBtnController,
                        onTap: () {},
                        title: 'Cập Nhật',
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class UpdateProfileField extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;
  final double horizontalPadding;
  const UpdateProfileField({
    Key? key,
    required this.title,
    required this.value,
    required this.onTap,
    this.horizontalPadding = AppSize.kConstantPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: horizontalPadding,
        right: horizontalPadding,
        bottom: AppSize.kConstantPadding,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.kConstantPadding * 2),
            child: Text(title),
          ),
          InkWell(
            onTap: onTap,
            child: AppCard(
              child: Container(
                width: double.infinity,
                height: AppSize.kConstantPadding * 4,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.kConstantPadding,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
