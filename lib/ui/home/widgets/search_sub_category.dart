import 'package:flutter/material.dart';
import 'package:izle/controller/filter_search_controller.dart';
import 'package:izle/controller/sub_category_controller.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';
import 'package:izle/ui/home/widgets/search_reasult.dart';
import 'package:izle/utils/my_prefs.dart';

class SearchSubCategories extends StatefulWidget {
  final int id;
  final String mainCatName;
  SearchSubCategories({required this.id, required this.mainCatName});

  @override
  State<SearchSubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SearchSubCategories> {
  final SubCategoryController subCategoryController =
      Get.find<SubCategoryController>();
  final FilterSearchController filterSearchController =
      Get.find<FilterSearchController>();
  // FilterDetalController filterDetalController =
  //     Get.find<FilterDetalController>();
  // List<DataCategory> subCats = [];
  @override
  void initState() {
    print('init state');
    subCategoryController.fetchSubCategries(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        appBar: customAppBar1(context, title: 'subCategory'),
        body: Obx(() {
          if (subCategoryController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPalate.mainColor,
              ),
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    print(widget.id);
                    filterSearchController.mainCategoryName.value =
                        widget.mainCatName;
                    filterSearchController.mainCategoryId.value = widget.id;
                    Get.back();
                    Get.back();

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => SearchResult(
                                  cityId:
                                      filterSearchController.cityId.value == 0
                                          ? ""
                                          : filterSearchController.cityId.value
                                              .toString(),
                                  catId: filterSearchController
                                              .subCategoryId.value ==
                                          0
                                      ? filterSearchController
                                          .mainCategoryId.value
                                          .toString()
                                      : filterSearchController
                                          .subCategoryId.value
                                          .toString(),
                                  priceFinish: filterSearchController
                                          .price_finish.value.isEmpty
                                      ? ""
                                      : filterSearchController
                                          .price_finish.value,
                                  priceSort: filterSearchController
                                          .sortingType.value.isEmpty
                                      ? ""
                                      : filterSearchController
                                          .sortingType.value,
                                  priceStart: filterSearchController
                                          .price_start.value.isEmpty
                                      ? ""
                                      : filterSearchController
                                          .price_start.value,
                                )));
                  },
                  child: Card(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        width: double.infinity,
                        // color: ColorPalate.lightGreen,
                        child: Text(
                          'Все ' + widget.mainCatName,
                          style: FontStyles.regularStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                          ),
                        )),
                  ),
                ),
                ListView.separated(
                  reverse: true,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 4,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subCategoryController.subCategoryList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        filterSearchController.mainCategoryName.value =
                            widget.mainCatName;
                        filterSearchController.mainCategoryId.value =
                            subCategoryController.subCategoryList[index].id!;
                        filterSearchController.subCategoryName.value =
                            MyPref.lang == 'uz'
                                ? subCategoryController
                                    .subCategoryList[index].nameUz!
                                : MyPref.lang == 'kr'
                                    ? subCategoryController
                                        .subCategoryList[index].nameEn!
                                    : subCategoryController
                                        .subCategoryList[index].nameRu!;
                        print(filterSearchController.mainCategoryId.value);
                        print(filterSearchController.subCategoryName.value);
                        Get.back();
                        Get.back();
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => SearchResult(
                                      cityId: filterSearchController
                                                  .cityId.value ==
                                              0
                                          ? ""
                                          : filterSearchController.cityId.value
                                              .toString(),
                                      catId: filterSearchController
                                                  .subCategoryId.value ==
                                              0
                                          ? filterSearchController
                                              .mainCategoryId.value
                                              .toString()
                                          : filterSearchController
                                              .subCategoryId.value
                                              .toString(),
                                      priceFinish: filterSearchController
                                              .price_finish.value.isEmpty
                                          ? ""
                                          : filterSearchController
                                              .price_finish.value,
                                      priceSort: filterSearchController
                                              .sortingType.value.isEmpty
                                          ? ""
                                          : filterSearchController
                                              .sortingType.value,
                                      priceStart: filterSearchController
                                              .price_start.value.isEmpty
                                          ? ""
                                          : filterSearchController
                                              .price_start.value,
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
                              MyPref.lang == 'uz'
                                  ? subCategoryController
                                      .subCategoryList[index].nameUz
                                      .toString()
                                  : MyPref.lang == 'kr'
                                      ? subCategoryController
                                          .subCategoryList[index].nameEn
                                          .toString()
                                      : subCategoryController
                                          .subCategoryList[index].nameRu
                                          .toString(),
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
                )
              ],
            );
          }
        }));
  }
}
