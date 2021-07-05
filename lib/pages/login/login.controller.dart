import 'dart:async';

import 'package:app_mobile_bacsichidinh/components/app_navbar.dart';
import 'package:app_mobile_bacsichidinh/components/app_rounded_loading_button.dart';
import 'package:app_mobile_bacsichidinh/components/app_text_editing_controller.dart';
import 'package:app_mobile_bacsichidinh/models/user.model.dart';
import 'package:app_mobile_bacsichidinh/pages/analytics/analytics.controller.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/pages/login/components/otp_widget.login.dart';
import 'package:app_mobile_bacsichidinh/pages/login/components/phone_widget.login.dart';
import 'package:app_mobile_bacsichidinh/repositories/login/login.repo.dart';
import 'package:app_mobile_bacsichidinh/utils/app_color.dart';
import 'package:app_mobile_bacsichidinh/utils/app_key.dart';
import 'package:app_mobile_bacsichidinh/utils/app_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class LoginController extends GetxController {
  PageController pageController = PageController();
  List<double>? heights;
  int currentPage = 0;
  TextController? otpController = TextController(),
      phoneController = TextController();
  FocusNode? otpFocusNode = FocusNode(), phoneFocusNode = FocusNode();
  List<Widget> listPage = [PhoneWidget(), OTPWidget()];

  ///check fingerprint
  final LocalAuthentication auth = LocalAuthentication();
  Rx<SupportState> supportState = Rx<SupportState>(SupportState.unknown);
  String authorized = 'Không thành công';
  bool isAuthenticating = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;
  bool showLoading = false;
  StateSendOTP? stateSendOTP;
  AuthCredential? _phoneAuthCredential;
  RxBool hasError = false.obs;
  StreamController<ErrorAnimationType>? errorController;
  final HomeController _homeController = Get.find();
  var userLogin;

  final loginRepo = LoginRepositories();

  final loginBtnController = RoundedLoadingButtonController();
  final otpVerifyButtonController = RoundedLoadingButtonController();

  final box = GetStorage();

  @override
  void onInit() {
    pageController =
        PageController(initialPage: 0, viewportFraction: 1, keepPage: true);

    stateSendOTP = StateSendOTP.IsWaiting;
    _auth = FirebaseAuth.instance;
    errorController = StreamController<ErrorAnimationType>();
    super.onInit();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  onBack() {
    pageController.page == listPage.length - 1
        ? pageController.previousPage(
            duration: Duration(milliseconds: 100), curve: Curves.bounceIn)
        : Get.back();
    loginBtnController.stop();
  }

  hasAccount() {
    if (box.read(AppKey.currentUserKey) != null) return true;
    return false;
  }

  Future<SupportState> checkSupportDevice() async {
    return supportState.value = await auth.isDeviceSupported()
        ? SupportState.supported
        : SupportState.unsupported;
  }

  Future<void> authenticate() async {
    bool authenticated = false;
    Get.put<AnalyticsController>(AnalyticsController(), permanent: true);
    try {
      isAuthenticating = true;
      authorized = 'Xác Nhận Vân Tay';
      authenticated = await auth.authenticate(
          localizedReason: 'Đăng nhập bằng vân tay.',
          useErrorDialogs: true,
          stickyAuth: true);
      isAuthenticating = false;
    } on PlatformException catch (e) {
      print(e);
      isAuthenticating = false;
      authorized = "Lỗi - ${e.message}";
      return;
    }

    authorized = authenticated ? 'Thành công' : 'Không thành công';
    if (authenticated) {
      Get.offAll(AppNavBar());
      // Get.offAll(HomePage());
      loginSuccess();
    }
  }

  ///phone
  signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    showLoading = true;
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      showLoading = false;
      if (authCredential.user != null) {
        Get.to(AppNavBar());
      }
    } on FirebaseAuthException catch (e) {
      showLoading = false;
      snackBarError('lỗi');
    }
  }

  verifyPhoneNumber(String phoneNumber) async {
    if (phoneNumber.length < 10 || phoneNumber.length > 11) {
      snackBarError('Vui lòng nhập đúng số điện thoại!');
      await 0.5.delay();
      loginBtnController.stop();
    } else {
      if (phoneNumber[0] != "0") {
        snackBarError('Vui lòng nhập đúng số điện thoại!');
        await 0.5.delay();
        loginBtnController.reset();
      } else {
        sendOtp(phoneNumber.replaceFirst("0", "+84"));
        phoneFocusNode!.unfocus();
      }
    }
  }

  sendOtp(String _phoneNumber) async {
    stateSendOTP = StateSendOTP.IsSending;
    print(_phoneNumber);

    update();

    await _auth.verifyPhoneNumber(
      // phoneNumber: "+84123456789",
      phoneNumber: _phoneNumber,
      verificationCompleted: (phoneAuthCredential) async {
        stateSendOTP = StateSendOTP.IsSuccess;

        showLoading = false;
        loginBtnController.success();
        await 0.5.delay();
        pageController.nextPage(
            duration: Duration(milliseconds: 100), curve: Curves.bounceIn);

        update();
      },

      verificationFailed: (verificationFailed) async {
        stateSendOTP = StateSendOTP.IsFailed;
        showLoading = false;
        snackBarError(
            "Số điện thoại nhập sai quá nhiều lần, vui lòng đăng nhập bằng số khác");
        stateSendOTP = StateSendOTP.IsWaiting;
        print(verificationFailed);
        loginBtnController.stop();
        update();
      },
      codeSent: (verificationId, resendingToken) async {
        stateSendOTP = StateSendOTP.IsSending;
        showLoading = false;
        this.verificationId = verificationId;
        print("id of codeSent: $verificationId");
        update();
      },
      timeout: Duration(seconds: 10),
      codeAutoRetrievalTimeout: (verificationId) async {
        // await Get.to(OtpPage());
        stateSendOTP = StateSendOTP.IsTimeOut;
        print(verificationId);
        print(stateSendOTP);
        showLoading = false;
        loginBtnController.success();
        await 0.5.delay();
        pageController.nextPage(
            duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
        update();
        // snackBarError('Vui lòng nhập đúng số điện thoại!');
        // update();
      },
    );
  }

  ///otp
  loginWithFirebase(String otp) async {
    this._phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: this.verificationId!, smsCode: otp);

    /// This method is used to login the user
    /// `AuthCredential`(`_phoneAuthCredential`) is needed for the signIn method
    /// After the signIn method from `AuthResult` we can get `FirebaserUser`(`_firebaseUser`)
    try {
      await FirebaseAuth.instance
          .signInWithCredential(this._phoneAuthCredential!)
          .then((UserCredential authRes) async {
        User? _firebaseUser = authRes.user;

        String firebaseToken = await _firebaseUser!.getIdToken();
        print(_firebaseUser.phoneNumber.toString());
        print(_firebaseUser.photoURL.toString());
        print('firebase token is ' + firebaseToken);
        await box.write(AppKey.apiKey, _firebaseUser.uid);
        await 1.delay();

        if (box.read(AppKey.apiKey) != null || box.read(AppKey.apiKey) != '') {
          // _homeController.onDelete();
          _homeController.onInit();
        }
        // await _homeController.getCustomerOverView();

        ///delete user in firebase
        // _firebaseUser.delete();

        processLogin(firebaseToken, _firebaseUser);
        // Get.offAll(AppNavBar());
      });
    } catch (e) {
      snackBarError("Sai OTP, vui lòng nhập lại!");
      await 0.5.delay();
      otpVerifyButtonController.reset();
      hasError.value = true;
      print(e.toString());
    }
  }

  processLogin(token, User _firebaseUser) async {
    userLogin = await loginRepo.fetchUser(token);

    if (userLogin is Users) {
      await box.write(AppKey.currentUserKey, (userLogin as Users).toJson());

      if (_homeController.getCurrentUser())
        Get.put<AnalyticsController>(AnalyticsController(), permanent: true);
      await 1.delay();
      otpVerifyButtonController.success();
      await 1.delay();
      Get.offAll(AppNavBar());
      loginSuccess();
    } else {
      // _firebaseUser.delete();
      loginFailed(userLogin);
      otpController!.clear();
      0.5.delay();
      otpVerifyButtonController.stop();
      onBack();
    }
  }
}

loginSuccess() {
  return snackBarSuccess(
    "Chúc bạn một ngày làm việc vui vẻ!",
    title: Text(
      'Chào mừng bạn đến với Doctor Check',
      style: TextStyle(
        color: AppColor.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

loginFailed(sms) {
  return snackBarError(sms);
}

enum SupportState {
  unknown,
  supported,
  unsupported,
}

enum StateSendOTP {
  IsFailed,
  IsWaiting,
  IsSending,
  IsSuccess,
  IsTimeOut,
}
