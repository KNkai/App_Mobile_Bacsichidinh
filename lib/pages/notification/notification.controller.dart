import 'package:app_mobile_bacsichidinh/models/notify.model.dart';
import 'package:app_mobile_bacsichidinh/repositories/notify/notify.repo.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  final notifyRepo = NotificationRepositorie();

  Rx<NotifyOverView> customerOverviewARTICLE = NotifyOverView().obs;
  Rx<NotifyOverView> customerOverviewREGIMEN = NotifyOverView().obs;
  Rx<NotifyOverView> customerOverviewMED = NotifyOverView().obs;
  Rx<NotifyOverView> customerOverviewMESSAGE = NotifyOverView().obs;

  @override
  void onInit() async {
    await getNotifyByType();
    super.onInit();
  }

  getNotifyByType() async {
    customerOverviewARTICLE.value =
        await notifyRepo.fetchNotiByType(messageType: 'ARTICLE');
    print(customerOverviewARTICLE.value.totalItems);

    customerOverviewREGIMEN.value =
        await notifyRepo.fetchNotiByType(messageType: 'REGIMEN');

    customerOverviewMED.value =
        await notifyRepo.fetchNotiByType(messageType: 'MED');

    customerOverviewMESSAGE.value =
        await notifyRepo.fetchNotiByType(messageType: 'MESSAGE');
  }

  getNotifyByTypeLoadmore() {}
}

enum TypeNoty {
  ARTICLE,
  REGIMEN,
  MED,
  MESSAGE,
}
