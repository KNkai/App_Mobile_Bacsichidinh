import 'package:app_mobile_bacsichidinh/components/app_bar/app_bar_custom.dart';
import 'package:app_mobile_bacsichidinh/components/app_expansion_tile_card.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/models/phieu_cdha.model.dart';
import 'package:app_mobile_bacsichidinh/pages/reg_med/reg_med.page.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'booking_detail.controller.dart';
import 'components/ket_qua_xet_nghiem.component.dart';
import 'components/phieu_chi_dinh.component.dart';
import 'package:app_mobile_bacsichidinh/components/app_photo_view.dart';

class BookingDetail extends StatelessWidget {
  final String customerId;
  final bool isDone;
  const BookingDetail({Key? key, required this.customerId, this.isDone = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: GetBuilder<BookingDetailController>(
        init: BookingDetailController(customerId),
        builder: (controller) {
          return Column(
            children: [
              AppBarCustom.appBarNomal("Chi tiết chỉ định"),
              Expanded(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: double.infinity,
                    child: Obx(
                      () => controller.currentCustomer.value.ma == null
                          ? Center(
                              child: SizedBox(
                                width: 40,
                                height: 40,
                                child: CircularProgressIndicator(
                                    backgroundColor: AppColor.white),
                              ),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InformationCustomer(
                                    customer: controller.currentCustomer.value,
                                    address: interpolate(
                                      [
                                        controller
                                                .currentCustomer.value.diaChi ??
                                            '',
                                        controller.currentCustomer.value
                                                .tenPhuongXa ??
                                            '',
                                        controller.currentCustomer.value
                                                .tenQuanHuyen ??
                                            '',
                                        controller.currentCustomer.value
                                                .tenTinhThanh ??
                                            '',
                                      ],
                                    ),
                                  ),
                                ),
                                PhieuChiDinhWidget(),
                                const SizedBox(
                                    height: AppSize.kConstantPadding),
                                if (isDone)
                                  Column(
                                    children: [
                                      KetQuaXetNghiemWidget(),
                                      const SizedBox(
                                          height: AppSize.kConstantPadding),
                                      // XQuangWidget(),
                                      if (controller.xqCDHA.value.chitiet !=
                                          null)
                                        CDHAWidget(
                                          phieuCdha: controller.xqCDHA.value,
                                          title: "X-Quang",
                                        ),

                                      const SizedBox(
                                          height: AppSize.kConstantPadding),
                                      if (controller.nsCDHA.value.chitiet !=
                                          null)
                                        CDHAWidget(
                                          phieuCdha: controller.nsCDHA.value,
                                          title: "Nội Soi",
                                        ),
                                      const SizedBox(
                                          height: AppSize.kConstantPadding),
                                      if (controller.dtCDHA.value.chitiet !=
                                          null)
                                        CDHAWidget(
                                          phieuCdha: controller.dtCDHA.value,
                                          title: "Điện Tim",
                                        ),
                                      const SizedBox(
                                          height: AppSize.kConstantPadding),
                                      if (controller.saCDHA.value.chitiet !=
                                          null)
                                        CDHAWidget(
                                          phieuCdha: controller.saCDHA.value,
                                          title: "Siêu Âm",
                                        ),
                                    ],
                                  ),
                                const SizedBox(
                                  height: AppSize.kConstantPadding * 5,
                                )
                              ],
                            ),
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

class CDHAWidget extends StatelessWidget {
  const CDHAWidget({
    Key? key,
    required this.phieuCdha,
    required this.title,
  }) : super(key: key);
  final PhieuCdha phieuCdha;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      title: Text("$title"),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.kConstantPadding * 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(bottom: AppSize.kConstantPadding / 2),
                child: Row(
                  children: [
                    Text("Thực hiện:"),
                    const Spacer(),
                    Text(
                        "${DateFormat('dd-MM-yyyy HH:MM').format(phieuCdha.phieu!.startDate!)}"),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: AppSize.kConstantPadding / 2),
                child: Row(
                  children: [
                    Text("Trả kết quả:"),
                    const Spacer(),
                    Text(
                        "${DateFormat('dd-MM-yyyy HH:MM').format(phieuCdha.phieu!.endDate!)}"),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: AppSize.kConstantPadding / 2),
                child: Text(
                    "Người thực hiện: KTV.${phieuCdha.phieu!.nguoiCapNhat ?? ""}"),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: AppSize.kConstantPadding / 2),
                child: Text(
                    "Nơi thực hiện: ${phieuCdha.phieu!.khoaPhong! + "- DOCTOR CHECK"}"),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: AppSize.kConstantPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nội dung đánh giá: "),
                    Html(data: phieuCdha.phieu!.noiDung)
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(bottom: AppSize.kConstantPadding / 2),
                child: Text("Kết luận: ${phieuCdha.phieu!.ketLuan ?? ""}"),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSize.kConstantPadding),
                child: Divider(),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSize.kConstantPadding),
                child: SizedBox(
                  height: 500,
                  width: double.infinity,
                  // child: GridView(
                  //   scrollDirection: Axis.horizontal,
                  //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //     maxCrossAxisExtent: 300,
                  //     childAspectRatio: 3 / 4,
                  //     crossAxisSpacing: 10,
                  //     mainAxisSpacing: 10,
                  //   ),
                  //   children: List.generate(
                  //     phieuCdha.chitiet!.length,
                  //     (index) => Container(
                  //       decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //           image: NetworkImage(
                  //             phieuCdha.chitiet![index].path!,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: phieuCdha.chitiet!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => Get.to(new AppPhotoView(
                          index: index,
                          titleImg: phieuCdha.chitiet![index].name!,
                          listImg: List<String>.from(
                              phieuCdha.chitiet!.map((e) => e.path)).toList(),
                        )),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                phieuCdha.chitiet![index].path!,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
