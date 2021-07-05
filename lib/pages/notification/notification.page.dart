import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/models/notify.model.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'notification.controller.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: GetBuilder<NotificationController>(
          init: NotificationController(),
          builder: (controller) {
            return DefaultTabController(
              length: 4,
              child: Column(
                children: [
                  AppBarCustom.appBarNomal("Thông Báo", isBack: false),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSize.kConstantPadding),
                    child: TabBar(
                      labelColor: const Color(0xff525c6e),
                      unselectedLabelColor: const Color(0xffacb3bf),
                      indicatorPadding: EdgeInsets.all(0.0),
                      indicatorWeight: 4.0,
                      labelPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                      indicator: ShapeDecoration(
                        shape: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0,
                            style: BorderStyle.solid,
                          ),
                        ),
                        gradient: AppColor.backgroundPrimary,
                      ),
                      tabs: <Widget>[
                        Container(
                          height: AppSize.tabHeight,
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Thông báo chung",
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: AppSize.tabHeight,
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text(
                            "Chỉ định",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: AppSize.tabHeight,
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text(
                            "Tài liệu",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          height: AppSize.tabHeight,
                          alignment: Alignment.center,
                          color: Colors.white,
                          child: Text(
                            "Phác đồ",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.kConstantPadding),
                      decoration: BoxDecoration(),
                      child: Obx(
                        () => TabBarView(
                          physics: ClampingScrollPhysics(),
                          children: [
                            NotiTabView(
                              listItem: List.generate(
                                controller.customerOverviewMESSAGE.value
                                        .totalItems ??
                                    0,
                                (index) => ItemTabView(
                                    notify: controller
                                        .customerOverviewMESSAGE
                                        .value
                                        .notifyOverViewCombine!
                                        .listNoti![index]),
                              ),
                            ),
                            NotiTabView(
                              listItem: List.generate(
                                controller
                                        .customerOverviewMED.value.totalItems ??
                                    0,
                                (index) => ItemTabView(
                                    notify: controller
                                        .customerOverviewMED
                                        .value
                                        .notifyOverViewCombine!
                                        .listNoti![index]),
                              ),
                            ),
                            NotiTabView(
                              listItem: List.generate(
                                controller.customerOverviewARTICLE.value
                                        .totalItems ??
                                    0,
                                (index) => ItemTabView(
                                    notify: controller
                                        .customerOverviewARTICLE
                                        .value
                                        .notifyOverViewCombine!
                                        .listNoti![index]),
                              ),
                            ),
                            NotiTabView(
                              listItem: List.generate(
                                controller.customerOverviewREGIMEN.value
                                        .totalItems ??
                                    0,
                                (index) => ItemTabView(
                                    notify: controller
                                        .customerOverviewREGIMEN
                                        .value
                                        .notifyOverViewCombine!
                                        .listNoti![index]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class NotiTabView extends StatelessWidget {
  final List<ItemTabView> listItem;
  const NotiTabView({Key? key, required this.listItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listItem.length == 0
        ? Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.notification_important,
                  color: AppColor.primary,
                  size: 200,
                ),
                Text(
                  'Không có thông báo.',
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: titleSize,
                  ),
                )
              ],
            ),
          )
        : SingleChildScrollView(
            child: Column(
              children: List.generate(
                  listItem.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10),
                        child: listItem[index],
                      )),
            ),
          );
  }
}

class ItemTabView extends StatelessWidget {
  final Notify notify;
  // final bool isRead;
  const ItemTabView({Key? key, required this.notify}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.kConstantPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        color: notify.isRead == 1 ? AppColor.grey : AppColor.white,
        boxShadow: [
          notify.isRead == 1
              ? BoxShadow()
              : BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: Offset(1, 3), // changes position of shadow
                ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              // color: Colors.red,
              image: DecorationImage(
                image: AssetImage(AppAsset.avatar),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          const SizedBox(width: AppSize.kConstantPadding),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${notify.messageTitle}",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: titleSize - 3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${notify.messageContent}",
                  style: TextStyle(
                    color: AppColor.primary,
                    fontSize: subTitleSize,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: AppSize.kConstantPadding),
          Container(
            width: 60,
            child: Text(
              DateFormat('HH:MM').format(notify.writeDate ?? DateTime.now()),
              style: TextStyle(
                color: AppColor.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
