import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/models/article.model.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'document_detail.controller.dart';

class DocumentDetail extends StatelessWidget {
  final Article article;
  const DocumentDetail({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: GetBuilder<DocumentDetailController>(
        init: DocumentDetailController(documentId: article.articleId!),
        builder: (controller) {
          return Column(
            children: [
              AppBarCustom.appBarNomal("Chi Tiết"),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCard(
                          child: Container(
                            padding:
                                const EdgeInsets.all(AppSize.kConstantPadding),
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(
                                      AppSize.kConstantPadding),
                                  child: Text(
                                    article.articleTitle ?? '',
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
                                        article.writeDate ?? DateTime.now()),
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
                                    article.articleShortContent ?? '',
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
                        Padding(
                          padding:
                              const EdgeInsets.all(AppSize.kConstantPadding),
                          child: Html(
                              data: controller
                                      .articleDetail.value.articleContent ??
                                  ''),
                        )
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
