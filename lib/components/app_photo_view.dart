import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class AppPhotoView extends StatelessWidget {
  const AppPhotoView(
      {Key? key,
      required this.titleImg,
      required this.index,
      required this.listImg})
      : super(key: key);
  final String titleImg;
  final int index;
  final List<String> listImg;

  @override
  Widget build(BuildContext context) {
    return GetX<_AppPhotoController>(
        init: _AppPhotoController(index),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("$titleImg"),
              centerTitle: true,
              leading: BackButton(onPressed: () {
                controller.onClose();
                Get.back();
              }),
            ),
            body: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    child: Center(
                      child: PhotoView(
                        imageProvider: NetworkImage(
                            listImg[controller.currentIndex.value]),
                        minScale: 0.5,
                        maxScale: 3.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    height: 150,
                    child: ScrollSnapList(
                      itemBuilder: (_, index) {
                        return Container(
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  controller.currentIndex.value = index;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(listImg[index]),
                                    ),
                                    border:
                                        index == controller.currentIndex.value
                                            ? Border.all(color: AppColor.second)
                                            : Border.all(),
                                  ),
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemSize: 150,
                      dynamicItemSize: true,
                      itemCount: listImg.length,
                      onItemFocus: (_) {},
                      focusOnItemTap: true,
                      dynamicItemOpacity: 0.5,
                      initialIndex: controller.currentIndex.value.toDouble(),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class _AppPhotoController extends GetxController {
  _AppPhotoController(this.firstIndex);

  final currentIndex = 0.obs;
  final int firstIndex;

  @override
  void onInit() {
    currentIndex.value = firstIndex;
    print(firstIndex);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
