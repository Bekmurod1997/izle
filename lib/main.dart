import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:izle/controller/adrvertisement_subCategory_controller.dart';
import 'package:izle/controller/all_ads_controller.dart';
import 'package:izle/controller/all_categories.dart';
import 'package:izle/controller/all_cities_controller.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/controller/favorities_controller.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/controller/product_detail_controller.dart';
import 'package:izle/controller/single_chat_controller.dart';
import 'package:izle/controller/sub_category_controller.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/pageview/my_pageview.dart';
import 'package:get/get.dart';
import 'package:izle/ui/nav.dart';
import 'package:izle/utils/my_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PageNavigationController pageNav = Get.put(PageNavigationController());

  final MainCategories mainCategories = Get.put(MainCategories());
  final UserInfoController userInfo = Get.put(UserInfoController());

  final ProductDetailController productDetailController =
      Get.put(ProductDetailController());
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final AllAdsController allAdsController = Get.put(AllAdsController());
  // final AllAdvertisementsController allAdvertisementsController =
  //     Get.put(AllAdvertisementsController());
  final AdvertismentSubCategoryController advertismentSubCategoryController =
      Get.put(AdvertismentSubCategoryController());
  final SubCategoryController subCategoryController =
      Get.put(SubCategoryController());
  final CreatingAddInfoController creatingAddInfoController =
      Get.put(CreatingAddInfoController());
  final SingleChatController singleChatController =
      Get.put(SingleChatController());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPref.loginLanding == '' ? MyPageView() : NavScreen(),
      // home: NavScreen(),
    );
  }
}
