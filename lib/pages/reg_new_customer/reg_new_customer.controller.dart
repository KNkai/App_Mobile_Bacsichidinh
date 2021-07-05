import 'package:app_mobile_bacsichidinh/components/app_rounded_loading_button.dart';
import 'package:app_mobile_bacsichidinh/models/customer.model.dart';
import 'package:app_mobile_bacsichidinh/models/customer.model.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/pages/reg_med/reg_med.page.dart';
import 'package:app_mobile_bacsichidinh/repositories/reg_med/reg_med.repo.dart';
import 'package:get/get.dart';

class RegNewCustomerController extends GetxController {
  var gender = true.obs;

  final regBtnController = RoundedLoadingButtonController();

  final regMedRepo = RegMedRepositories();

  final HomeController homeController = Get.find();

  Customer? customerResponse;

  @override
  void onInit() {
    super.onInit();
  }

  onChangeGender(value) {
    gender.value = value;
  }

  regCustomer(Customer customer) async {
    gender.value
        ? customer.gioiTinh = GioiTinh.M
        : customer.gioiTinh = GioiTinh.F;
    customerResponse = await regMedRepo.fetchRegCustomer(
        customer: customer, doctorId: homeController.currentUser!.doctorId);

    await 1.delay();
    regBtnController.success();
    await 0.5.delay();
    Get.off(RegMed(customer: customerResponse!));
  }
}
