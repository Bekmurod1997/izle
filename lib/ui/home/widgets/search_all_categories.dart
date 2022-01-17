import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/controller/adrvertisement_subCategory_controller.dart';
import 'package:izle/controller/all_categories.dart';
import 'package:izle/controller/for_cat_controller.dart';
import 'package:izle/controller/sub_category_controller.dart';
import 'package:izle/constants/colors.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/home/widgets/search_sub_category.dart';
import 'package:izle/utils/my_prefs.dart';

class SearchAllCategoryScreen extends StatefulWidget {
  @override
  State<SearchAllCategoryScreen> createState() =>
      _SearchAllCategoryScreenState();
}

class _SearchAllCategoryScreenState extends State<SearchAllCategoryScreen> {
  final ForSubCategoryController forSubCategoryController =
      Get.put(ForSubCategoryController());
  final AdvertismentSubCategoryController advertismentSubCategoryController =
      Get.find<AdvertismentSubCategoryController>();

  final MainCategories mainCategories = Get.find<MainCategories>();

  final SubCategoryController subCategoryController =
      Get.find<SubCategoryController>();

  @override
  void initState() {
    mainCategories.fetchMainCategries();
    print(mainCategories.categoriesList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('categoryy'.tr,
            style: FontStyles.regularStyle(
              fontSize: 24,
              fontFamily: 'Lato',
            )),
      ),
      backgroundColor: ColorPalate.mainPageColor,
      body: Obx(() {
        if (mainCategories.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: mainCategories.categoriesList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.to(() => SearchSubCategories(
                      id: mainCategories.categoriesList[index].id!,
                      mainCatName: MyPref.lang == 'uz'
                          ? mainCategories.categoriesList[index].nameUz!
                          : MyPref.lang == 'kr'
                              ? mainCategories.categoriesList[index].nameEn!
                              : mainCategories.categoriesList[index].nameRu!,
                    )),
                // onTap: () {
                //   forSubCategoryController
                //       .mainCatId(mainCategories.categoriesList[index].id);
                //   filterDetalController.changerMainCategoryId(
                //       mainCategoryIdd:
                //           mainCategories.categoriesList[index].id!);

                //   filterDetalController.changerMainCategoryName(
                //       catName: mainCategories.categoriesList[index].nameRu!);
                //   print(filterDetalController.mainCategoryName.value);
                //   Get.to(() => ResultAds(
                //         mainCategoryId:
                //             mainCategories.categoriesList[index].id!,
                //         catId: mainCategories.categoriesList[index].id!,
                //         catName: mainCategories.categoriesList[index].nameRu
                //             .toString(),
                //         imgUrl: mainCategories.categoriesList[index].photo!,
                //       ));
                // },
                // onTap: () => Get.to(() => SubCategories(
                //       id: mainCategories.categoriesList[index].id!,
                //       catName: mainCategories.categoriesList[index].nameRu!,
                //       imgUrl: mainCategories.categoriesList[index].photo!,
                //     )),
                child: Card(
                  color: ColorPalate.addsBackgroundColor,
                  child: ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: ColorPalate.categoryBackground,
                          shape: BoxShape.circle),
                      child: Center(
                          child: SvgPicture.network('http://izle.loko.uz/' +
                              mainCategories.categoriesList[index].photo!)),
                    ),
                    title: Text(
                      MyPref.lang == 'uz'
                          ? mainCategories.categoriesList[index].nameUz!
                          : MyPref.lang == 'kr'
                              ? mainCategories.categoriesList[index].nameEn!
                              : mainCategories.categoriesList[index].nameRu!,
                      style: FontStyles.semiBoldStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                      ),
                    ),
                    subtitle: Text(
                      mainCategories.categoriesList[index].adsCount.toString(),
                      style: FontStyles.regularStyle(
                        fontSize: 10,
                        fontFamily: 'Lato',
                      ),
                    ),
                    trailing: SvgPicture.asset('assets/icons/next-icon.svg'),
                  ),
                ),
              );
            },
          );
        }
      }),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
