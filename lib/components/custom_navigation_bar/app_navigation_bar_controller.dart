import 'package:app_mobile_bacsichidinh/components/custom_navigation_bar/app_navigation_bar.dart';
import 'package:app_mobile_bacsichidinh/utils/app_assets.dart';
import 'package:get/get.dart';

class AppNavigationBarController extends GetxController {
  RxList<GroupItem> listIcon = [
    GroupItem(
      item: ItemBottomNavigationBar(
          icon: AppAsset.ic_doc, iconActive: AppAsset.ic_doc_active),
      active: false,
      itemActive: ItemBottomNavigationBar(
        icon: AppAsset.ic_doc,
        iconActive: AppAsset.ic_doc_active,
        active: true,
      ),
    ),
    GroupItem(
      item: ItemBottomNavigationBar(
        icon: AppAsset.ic_booking,
        iconActive: AppAsset.ic_booking_active,
      ),
      active: false,
      itemActive: ItemBottomNavigationBar(
        icon: AppAsset.ic_booking,
        iconActive: AppAsset.ic_booking_active,
        active: true,
      ),
    ),
    GroupItem(
      item: ItemBottomNavigationBar(
        icon: AppAsset.ic_home,
        iconActive: AppAsset.ic_home_active,
      ),
      active: true,
      itemActive: ItemBottomNavigationBar(
        icon: AppAsset.ic_home,
        iconActive: AppAsset.ic_home_active,
        active: true,
      ),
    ),
    GroupItem(
      item: ItemBottomNavigationBar(
        icon: AppAsset.ic_noti,
        iconActive: AppAsset.ic_noti_active,
        isNoti: true,
      ),
      active: false,
      itemActive: ItemBottomNavigationBar(
        icon: AppAsset.ic_noti,
        iconActive: AppAsset.ic_noti_active,
        active: true,
        isNoti: true,
      ),
    ),
    GroupItem(
      item: ItemBottomNavigationBar(
          icon: AppAsset.ic_user, iconActive: AppAsset.ic_user_active),
      active: false,
      itemActive: ItemBottomNavigationBar(
        icon: AppAsset.ic_user,
        iconActive: AppAsset.ic_user_active,
        active: true,
      ),
    ),
  ].obs;
  // RxList<GroupItem> listIcon = [
  //   GroupItem(
  //     item: ItemBottomNavigationBar(
  //         icon: AppAsset.ic_booking, iconActive: AppAsset.ic_booking_active),
  //     active: false,
  //     itemActive: ItemBottomNavigationBar(
  //       icon: AppAsset.ic_booking,
  //       iconActive: AppAsset.ic_booking_active,
  //       active: true,
  //     ),
  //   ),
  //   GroupItem(
  //     item: ItemBottomNavigationBar(
  //         icon: AppAsset.ic_doc, iconActive: AppAsset.ic_doc_active),
  //     active: false,
  //     itemActive: ItemBottomNavigationBar(
  //       icon: AppAsset.ic_doc,
  //       iconActive: AppAsset.ic_doc_active,
  //       active: true,
  //     ),
  //   ),
  //   GroupItem(
  //     item: ItemBottomNavigationBar(
  //       icon: AppAsset.ic_home,
  //       iconActive: AppAsset.ic_home_active,
  //     ),
  //     active: true,
  //     itemActive: ItemBottomNavigationBar(
  //       icon: AppAsset.ic_home,
  //       iconActive: AppAsset.ic_home_active,
  //       active: true,
  //     ),
  //   ),
  //   GroupItem(
  //     item: ItemBottomNavigationBar(
  //         icon: AppAsset.ic_noti, iconActive: AppAsset.ic_noti_active),
  //     active: false,
  //     itemActive: ItemBottomNavigationBar(
  //       icon: AppAsset.ic_noti,
  //       iconActive: AppAsset.ic_noti_active,
  //       active: true,
  //     ),
  //   ),
  //   GroupItem(
  //     item: ItemBottomNavigationBar(
  //         icon: AppAsset.ic_user, iconActive: AppAsset.ic_user_active),
  //     active: false,
  //     itemActive: ItemBottomNavigationBar(
  //       icon: AppAsset.ic_user,
  //       iconActive: AppAsset.ic_user_active,
  //       active: true,
  //     ),
  //   ),
  // ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  onClickItem(int index) {
    listIcon.forEach((e) {
      e.active = false;
    });
    listIcon[index].active = true;
    print(index);
  }
}

class GroupItem {
  bool active;
  ItemBottomNavigationBar item, itemActive;

  GroupItem(
      {this.active = false, required this.item, required this.itemActive});
}
