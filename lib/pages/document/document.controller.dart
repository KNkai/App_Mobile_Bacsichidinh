import 'package:app_mobile_bacsichidinh/models/article.model.dart';
import 'package:app_mobile_bacsichidinh/models/article_category.model.dart';
import 'package:app_mobile_bacsichidinh/pages/home/home.controller.dart';
import 'package:app_mobile_bacsichidinh/repositories/document/document.repo.dart';
import 'package:get/get.dart';

var pageNum = 1;
const pageSize = 10;

class DocumentController extends GetxController {
  final documentRepo = DocumentRepositories();
  final HomeController homeController = Get.find();
  RxList<ArticleCate> listArticleCate = <ArticleCate>[].obs;
  RxList<Article> listArticle = <Article>[].obs;
  Rx<ArticleCate> currentArticleCate = ArticleCate().obs;
  @override
  void onInit() async {
    currentArticleCate.value = ArticleCate(
        articleCategoryId: 0, orderNo: 0, articleCategoryName: 'Tất cả');
    listArticleCate.value = await documentRepo.fetchAllArticleCate();
    listArticleCate.insert(
      0,
      currentArticleCate.value,
    );
    listArticleCate.sort((a, b) => a.orderNo!.compareTo(b.orderNo!));
    // print("in trong controller: ${listArticleCate.length}");
    getListArticleByCateId(currentArticleCate.value.articleCategoryId ?? 0);
    super.onInit();
  }

  getListArticleByCateId(int cateId) async {
    listArticle.value = await documentRepo.fetchAllArticleByCate(
        doctorId: homeController.currentUser!.doctorId,
        cateId: cateId,
        pageNum: pageNum,
        pageSize: pageSize);
    listArticle.refresh();
  }
}
