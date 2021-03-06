import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/controller/all_categories.dart';
import 'package:izle/controller/all_regions_controller.dart';
import 'package:izle/controller/filter_search_controller.dart';
import 'package:izle/controller/final_all_categories_controller.dart';
import 'package:izle/controller/sub_category_controller.dart';
import 'package:izle/models/all_categories_model.dart' as g;
import 'package:izle/models/all_regions_model.dart';
import 'package:izle/models/categories/main_categories_model.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/home/widgets/search_reasult.dart';
import 'package:izle/utils/my_prefs.dart';

// ignore: must_be_immutable
class FilterPage extends StatefulWidget {
  String? searchTitle;
  FilterPage({this.searchTitle});
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final AllRegionsController allRegionsController =
      Get.find<AllRegionsController>();
  final MainCategories mainCategories = Get.find<MainCategories>();
  final SubCategoryController subCategoryController =
      Get.find<SubCategoryController>();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  final FinalAllCategoriesController finalAllCategoriesController =
      Get.put(FinalAllCategoriesController());
  final FilterSearchController filterSearchController =
      Get.find<FilterSearchController>();
  bool mainCitySelected = false;
  bool mainCategorySelected = false;

  List<DataCategory> subCatList = [];
  List<Childs> allRegions = [];

  List<g.Childs> subCategories = [];

  int selectedIndex = 0;
  int priceFitlerIndex = 0;

