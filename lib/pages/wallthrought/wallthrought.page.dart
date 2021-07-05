import 'package:app_mobile_bacsichidinh/components/app_navbar.dart';
import 'package:app_mobile_bacsichidinh/components/app_scaffold.dart';
import 'package:app_mobile_bacsichidinh/pages/login/login.page.dart';
import 'package:app_mobile_bacsichidinh/pages/wallthrought/wallthrought.controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WallthroughtPage extends StatelessWidget {
  const WallthroughtPage();
  //
  @override
  Widget build(BuildContext context) {
    final WallthroughtController controller = Get.put(WallthroughtController());
    return AppScaffold(
      isAppBar: false,
      isBackButton: false,
      isCenterTitle: false,
      isNoti: false,
      // isRefresh: false,
      isShowCart: false,
      isShowOrder: false,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: double.infinity,
              child: PageView(
                controller: controller.pageController,
                children: controller.page,
                onPageChanged: (_) => controller.currentPage!.value = _,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(bottom: AppSize.kConstantPadding * 2),
              child: SmoothPageIndicator(
                  controller: controller.pageController!,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: AppColor.primary,
                    radius: 20,
                    spacing: AppSize.kConstantPadding,
                  ), // your preferred effect
                  onDotClicked: (index) {}),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                // Get.to(AppNavBar());
                Get.to(LoginPage());
              },
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: AppSize.kConstantPadding),
                child: Container(
                  child: Wrap(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.end,
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppSize.kConstantPadding / 2),
                        child: Obx(
                          () => Text(
                            controller.currentPage!.value + 1 !=
                                    controller.page.length
                                ? "Bỏ Qua"
                                : "Đăng Nhập",
                            style: TextStyle(
                              color: AppColor.boldGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: subTitleSize,
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: titleSize,
                        color: AppColor.boldGrey,
                      )
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.kConstantPadding * 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void>? toNextPage() => Get.to(
        AppNavBar(), transition: Transition.fade,
        // LoginPage(), transition: Transition.fade,
        // FadeRouteBuilder(
        //   page: LoginPage(),
        // ),
      );
}

class Wallthrought1 extends StatelessWidget {
  final String? logo, content;
  const Wallthrought1({
    Key? key,
    this.logo,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            // color: AppColor.price,
            child: Image.asset(
              logo ?? AppAsset.bg_wallthrough_1,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: AppSize.kConstantPadding),
            width: Get.width / (3 / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'logo_bg_white',
                  child: Image.asset(
                    AppAsset.logo_bg_white,
                    width: 80,
                    height: 80,
                  ),
                ),
                const SizedBox(
                  width: AppSize.kConstantPadding * 2,
                ),
                Hero(
                  tag: 'logo_text',
                  child: SvgPicture.asset(
                    AppAsset.logo_text,
                    fit: BoxFit.fitWidth,
                    allowDrawingOutsideViewBox: false,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.kConstantPadding,
              horizontal: AppSize.kConstantPadding * 4,
            ),
            // width: Get.width / 2,
            // child: Text('abcd'),
            child: Text(
              content ??
                  "Ngay sau khi khách hàng (bệnh nhân) thực hiện nội soi và các dịch vụ cận lâm sàng khác (nếu có), chúng tôi sẽ trả về cho bác sĩ chỉ định đầy đủ kết quả, bác sĩ có thể xem ngay trên phần mềm này hoặc xem trên ứng dụng điện thoại di động.Ngay sau khi khách hàng (bệnh nhân) thực hiện nội soi và các dịch vụ cận lâm sàng khác (nếu có), chúng tôi sẽ trả về cho bác sĩ chỉ định đầy đủ kết quả, bác sĩ có thể xem ngay trên phần mềm này hoặc xem trên ứng dụng điện thoại di động.",
              style: TextStyle(fontSize: miniTitleSize),
            ),
          ),
          const SizedBox(
            height: AppSize.kConstantPadding * 3,
          )
        ],
      ),
    );
  }
}
