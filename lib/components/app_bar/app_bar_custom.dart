import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarCustom {
  static final heightAppBar = Get.mediaQuery.viewPadding.top + Get.height / 5;
  static appBarProfile(String img, String title, Widget avatarWidget,
      {bool isUpdatePage = false}) {
    return Container(
      width: double.infinity,
      height: heightAppBar,
      child: Stack(
        children: [
          ClipPath(
            clipper: RoundedClipper(heightAppBar),
            child: Container(
              height: heightAppBar,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.primary, AppColor.primary.withOpacity(0.5)],
                  stops: [0, 0.7],
                ),
              ),
            ),
          ),
          if (isUpdatePage)
            Positioned(
              top:
                  Get.context!.mediaQueryPadding.top + AppSize.kConstantPadding,
              left: AppSize.kConstantPadding * 2,
              child: InkWell(
                child:
                    Icon(Icons.arrow_back_ios_rounded, color: AppColor.white),
                onTap: Get.back,
              ),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: Get.mediaQuery.viewPadding.top +
                        AppSize.kConstantPadding),
                width: double.infinity,
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(color: AppColor.white),
                  ),
                ),
              ),
              const Spacer(),
              // CircleAvatarCustom(
              //   imageAvatar: img,
              // ),
              avatarWidget,
            ],
          ),
        ],
      ),
    );
  }

  static appBarLogo() {
    return Stack(
      children: [
        SizedBox(width: double.infinity, height: heightAppBar),
        Positioned.fill(
          child: ClipPath(
            clipper: RoundedClipper(heightAppBar),
            child: Container(
              height: heightAppBar,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColor.primary, AppColor.primary.withOpacity(0.5)],
                  stops: [0, 0.7],
                ),
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: double.infinity,
                height:
                    Get.mediaQuery.viewPadding.top + AppSize.kConstantPadding),
            Image.asset(
              AppAsset.logo_bg_white,
              width: 60,
              height: 60,
            ),
            SizedBox(width: double.infinity, height: AppSize.kConstantPadding),
            Container(
              width: double.infinity,
              child: Image.asset(
                AppAsset.logo_text_white,
                height: 30,
                width: Get.width / 2,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ],
    );
  }

  static appBarNomal(String title, {bool isBack = true}) {
    return Stack(
      children: [
        ClipPath(
          clipper:
              RoundedClipper(Get.mediaQuery.viewPadding.top + Get.height / 7),
          child: Container(
            padding: EdgeInsets.only(
                top: Get.mediaQuery.viewPadding.top + AppSize.kConstantPadding),
            height: Get.mediaQuery.viewPadding.top + Get.height / 7,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColor.price,
              gradient: AppColor.backgroundPrimary,
            ),
            child: Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isBack)
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  top:
                      Get.mediaQuery.viewPadding.top + AppSize.kConstantPadding,
                  left: AppSize.kConstantPadding * 2),
              child: InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        // SizedBox(
        //   width: double.infinity,
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       IconButton(
        //         onPressed: () {
        //           print("co nhan");
        //         },
        //         icon: Icon(
        //           Icons.arrow_back_ios_rounded,
        //           color: AppColor.white,
        //         ),
        //       ),
        //       Text(
        //         title,
        //         style: TextStyle(
        //             color: AppColor.white,
        //             fontSize: 17,
        //             fontWeight: FontWeight.bold),
        //       ),
        //       // const SizedBox(),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class CircleAvatarCustom extends StatelessWidget {
  final String? imageAvatar;
  const CircleAvatarCustom({
    Key? key,
    required this.imageAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (Get.height * 0.25) * 0.6,
      width: (Get.height * 0.25) * 0.6,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.white, width: 3),
                shape: BoxShape.circle,
              ),
              // padding: EdgeInsets.all(5),
              child: imageAvatar == null || imageAvatar == ""
                  ? CircleAvatar(
                      backgroundColor: AppColor.grey,
                      radius: 60,
                      // onBackgroundImageError: ,
                      backgroundImage: AssetImage(AppAsset.avatar))
                  : CircleAvatar(
                      backgroundColor: AppColor.grey,
                      radius: 60,
                      // onBackgroundImageError: ,
                      backgroundImage: NetworkImage(imageAvatar!),
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(AppAsset.ic_badge_1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoundedClipper extends CustomClipper<Path> {
  final double height;

  RoundedClipper(this.height);

  @override
  Path getClip(Size size) {
    final heightCurvese = 80;
    var path = Path();
    path.lineTo(0.0, height - heightCurvese);
    path.quadraticBezierTo(
      size.width / 2,
      height,
      size.width,
      height - heightCurvese,
    );
    path.lineTo(size.width, 0.0);

    path.close();
    return path;
    // var path = new Path();
    // path.lineTo(0, size.height - 90);
    // var controllPoint = Offset(70, size.height);
    // var endPoint = Offset(size.width / 2, size.height);
    // path.quadraticBezierTo(
    //     controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy);
    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    // return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
