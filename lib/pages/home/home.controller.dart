import 'package:app_mobile_bacsichidinh/components/app_rounded_loading_button.dart';
import 'package:app_mobile_bacsichidinh/models/customer.model.dart';
import 'package:app_mobile_bacsichidinh/models/user.model.dart';
import 'package:app_mobile_bacsichidinh/pages/reg_med/reg_med.page.dart';
import 'package:app_mobile_bacsichidinh/pages/reg_new_customer/reg_new_customer.page.dart';
import 'package:app_mobile_bacsichidinh/repositories/customer/customer.repo.dart';
import 'package:app_mobile_bacsichidinh/repositories/reg_med/reg_med.repo.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:app_mobile_bacsichidinh/utils/app_size.dart';
import 'package:app_mobile_bacsichidinh/utils/app_theme_text.dart';
import 'package:app_mobile_bacsichidinh/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

var pageNumber = 1;
const pageSize = 5;
var pageNumberSearch = 1;
const pageSizeSearch = 5;

class HomeController extends GetxController {
  Users? currentUser;
  var box = GetStorage();
  var fullNameTextField = TextEditingController();
  var phoneTextField = TextEditingController();
  var bodTextField = TextEditingController();
  var searchTextField = TextEditingController();
  final searchFocusNode = FocusNode();
  var ageTextField = 'Tuổi'.obs;

  var bodValidate = false.obs;
  var regBtnController = RoundedLoadingButtonController();
  var btnSearchController = RoundedLoadingButtonController();

  final regMedRepo = RegMedRepositories();

  var isSearch = false.obs;

  // Rx<CustomerOverview> customerOverview = CustomerOverview().obs;
  Rx<CustomerOverview> customerOverview = CustomerOverview().obs;
  Rx<CustomerOverview> customerSearchOverview = CustomerOverview().obs;

  final customerRepo = CustomerRepositories();

  List<Customer> listMatchCustomer = [];
  // List<Customer> listMatchCustomer = [];

  ScrollController? scrollController;

  var gender = true.obs;

  Rx<int> countPhoneNumber = 0.obs;

  var totalPage = 1;
  var totalPageSearch = 1;

  @override
  void onInit() async {
    pageNumber = 1;
    getCurrentUser();
    if (box.read(AppKey.apiKey) != null || box.read(AppKey.apiKey) != '')
      await getCustomerOverView();

    scrollController = ScrollController();
    update();
    scrollController!
      ..addListener(() {
        // if(scrollController.)
        if (isSearch.value == false) if (scrollController!.position.pixels ==
            scrollController!.position.maxScrollExtent) {
          if (isSearch.value == false) {
            getCustomerOverViewLoadmore();
          } else {
            getCustomerSearchOverViewLoadmore();
          }
        }
      });

    super.onInit();
  }

  @override
  void onClose() {
    fullNameTextField.clear();
    phoneTextField.clear();
    bodTextField.clear();
    ageTextField.value = 'Tuổi';
    countPhoneNumber.value = 0;
    super.onInit();
  }

  onChangeGender(value) {
    gender.value = value;
  }

  bool getCurrentUser() {
    if (box.read(AppKey.currentUserKey) != null) {
      currentUser = Users.fromJson(box.read(AppKey.currentUserKey));
      return true;
    }
    return false;
  }

  getCustomerOverView() async {
    // print();
    pageNumber = 1;
    if ((await customerRepo.fetchListCustomer(
                pageNumber: pageNumber, pageSize: pageSize))
            .totalItems ==
        0) {
      customerOverview.value.customerOverviewCombine =
          CustomerOverviewCombine(listCustomer: []);
    } else {
      customerOverview.value = await customerRepo.fetchListCustomer(
          pageNumber: pageNumber, pageSize: pageSize);
      if (customerOverview.value.totalItems! % pageSize == 0) {
        totalPage = int.parse(
            (customerOverview.value.totalItems! / pageSize).toString());
      } else {
        totalPage = int.parse((customerOverview.value.totalItems! / pageSize)
                .toString()
                .split('.')[0]) +
            1;
      }
    }
  }

