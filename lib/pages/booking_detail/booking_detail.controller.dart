import 'package:app_mobile_bacsichidinh/models/booking_result.model.dart';
import 'package:app_mobile_bacsichidinh/models/customer.model.dart';
import 'package:app_mobile_bacsichidinh/models/phieu_cdha.model.dart';
import 'package:app_mobile_bacsichidinh/models/phieu_chi_dinh.model.dart';
import 'package:app_mobile_bacsichidinh/models/phieu_thu.model.dart';
import 'package:app_mobile_bacsichidinh/models/phieu_xet_nghiem.model.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/repositories/booking/booking_detail.repo.dart';
import 'package:get/get.dart';

class BookingDetailController extends GetxController {
  final String customerId;
  final bookingDetailRepo = BookingDetailRepositories();
  final HomeController homeController = Get.find();
  BookingDetailController(this.customerId);
  Rx<BookingResultOverView> currentBookingOverview =
      BookingResultOverView().obs;
  Rx<Customer> currentCustomer = Customer().obs;
  Rx<Phieuchidinh> phieuchidinh = Phieuchidinh().obs;
  Rx<Phieuxetnghiem> phieuxetnghiem = Phieuxetnghiem().obs;
  Rx<MedBookingResult> medBookingResult = MedBookingResult().obs;
  RxList<Phieuthu> phieuThu = <Phieuthu>[].obs;
  Rx<PhieuCdha> xqCDHA = PhieuCdha().obs;
  Rx<PhieuCdha> nsCDHA = PhieuCdha().obs;
  Rx<PhieuCdha> dtCDHA = PhieuCdha().obs;
  Rx<PhieuCdha> saCDHA = PhieuCdha().obs;

  num amountBooking = 0;
  @override
  void onInit() async {
    // currentCustomer.refresh();
    await getAllValue();
    update();
    super.onInit();
  }

  getAllValue() async {
    currentBookingOverview.value = await bookingDetailRepo.fetchMedResult(
        customerId: customerId, doctorId: homeController.currentUser!.doctorId);

    if (currentBookingOverview.value.customer != null)
      currentCustomer.value = currentBookingOverview.value.customer!;
    if (currentBookingOverview.value.results != null) {
      if (currentBookingOverview.value.results!.medBookingResult != null)
        medBookingResult.value =
            currentBookingOverview.value.results!.medBookingResult!;
      if (currentBookingOverview.value.results!.phieuchidinh != null)
        phieuchidinh.value =
            currentBookingOverview.value.results!.phieuchidinh!;
      if (currentBookingOverview.value.results!.phieuxetnghiem != null)
        phieuxetnghiem.value =
            currentBookingOverview.value.results!.phieuxetnghiem!;
      if (currentBookingOverview.value.results!.phieuthu != null)
        phieuThu.value = currentBookingOverview.value.results!.phieuthu!;

      if (currentBookingOverview.value.results!.phieuCdha!.length != 0) {
        currentBookingOverview.value.results!.phieuCdha!.forEach((e) {
          switch (e.phieu!.loaiCls) {
            case "XQuang":
              xqCDHA.value = e;
              break;
            case "SieuAm":
              saCDHA.value = e;
              break;
            case "NoiSoi":
              nsCDHA.value = e;
              break;
            case "DienTim":
              dtCDHA.value = e;
              break;
            default:
          }
        });
        // xqCDHA.value = currentBookingOverview.value.results!.phieuCdha![0];
        // nsCDHA.value = currentBookingOverview.value.results!.phieuCdha![1];
        // dtCDHA.value = currentBookingOverview.value.results!.phieuCdha![2];
        // saCDHA.value = currentBookingOverview.value.results!.phieuCdha![3];
      }
    }

    phieuchidinh.value.chitiet!.forEach((e) {
      amountBooking += e.giaThucTe!;
    });
  }
}