  int val = -1;
  int mainCityId = 0;
  int disrtictId = 0;
  int mainCategoryId = 0;
  int subCategoryId = 0;
  String cityChoice = 'city'.tr;
  String districtChoice = 'region'.tr;
  String mainCategoryChoice = 'categoryy'.tr;
  String subCategoryChoice = 'categoryy'.tr;
  bool isPriceSelected = false;
  String sortingType = '';

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      allRegionsController.fetchAllRegions();
      subCategoryController
          .fetchSubCategries(filterSearchController.mainCategoryId.value);
      mainCategories.fetchMainCategries();
      finalAllCategoriesController.fetchAllCategories();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.searchTitle);
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(
        context,
        title: 'filter',
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 30),
            child: Obx(() {
              if (allRegionsController.isLoading.value &&
                  mainCategories.isLoading.value &&
                  finalAllCategoriesController.isLoading.value &&
                  subCategoryController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: ColorPalate.mainColor,
                  ),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'sorting'.tr,
                      style: FontStyles.regularStyle(
                          fontSize: 16, fontFamily: 'Roboto'),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                              sortingType = 'min';
                            });
                            // print(sortingType);
                          },
                          child: Container(
                            width: 101,
                            height: 31,
                            decoration: BoxDecoration(
                                color: selectedIndex == 1
                                    ? ColorPalate.mainColor
                                    : Colors.white,
                                borderRadius: new BorderRadius.circular(
                                  10.0,
                                ),
                                border: Border.all(
                                  color: ColorPalate.mainColor,
                                  width: 2,
                                )),
                            child: Center(
                              child: Text(
                                'cheap'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: selectedIndex == 1
                                      ? Colors.white
                                      : ColorPalate.mainColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 2;
                              sortingType = 'max';
                            });
                            // print(sortingType);
                          },
                          child: Container(
                            width: 101,
                            height: 31,
                            decoration: BoxDecoration(
                                color: selectedIndex == 2
                                    ? ColorPalate.mainColor
                                    : Colors.white,
                                borderRadius: new BorderRadius.circular(
                                  10.0,
                                ),
                                border: Border.all(
                                  color: ColorPalate.mainColor,
                                  width: 2,
                                )),
                            child: Center(
                              child: Text(
                                'expensive'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: selectedIndex == 2
                                      ? Colors.white
                                      : ColorPalate.mainColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 3;
                              sortingType = '';
                            });
                            // print(sortingType);
                          },
                          child: Container(
                            width: 101,
                            height: 31,
                            decoration: BoxDecoration(
                                color: selectedIndex == 3
                                    ? ColorPalate.mainColor
                                    : Colors.white,
                                borderRadius: new BorderRadius.circular(
                                  10.0,
                                ),
                                border: Border.all(
                                  color: ColorPalate.mainColor,
                                  width: 2,
                                )),
                            child: Center(
                              child: Text(
                                'new'.tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: selectedIndex == 3
                                      ? Colors.white
                                      : ColorPalate.mainColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(
                      'category'.tr,
                      style: FontStyles.regularStyle(
                          fontSize: 16, fontFamily: 'Roboto'),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (context, StateSetter setState) {
                                  return AlertDialog(
                                      content: Container(
                                    height: 300,
                                    width: double.maxFinite,
                                    child: CupertinoScrollbar(
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              Divider(
                                                thickness: 1.5,
                                              ),
                                          shrinkWrap: true,
                                          itemCount:
                                              finalAllCategoriesController
                                                  .categoryList.length,
                                          // mainCategories.categoriesList.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              onTap: () {
                                                filterSearchController
                                                        .mainCategoryId.value =
                                                    mainCategories
                                                        .categoriesList[index]
                                                        .id!;
                                                filterSearchController
                                                        .mainCategoryName
                                                        .value =
                                                    // MyPref.lang == 'ru'
                                                    //     ? mainCategories
                                                    //         .categoriesList[index]
                                                    //         .nameRu!
                                                    //     :
                                                    MyPref.lang == 'uz'
                                                        ? mainCategories
                                                            .categoriesList[
                                                                index]
                                                            .nameUz!
                                                        : MyPref.lang == 'kr'
                                                            ? mainCategories
                                                                .categoriesList[
                                                                    index]
                                                                .nameEn!
                                                            : mainCategories
                                                                .categoriesList[
                                                                    index]
                                                                .nameRu!;
                                                filterSearchController
                                                        .subCategoyList =
                                                    finalAllCategoriesController
                                                        .categoryList[index]
                                                        .childs!;
                                                // setState(() {
                                                //   subCategories =
                                                // finalAllCategoriesController
                                                //     .categoryList[index]
                                                //     .childs!;
                                                // });
                                                // print('this is subCategoriss');
                                                // print(filterSearchController
                                                //     .subCategoyList.length);
                                                // print(filterSearchController
                                                //     .subCategoyList.first.nameRu);
                                                // print(filterSearchController
                                                //     .mainCategoryId.value);
                                                Get.back();
                                              },
                                              title: Text(
                                                // MyPref.lang == 'ru'
                                                //     ? finalAllCategoriesController
                                                //         .categoryList[index]
                                                //         .nameRu!
                                                //     :
                                                MyPref.lang == 'uz'
                                                    ? finalAllCategoriesController
                                                        .categoryList[index]
                                                        .nameUz!
                                                    : MyPref.lang == 'kr'
                                                        ? finalAllCategoriesController
                                                            .categoryList[index]
                                                            .nameEn!
                                                        : finalAllCategoriesController
                                                            .categoryList[index]
                                                            .nameRu!,
                                              ),
                                            );
                                          }),
                                    ),
                                  ));
                                });
                              });
                        },
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Text(filterSearchController
                                  .mainCategoryName.value.isEmpty
                              ? 'chooseCategory'.tr
                              : filterSearchController.mainCategoryName.value),
                        ),
                      ),
                    ),
                    // Text(filterSearchController.subCategoyList.isEmpty ||
                    //         filterSearchController.subCategoyList.length == 0
                    //     ? 'pustoy'
                    //     : filterSearchController.subCategoyList.length
                    //         .toString()),
                    SizedBox(height: 12),
                    filterSearchController.mainCategoryName.value.isEmpty
                        ? Container()
                        : Text(
                            'subCategory'.tr,
                            style: FontStyles.regularStyle(
                                fontSize: 16, fontFamily: 'Roboto'),
                          ),
                    filterSearchController.mainCategoryName.value.isEmpty
                        ? Container()
                        : SizedBox(height: 10),
                    filterSearchController.mainCategoryName.value.isEmpty
                        ? Container()
                        : Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder:
                                          (context, StateSetter setState) {
                                        return AlertDialog(
                                            content: Container(
                                                height: 300,
                                                width: double.maxFinite,
                                                child: CupertinoScrollbar(
                                                  child: ListView.separated(
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              Divider(
                                                                thickness: 1.5,
                                                              ),
                                                      itemCount: filterSearchController
                                                                  .subCategoryId
                                                                  .value ==
                                                              0
                                                          ? filterSearchController
                                                              .subCategoyList
                                                              .length
                                                          : subCategoryController
                                                              .subCategoryList
                                                              .length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return ListTile(
                                                          onTap: () {
                                                            filterSearchController
                                                                    .subCategoryId
                                                                    .value =
                                                                filterSearchController
                                                                    .subCategoyList[
                                                                        index]
                                                                    .id!;
                                                            // filterSearchController
                                                            //     .subCategoryId
                                                            //     .value = filterSearchController
                                                            //             .subCategoryId
                                                            //             .value ==
                                                            //         0
                                                            //     ? subCategories[
                                                            //             index]
                                                            //         .id!
                                                            //     : subCategoryController
                                                            //         .subCategoryList[
                                                            //             index]
                                                            //         .id!;
                                                            filterSearchController
                                                                    .subCategoryName
                                                                    .value =
                                                                // filterSearchController
                                                                //         .subCategoryId
                                                                //         .value ==
                                                                //     0
                                                                // ?
                                                                MyPref.lang ==
                                                                        'uz'
                                                                    ? filterSearchController
                                                                        .subCategoyList[
                                                                            index]
                                                                        .nameUz!
                                                                    : MyPref.lang ==
                                                                            'kr'
                                                                        ? filterSearchController
                                                                            .subCategoyList[
                                                                                index]
                                                                            .nameEn!
                                                                        : filterSearchController
                                                                            .subCategoyList[index]
                                                                            .nameRu!;
                                                            // : (MyPref.lang ==
                                                            //         'uz'
                                                            //     ? subCategoryController
                                                            //         .subCategoryList[
                                                            //             index]
                                                            //         .nameUz!
                                                            //     : MyPref.lang ==
                                                            //             'kr'
                                                            //         ? subCategoryController
                                                            //             .subCategoryList[index]
                                                            //             .nameEn!
                                                            //         : subCategoryController.subCategoryList[index].nameRu!);
                                                            // filterSearchController
                                                            //     .subCategoryName
                                                            //     .value = filterSearchController
                                                            //             .subCategoryId
                                                            //             .value ==
                                                            //         0
                                                            //     ? (MyPref.lang ==
                                                            //             'uz'
                                                            //         ? subCategories[
                                                            //                 index]
                                                            //             .nameUz!
                                                            //         : MyPref.lang ==
                                                            //                 'kr'
                                                            //             ? subCategories[index]
                                                            //                 .nameEn!
                                                            //             : subCategories[index]
                                                            //                 .nameRu!)
                                                            //     : (MyPref.lang ==
                                                            //             'uz'
                                                            //         ? subCategoryController
                                                            //             .subCategoryList[
                                                            //                 index]
                                                            //             .nameUz!
                                                            //         : MyPref.lang ==
                                                            //                 'kr'
                                                            //             ? subCategoryController
                                                            //                 .subCategoryList[index]
                                                            //                 .nameEn!
                                                            //             : subCategoryController.subCategoryList[index].nameRu!);

                                                            // print(
                                                            //     filterSearchController
                                                            //         .subCategoryId
                                                            //         .value);
                                                            // print('this is subcategeoyNameValue' +
                                                            //     filterSearchController
                                                            //         .subCategoryName
                                                            //         .value);
                                                            Get.back();
                                                          },
                                                          title: Text(filterSearchController
                                                                      .subCategoryId
                                                                      .value ==
                                                                  0
                                                              ? (MyPref.lang ==
                                                                      'uz'
                                                                  ? filterSearchController
                                                                      .subCategoyList[
                                                                          index]
                                                                      .nameUz!
                                                                  : MyPref.lang ==
                                                                          'kr'
                                                                      ? filterSearchController
                                                                          .subCategoyList[
                                                                              index]
                                                                          .nameEn!
                                                                      : filterSearchController
                                                                          .subCategoyList[
                                                                              index]
                                                                          .nameRu!)
                                                              : (MyPref.lang ==
                                                                      'uz'
                                                                  ? subCategoryController
                                                                      .subCategoryList[
                                                                          index]
                                                                      .nameUz!
                                                                  : MyPref.lang ==
                                                                          'kr'
                                                                      ? subCategoryController
                                                                          .subCategoryList[
                                                                              index]
                                                                          .nameEn!
                                                                      : subCategoryController
                                                                          .subCategoryList[
                                                                              index]
                                                                          .nameRu!)),
                                                        );
                                                      }),
                                                )));
                                      });
                                    });
                              },
                              child: Container(
                                width: 200,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Text(filterSearchController
                                        .subCategoryName.value.isEmpty
                                    ? '${MyPref.lang == 'ru' ? '??????' : ' '}   ${filterSearchController.mainCategoryName.value}'
                                    : filterSearchController
                                        .subCategoryName.value),
                              ),
                            ),
                          ),
                    SizedBox(height: 15),
                    Text(
                      'location'.tr,
                      style: FontStyles.regularStyle(
                          fontSize: 16, fontFamily: 'Roboto'),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                    builder: (contxet, StateSetter setState) {
                                  return AlertDialog(
                                      content: Container(
                                    height: 300,
                                    width: double.maxFinite,
                                    child: CupertinoScrollbar(
                                      child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              Divider(
                                                thickness: 1.5,
                                              ),
                                          shrinkWrap: true,
                                          itemCount: allRegionsController
                                              .allRegionsList.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              onTap: () {
                                                filterSearchController
                                                        .cityId.value =
                                                    allRegionsController
                                                        .allRegionsList[index]
                                                        .id!;
                                                filterSearchController
                                                        .cityName.value =
                                                    // MyPref
                                                    //         .lang ==
                                                    //     'ru'
                                                    // ? allRegionsController
                                                    //     .allRegionsList[index]
                                                    //     .nameRu!
                                                    // :
                                                    MyPref.lang == 'uz'
                                                        ? allRegionsController
                                                            .allRegionsList[
                                                                index]
                                                            .nameUz!
                                                        : MyPref.lang == 'kr'
                                                            ? allRegionsController
                                                                .allRegionsList[
                                                                    index]
                                                                .nameEn!
                                                            : allRegionsController
                                                                .allRegionsList[
                                                                    index]
                                                                .nameRu!;

                                                setState(() {
                                                  allRegions =
                                                      allRegionsController
                                                          .allRegionsList[index]
                                                          .childs!;
                                                  mainCitySelected = true;
                                                  districtChoice = MyPref
                                                              .lang ==
                                                          'ru'
                                                      ? '?????? '
                                                      : ' ' +
                                                          '${MyPref.lang == 'uz' ? allRegionsController.allRegionsList[index].nameUz! : MyPref.lang == 'kr' ? allRegionsController.allRegionsList[index].nameEn : allRegionsController.allRegionsList[index].nameRu!}';
                                                });
                                                // print(filterSearchController
                                                //     .cityId);
                                                Get.back();
                                              },
                                              title: Text(
                                                  // MyPref.lang == 'ru'
                                                  //   ? allRegionsController
                                                  //       .allRegionsList[index]
                                                  //       .nameRu!
                                                  //   :
                                                  MyPref.lang == 'uz'
                                                      ? allRegionsController
                                                          .allRegionsList[index]
                                                          .nameUz!
                                                      : MyPref.lang == 'kr'
                                                          ? allRegionsController
                                                              .allRegionsList[
                                                                  index]
                                                              .nameEn!
                                                          : allRegionsController
                                                              .allRegionsList[
                                                                  index]
                                                              .nameRu!),
                                            );
                                          }),
                                    ),
                                  ));
                                });
                              });
                        },
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Text(
                              filterSearchController.cityName.value.isEmpty
                                  ? cityChoice
                                  : filterSearchController.cityName.value),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    if (mainCitySelected)
                      Text(
                        'region'.tr,
                        style: FontStyles.regularStyle(
                            fontSize: 16, fontFamily: 'Roboto'),
                      ),
                    if (mainCitySelected) SizedBox(height: 12),
                    mainCitySelected
                        ? Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return StatefulBuilder(builder:
                                          (context, StateSetter setState) {
                                        return AlertDialog(
                                            content: Container(
                                                height: 300,
                                                width: double.maxFinite,
                                                child: CupertinoScrollbar(
                                                  child: ListView.separated(
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              Divider(
                                                                thickness: 1.5,
                                                              ),
                                                      shrinkWrap: true,
                                                      itemCount:
                                                          allRegions.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return ListTile(
                                                          onTap: () {
                                                            filterSearchController
                                                                    .districtName
                                                                    .value =
                                                                // MyPref
                                                                //         .lang ==
                                                                //     'ru'
                                                                // ?
                                                                // allRegions[
                                                                //         index]
                                                                //     .nameRu!
                                                                // :
                                                                MyPref.lang ==
                                                                        'uz'
                                                                    ? allRegions[
                                                                            index]
                                                                        .nameUz!
                                                                    : MyPref.lang ==
                                                                            'kr'
                                                                        ? allRegions[index]
                                                                            .nameEn!
                                                                        : allRegions[index]
                                                                            .nameRu!;
                                                            filterSearchController
                                                                    .cityId
                                                                    .value =
                                                                allRegions[
                                                                        index]
                                                                    .id!;

                                                            Get.back();
                                                          },
                                                          title: Text(
                                                              // MyPref?
                                                              //         .lang ==
                                                              //     'ru'
                                                              // ? allRegions[index]
                                                              //     .nameRu!
                                                              // :
                                                              MyPref.lang ==
                                                                      'uz'
                                                                  ? allRegions[
                                                                          index]
                                                                      .nameUz!
                                                                  : MyPref.lang ==
                                                                          'kr'
                                                                      ? allRegions[
                                                                              index]
                                                                          .nameEn!
                                                                      : allRegions[
                                                                              index]
                                                                          .nameRu!),
                                                        );
                                                      }),
                                                )));
                                      });
                                    });
                              },
                              child: Container(
                                width: 200,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: Text(filterSearchController
                                        .districtName.value.isEmpty
                                    ? districtChoice
                                    : filterSearchController
                                        .districtName.value),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: () {
                        // print('ss');
                        setState(() {
                          isPriceSelected = !isPriceSelected;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: isPriceSelected == true
                                ? ColorPalate.mainColor
                                : Colors.white,
                            borderRadius: new BorderRadius.circular(
                              10.0,
                            ),
                            border: Border.all(
                              color: isPriceSelected == true
                                  ? ColorPalate.mainColor
                                  : ColorPalate.mainColor,
                              width: 2,
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'price'.tr,
                              style: TextStyle(
                                fontSize: 16,
                                color: isPriceSelected == true
                                    ? Colors.white
                                    : ColorPalate.mainColor,
                              ),
                            ),
                            if (!isPriceSelected)
                              RotatedBox(
                                quarterTurns: 1,
                                child: SvgPicture.asset(
                                  'assets/icons/next-icon.svg',
                                  height: 13,
                                  color: ColorPalate.mainColor,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    isPriceSelected == true
                        ? Text(
                            'price'.tr,
                            style: FontStyles.regularStyle(
                                fontSize: 16, fontFamily: 'Roboto'),
                          )
                        : Container(),
                    SizedBox(height: 12),
                    isPriceSelected == true
                        ? Row(
                            children: [
                              Container(
                                height: 50,
                                width: 120,
                                padding: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  controller: minPriceController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'from'.tr),
                                ),
                              ),
                              SizedBox(width: 25),
                              Container(
                                height: 50,
                                width: 120,
                                padding: const EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                child: TextFormField(
                                  controller: maxPriceController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'to'.tr),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    isPriceSelected == true
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 1,
                                groupValue: val,
                                onChanged: (a) {
                                  setState(() {
                                    val = 1;
                                  });
                                  filterSearchController.currencySort.value =
                                      '';
                                },
                                activeColor: Colors.black,
                              ),
                              Text(
                                'UZS',
                              ),
                              Radio(
                                value: 2,
                                groupValue: val,
                                onChanged: (a) {
                                  setState(() {
                                    val = 2;
                                  });
                                  filterSearchController.currencySort.value =
                                      'usd';
                                },
                                activeColor: Colors.black,
                              ),
                              Text(
                                'USD',
                              ),
                            ],
                          )
                        : Container(),
                    SizedBox(height: 80),
                    CutomeButton(
                        title: 'showResults',
                        onpress: () {
                          filterSearchController.price_start.value =
                              minPriceController.text;
                          filterSearchController.price_finish.value =
                              maxPriceController.text;
                          Get.back();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchResult(
                                        currencySort: filterSearchController
                                                    .currencySort.value ==
                                                ''
                                            ? ''
                                            : filterSearchController
                                                .currencySort.value,
                                        catId: filterSearchController
                                                    .subCategoryId.value ==
                                                0
                                            ? filterSearchController
                                                .mainCategoryId.value
                                                .toString()
                                            : filterSearchController
                                                .subCategoryId.value
                                                .toString(),
                                        cityId: filterSearchController
                                                    .cityId.value ==
                                                0
                                            ? ""
                                            : filterSearchController
                                                .cityId.value
                                                .toString(),
                                        priceSort: sortingType.isEmpty
                                            ? ""
                                            : sortingType,
                                        priceStart: minPriceController.text,
                                        priceFinish: maxPriceController.text,
                                      )));
                        },
                        buttonColor: ColorPalate.mainColor,
                        textColor: Colors.white)
                  ],
                );
              }
            })),
      ),
    );
  }
}
