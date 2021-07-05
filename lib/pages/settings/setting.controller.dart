import 'package:app_mobile_bacsichidinh/components/controller/app_scaffold_controller.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {
  String? selectedBackground;
  // final List<String> typeBackground = ["Đơn sắc", "Hình ảnh"];
  final box = GetStorage();
  final List<BackgroundSettingModel> listBackground = [
    BackgroundSettingModel(1, 1, '${appColor[0]}'),
    BackgroundSettingModel(2, 1, '${appColor[1]}'),
    BackgroundSettingModel(3, 1, '${appColor[2]}'),
    BackgroundSettingModel(4, 1, '${appColor[3]}'),
    BackgroundSettingModel(
      5,
      2,
      'https://image.freepik.com/free-vector/hand-drawn-doctors-nurses-pack_52683-60486.jpg',
    ),
    BackgroundSettingModel(
      6,
      2,
      'https://image.freepik.com/free-vector/doctor-character-background_1270-84.jpg',
    ),
    BackgroundSettingModel(
      7,
      2,
      'https://image.freepik.com/free-vector/doctors-nurses-assistants-prepare-treat-patients_1150-35020.jpg',
    ),
    BackgroundSettingModel(
      8,
      2,
      'https://image.freepik.com/free-vector/organic-flat-doctors-nurses-illustration_23-2148901759.jpg',
    ),
  ];
  int? select;
  bool? isBackGround;
  bool? onlyLogin;
  final AppScaffoldController appScaffoldController = Get.find();
  BackgroundSettingModel? data;

  @override
  void onInit() {
    box.writeIfNull(AppKey.saveLogin, true);
    print(box.read(AppKey.settingBackground));
    onlyLogin = box.read(AppKey.saveLogin);
    data = BackgroundSettingModel.fromJson(box.read(AppKey.settingBackground));
    if (data == null) {
      box.write(AppKey.settingBackground, listBackground[0].toJson());
      isBackGround = false;
      select = listBackground[0].id - 1;
    } else {
      data!.type == 1 ? isBackGround = false : isBackGround = true;
      select = data!.id;
    }
    super.onInit();
  }

  void onSelectBackground(int index) {
    select = index;
    box.write(AppKey.settingBackground, listBackground[select! - 1].toJson());
    appScaffoldController.settingBg = listBackground[select! - 1];
    appScaffoldController.update();
    update();
  }

  onChangeBackground(bool value) {
    isBackGround = value;
    update();
  }

  onChangeOnlyLogin(bool value) {
    onlyLogin = value;
    box.write(AppKey.saveLogin, onlyLogin);
    update();
  }
}

var appColor = ["#ffffff", "#4CAF50", "#607D8B", "#03A9F4"];
var imageBackground = [
  'https://image.freepik.com/free-vector/hand-drawn-doctors-nurses-pack_52683-60486.jpg',
  'https://image.freepik.com/free-vector/doctor-character-background_1270-84.jpg',
  'https://image.freepik.com/free-vector/doctors-nurses-assistants-prepare-treat-patients_1150-35020.jpg',
  'https://image.freepik.com/free-vector/organic-flat-doctors-nurses-illustration_23-2148901759.jpg'
];
// class BackgroundSettingModel {
//   final int id, type;
//   final dynamic data;

//   BackgroundSettingModel(this.id, this.type, this.data);
// }

class BackgroundSettingModel {
  BackgroundSettingModel(
    this.id,
    this.type,
    this.data,
  );

  int id;
  int type;
  String data;

  factory BackgroundSettingModel.fromJson(Map<String, dynamic> json) =>
      BackgroundSettingModel(
        json["id"] == null ? null : json["id"],
        json["type"] == null ? null : json["type"],
        json["data"] == null ? null : json["data"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "data": data,
      };
}