  getCustomerOverViewLoadmore() async {
    if (isSearch.value == false) {
      print("in so trang lan 1: $pageNumber");
      print(
          "in so trang lan 1: ${customerOverview.value.customerOverviewCombine!.paging!.totalPage}");
      if (customerOverview
              .value.customerOverviewCombine!.listCustomer!.length !=
          0) if (pageNumber < totalPage) {
        // 0) if (pageNumber < customerOverview.value.customerOverviewCombine!.paging!.totalPage) {
        pageNumber++;
        print("in so trang $pageNumber");
        // medCommissionModelRequiredBaseLoadmore.pageNumber = pageNumber;
        customerOverview.value.customerOverviewCombine!.listCustomer!.addAll(
            (await customerRepo.fetchListCustomer(
                    pageNumber: pageNumber, pageSize: pageSize))
                .customerOverviewCombine!
                .listCustomer!);
      }
      customerOverview.refresh();
    }
  }

  getCustomerSearchOverView() async {
    pageNumberSearch = 1;
    if ((await customerRepo.fetchListCustomerSearch(
                doctorId: currentUser!.doctorId,
                keyWord: searchTextField.text,
                pageNumber: pageNumberSearch,
                pageSize: pageSizeSearch))
            .totalItems ==
        0) {
      customerSearchOverview.value.customerOverviewCombine =
          CustomerOverviewCombine(listCustomer: []);
    } else {
      customerSearchOverview.value = await customerRepo.fetchListCustomerSearch(
          doctorId: currentUser!.doctorId,
          keyWord: searchTextField.text,
          pageNumber: pageNumberSearch,
          pageSize: pageSizeSearch);
      if (customerSearchOverview.value.totalItems! % pageSizeSearch == 0) {
        totalPageSearch = int.parse(
            (customerSearchOverview.value.totalItems! / pageSizeSearch)
                .toString());
      } else {
        totalPageSearch = int.parse(
                (customerSearchOverview.value.totalItems! / pageSizeSearch)
                    .toString()
                    .split('.')[0]) +
            1;
      }
    }
    customerSearchOverview.refresh();
  }

  getCustomerSearchOverViewLoadmore() async {
    if (isSearch.value == true) {
      print("in so trang lan 1: $pageNumberSearch");
      print(
          "in so trang lan 1: ${customerSearchOverview.value.customerOverviewCombine!.paging!.totalPage}");
      if (customerSearchOverview
              .value.customerOverviewCombine!.listCustomer!.length !=
          0) if (pageNumberSearch < totalPageSearch) {
        // 0) if (pageNumber < customerOverview.value.customerOverviewCombine!.paging!.totalPage) {
        pageNumberSearch++;
        print("in so trang $pageNumberSearch");
        // medCommissionModelRequiredBaseLoadmore.pageNumber = pageNumber;
        customerSearchOverview.value.customerOverviewCombine!.listCustomer!
            .addAll((await customerRepo.fetchListCustomer(
                    pageNumber: pageNumberSearch, pageSize: pageSizeSearch))
                .customerOverviewCombine!
                .listCustomer!);
      }
      customerSearchOverview.refresh();
    }
  }

  String address(int index) {
    String add = interpolate([
      listMatchCustomer[index].diaChi ?? '',
      listMatchCustomer[index].tenPhuongXa ?? '',
      listMatchCustomer[index].tenQuanHuyen ?? '',
      listMatchCustomer[index].tenTinhThanh ?? '',
    ]);
    return add;
  }
  // String address(int index) {
  //   String add = interpolate([
  //     listMatchCustomer[index].cAddress ?? '',
  //     listMatchCustomer[index].wardName ?? '',
  //     listMatchCustomer[index].districtName ?? '',
  //     listMatchCustomer[index].provinceName ?? '',
  //   ]);
  //   return add;
  // }

