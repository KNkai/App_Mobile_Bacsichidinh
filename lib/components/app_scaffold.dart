import 'package:app_mobile_bacsichidinh/components/controller/app_scaffold_controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppScaffold extends StatelessWidget {
  final Widget? child;
  final bool isAppBar;
  final bool isBackButton;
  final Widget? title;
  final bool isCenterTitle;
  final bool isShowCart;
  final bool isShowOrder;
  // final bool isRefresh;
  // final Function? onRefresh;
  final bool isNoti;
  final Widget? appBar;

  const AppScaffold({
    Key? key,
    this.child,
    this.isAppBar = true,
    this.isBackButton = false,
    this.title,
    this.isCenterTitle = true,
    this.isShowCart = true,
    this.isShowOrder = true,
    // this.isRefresh = true,
    // this.onRefresh,
    this.isNoti = false,
    this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final AppScaffoldController controller = Get.find();
    return Scaffold(
      body: GetBuilder<AppScaffoldController>(builder: (controller) {
        return Container(
          decoration: controller.settingBg != null
              ? controller.settingBg!.type == 1
                  ? BoxDecoration(
                      color: HexColor.fromHex(controller.settingBg!.data),
                    )
                  : BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.settingBg!.data,
                        ),
                        fit: BoxFit.fitHeight,
                      ),
                    )
              : BoxDecoration(
                  color: AppColor.white,
                ),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
              ),
              child:
                  // child: true
                  // child: isRefresh
                  RefreshIndicator(
                onRefresh: () async => print(1),
                // onRefresh: onRefresh!(),
                child: Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: appBar,
                    ),
                    Positioned.fill(child: child!),
                  ],
                ),
              )
              // : child,
              ),
        );
      }),
    );
  }
}
