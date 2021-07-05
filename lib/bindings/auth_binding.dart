import 'package:app_mobile_bacsichidinh/components/controller/app_scaffold_controller.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:get/get.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put<AppScaffoldController>(AppScaffoldController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
  }
}
