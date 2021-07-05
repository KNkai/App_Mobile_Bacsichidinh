import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/models/article_category.model.dart';
import 'package:app_mobile_bacsichidinh/pages/document_detail/document_detail.page.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'document.controller.dart';

class DocumentPage extends StatelessWidget {
  const DocumentPage();
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: GetBuilder<DocumentController>(
          init: DocumentController(),
          builder: (controller) {
            return DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  AppBarCustom.appBarNomal("Tài liệu - Phác đồ", isBack: false),
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
                                "Tài liệu",
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
                      child: TabBarView(
                        physics: ClampingScrollPhysics(),
                        children: [
                          _TabViewDocument(
                            controller: controller,
                          ),
                          Center(
                            child: Text('Chưa có nội dung về phác đồ'),
                          ),
                        ],
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

class _TabViewDocument extends StatelessWidget {
  final DocumentController controller;
  const _TabViewDocument({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Container(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<ArticleCate>(
                onChanged: (_) {
                  controller.currentArticleCate.value = _!;
                  controller.getListArticleByCateId(_.articleCategoryId!);
                },
                value: controller.currentArticleCate.value,
                items: List.generate(
                  controller.listArticleCate.length,
                  (index) => DropdownMenuItem<ArticleCate>(
                    value: controller.listArticleCate[index],
                    child: Text(
                      "${controller.listArticleCate[index].articleCategoryName}",
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => controller.listArticle.length == 0
                ? const Center(
                    child: Text('Chưa có tài liệu nào về nội dung này'),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        controller.listArticle.length,
                        (index) => InkWell(
                          onTap: () => Get.to(
                            DocumentDetail(
                              article: controller.listArticle[index],
                            ),
                            preventDuplicates: true,
                          ),
                          child: AppCard(
                            child: Container(
                              padding: const EdgeInsets.all(
                                  AppSize.kConstantPadding),
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        AppSize.kConstantPadding),
                                    child: Text(
                                      controller.listArticle[index]
                                              .articleTitle ??
                                          '',
                                      style: TextStyle(
                                        fontSize: titleSize - 3,
                                        color: AppColor.primary,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: AppSize.kConstantPadding),
                                    child: Text(
                                      DateFormat('dd/MM/yyyy HH:MM').format(
                                          controller.listArticle[index]
                                                  .writeDate ??
                                              DateTime.now()),
                                      style: TextStyle(
                                        fontSize: miniTitleSize,
                                        color: AppColor.boldGrey,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(
                                        AppSize.kConstantPadding),
                                    child: Text(
                                      controller.listArticle[index]
                                              .articleShortContent ??
                                          '',
                                      style: TextStyle(
                                        fontSize: subTitleSize,
                                        color: AppColor.boldGrey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
