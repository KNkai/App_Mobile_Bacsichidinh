import 'package:app_mobile_bacsichidinh/models/article_detail.model.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/repositories/document/document.repo.dart';
import 'package:get/get.dart';

class DocumentDetailController extends GetxController {
  final int documentId;
  final HomeController homeController = Get.find();
  final documentRepo = DocumentRepositories();

  Rx<ArticleDetail> articleDetail = ArticleDetail().obs;

  DocumentDetailController({required this.documentId});
  @override
  void onInit() async {
    articleDetail.value = await documentRepo.fetchAllArticleDetailById(
        doctorId: homeController.currentUser!.doctorId, id: documentId);
    update();
    super.onInit();
  }
}
