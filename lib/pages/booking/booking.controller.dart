import 'package:app_mobile_bacsichidinh/models/med_commission.model.dart';
import 'package:app_mobile_bacsichidinh/models/paging.model.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:get/get.dart';
import 'package:app_mobile_bacsichidinh/repositories/booking/booking.repo.dart';

class BookingController extends GetxController {
  RxInt currentTypeFilter = 0.obs;
  final bookingRepo = BookingRepositories();
  final HomeController homeController = Get.find();

  ///Med-Commissions
  final appointments = MedCommissionAll(
          totalItems: 0,
          message: '',
          medCommissionCombine: MedCommissionCombine(
            listMedCommission: [],
            paging: Paging(
              hasNextPage: false,
              hasPreviousPage: false,
              pageNumber: 0,
              pageSize: 10,
              totalCount: 0,
              totalPage: 0,
            ),
          ),
          status: false,
          clientIp: '')
      .obs;

  @override
  void onInit() {
    getAppointments();
    super.onInit();
  }

  getAppointments() async {
    appointments.value = await bookingRepo.fetchAppointments(
      appointmentsRequired: AppointmentsRequired(
          clinicId: '2',
          medStatusId: currentTypeFilter.value,
          doctorId: homeController.currentUser!.doctorId,
          pageNumber: 1,
          pageSize: 10),
    );
    appointments.refresh();
  }
}

var listFilter = ["Tất cả", "Đang chờ", "Đã có kết quả"];
