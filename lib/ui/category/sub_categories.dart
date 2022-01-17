import 'package:flutter/material.dart';
import 'package:izle/controller/fitler_detal_controller.dart';
import 'package:izle/controller/sub_category_controller.dart';
import 'package:izle/models/categories/main_categories_model.dart';
import 'package:izle/ui/category/result_ads.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';
import 'package:izle/utils/my_prefs.dart';

class SubCategories extends StatefulWidget {
  final int mainCategoryId;
  final int id;
  final String catName;
  final String imgUrl;
  final String? cityName;
  final String? cityId;
  final List<DataCategory> subCategories;
  SubCategories(
      {required this.catName,
      required this.subCategories,
      required this.id,
      required this.mainCategoryId,
      this.cityId,
      this.cityName,
      required this.imgUrl});

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  final SubCategoryController subCategoryController =
      Get.find<SubCategoryController>();
  FilterDetalController filterDetalController =
      Get.find<FilterDetalController>();
  List<DataCategory> subCats = [];
  @override
  void initState() {
    print('init state');
    subCats = widget.subCategories;
    print(subCats.length);
    // subCategoryController.fetchSubCategries(widget.id);
    // print(widget.id);
    // print('this is sub cate iniit');
    // print(subCategoryController.subCategoryList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(context, title: 'categoryy'.tr),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 4,
              ),
              itemCount: subCats.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    filterDetalController.subCategoryName.value =
                        MyPref.lang == 'kr'
                            ? subCats[index].nameEn!
                            : MyPref.lang == 'uz'
                                ? subCats[index].nameUz!
                                : subCats[index].nameRu!;
                    filterDetalController.subCategoryId.value =
                        subCats[index].id!;
                    Get.back();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ResultAds(
                                  mainCategoryId: widget.mainCategoryId,
                                  catId: subCats[index].id!,
                                  catName: MyPref.lang == 'kr'
                                      ? subCats[index].nameEn!
                                      : MyPref.lang == 'uz'
                                          ? subCats[index].nameUz!
                                          : subCats[index].nameRu!,
                                  cityId: widget.cityId,
                                  cityName: widget.cityName,
                                )));
                  },
                  child: Container(
                    color: ColorPalate.addsBackgroundColor,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // 'Все в Детский мир',
                          MyPref.lang == 'kr'
                              ? subCats[index].nameEn.toString()
                              : MyPref.lang == 'uz'
                                  ? subCats[index].nameUz.toString()
                                  : subCats[index].nameRu.toString(),
                          style: FontStyles.regularStyle(
                            fontSize: 16,
                            fontFamily: 'Lato',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          // Obx(() {
          //   if (subCategoryController.isLoading.value) {
          //     return Center(
          //       child: CircularProgressIndicator(
          //         valueColor:
          //             AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
          //       ),
          //     );
          //   } else {
          //     return ListView.separated(
          //       reverse: true,
          //       separatorBuilder: (context, index) => SizedBox(
          //         height: 4,
          //       ),
          //       physics: NeverScrollableScrollPhysics(),
          //       shrinkWrap: true,
          //       itemCount: subCategoryController.subCategoryList.length,
          //       itemBuilder: (context, index) {
          //         return GestureDetector(
          //           // onTap: () {
          //           //   Get.to(() => ResultAds(
          //           //         catId: subCategoryController
          //           //             .subCategoryList[index].id
          //           //             .toString(),
          //           //       ));
          //           // },
          //           child: Container(
          //             color: ColorPalate.addsBackgroundColor,
          //             padding: const EdgeInsets.symmetric(
          //                 vertical: 10, horizontal: 29),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   // 'Все в Детский мир',
          //                   subCategoryController.subCategoryList[index].nameRu
          //                       .toString(),
          //                   style: FontStyles.regularStyle(
          //                     fontSize: 16,
          //                     fontFamily: 'Lato',
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         );
          //       },
          //     );
          //   }
          // }),
        ],
      ),
    );
  }
}