  regMed() async {
    print(bodValidate.value);
    if (fullNameTextField.text == '') {
      snackBarError('Vui lòng nhập họ và tên');
      await 1.delay();
      regBtnController.reset();
    } else if (bodTextField.text == '') {
      snackBarError('Vui lòng nhập năm sinh');
      await 1.delay();
      regBtnController.reset();
    } else if (phoneTextField.text == '') {
      snackBarError('Vui lòng nhập số điện thoại');
      await 1.delay();
      regBtnController.reset();
    } else if (ageTextField.value == "Tuổi") {
      snackBarError('Vui lòng nhập đúng năm sinh');
      await 1.delay();
      regBtnController.reset();
    } else if (bodValidate.value) {
      snackBarError('Vui lòng nhập đúng năm sinh');
      await 1.delay();
      regBtnController.reset();
    } else if (phoneTextField.text.length != 10) {
      snackBarError('Vui lòng nhập số điện thoại đủ 10 số');
      await 1.delay();
      regBtnController.reset();
    } else {
      listMatchCustomer = await regMedRepo.fetchListMatchCustomers(
        // listMatchCustomer = await regMedRepo.fetchListMatchCustomers(
        fullName: fullNameTextField.text,
        age: int.parse(bodTextField.text),
      );
      if (listMatchCustomer.length != 0) {
        await Get.bottomSheet(
          Container(
            padding: const EdgeInsets.all(AppSize.kConstantPadding * 2),
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.borderRadius),
                topRight: Radius.circular(AppSize.borderRadius),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Text(
                        "Tìm thấy ${listMatchCustomer.length} khách hàng cũ.",
                        style: TextStyle(color: AppColor.white),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () async {
                          // print(1);
                          // Get.back();
                          await Get.to(
                            RegNewCustomer(
                              customerTemp: Customer(
                                gioiTinh:
                                    gender.value ? GioiTinh.M : GioiTinh.F,
                                namSinh: int.parse(bodTextField.text),
                                hoTen: fullNameTextField.text,
                                dienThoai: phoneTextField.text,
                              ),
                            ),
                            // RegNewCustomer(
                            //   customerTemp: Customer(
                            //     genderId: gender.value ? 0 : 1,
                            //     bithdayYear: int.parse(bodTextField.text),
                            //     hoTen: fullNameTextField.text,
                            //     dienThoai: phoneTextField.text,
                            //   ),
                            // ),
                            preventDuplicates: false,
                          );
                        },
                        child: Text(
                          "Vẫn tạo mới",
                          style: TextStyle(color: AppColor.white),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: Get.height / 2,
                      minHeight: Get.height / 3,
                    ),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          listMatchCustomer.length,
                          (index) => Padding(
                            padding: const EdgeInsets.only(
                                bottom: AppSize.kConstantPadding),
                            child: ItemOldCustomer(
                              customer: listMatchCustomer[index],
                              address: address(index),
                              onTap: () async {
                                await Get.to(
                                  RegMed(customer: listMatchCustomer[index]),
                                  preventDuplicates: false,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          enableDrag: true,
          isDismissible: true,
        );
        regBtnController.success();
        await 1.delay();
      } else {
        if (fullNameTextField.text.trim().split(' ').length >= 2) {
          regBtnController.success();
          await 1.delay();
          await Get.to(
            RegNewCustomer(
              customerTemp: Customer(
                gioiTinh: gender.value ? GioiTinh.M : GioiTinh.F,
                namSinh: int.parse(bodTextField.text),
                hoTen: fullNameTextField.text,
                dienThoai: phoneTextField.text,
              ),
            ),
            // RegNewCustomer(
            //   customerTemp: Customer(
            //     genderId: gender.value ? 0 : 1,
            //     bithdayYear: int.parse(bodTextField.text),
            //     hoTen: fullNameTextField.text,
            //     dienThoai: phoneTextField.text,
            //   ),
            // ),
            preventDuplicates: false,
          );
        } else {
          snackBarError('Vui lòng nhập đầy đủ họ tên');
          await 1.delay();
          regBtnController.reset();
        }
      }
      // await 1.delay();
      // regBtnController.success();
      regBtnController.reset();
    }
  }

  onSearchCustomer() {
    isSearch.value = true;
  }
}

class ItemOldCustomer extends StatelessWidget {
  final Customer customer;
  // final Customer customer;
  final String address;
  final VoidCallback onTap;
  const ItemOldCustomer(
      {Key? key,
      required this.customer,
      required this.address,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
        color: AppColor.white.withOpacity(0.1),
      ),
      padding: const EdgeInsets.all(AppSize.kConstantPadding),
      child: TextButton(
        onPressed: onTap,
        child: Column(
          children: [
            Text(
              "${customer.hoTen} - ${DateTime.now().year - (customer.namSinh as num)} tuổi",
              style: TextStyle(color: AppColor.white),
            ),
            const SizedBox(height: AppSize.kConstantPadding),
            Text(
              address.trim().length == 0
                  ? "Chưa có địa chỉ"
                  : "Địa chỉ: $address",
              style: TextStyle(color: AppColor.white, fontSize: subTitleSize),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
