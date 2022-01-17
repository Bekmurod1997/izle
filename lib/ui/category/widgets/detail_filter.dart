import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/controller/fitler_detal_controller.dart';
import 'package:izle/models/all_regions_model.dart';
import 'package:izle/models/categories/main_categories_model.dart';
import 'package:izle/ui/category/result_ads.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/utils/my_prefs.dart';

class DetailFilterScreen extends StatefulWidget {
  final List<DataCategory> subCategories;
  final String catName;
  final List<DataRegions> allregions;
  DetailFilterScreen(
      {required this.subCategories,
      required this.catName,
      required this.allregions});

  @override
  _DetailFilterScreenState createState() => _DetailFilterScreenState();
}

class _DetailFilterScreenState extends State<DetailFilterScreen> {
  final FilterDetalController filterDetalController =
      Get.find<FilterDetalController>();
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  int selectedIndex = 0;
  int priceFitlerIndex = 0;
  int val = -1;
  int? subcategoryyyyyyId;
  List<DataCategory> subCats = [];
  List<DataRegions> allRegions = [];
  bool isPriceSelected = false;

  @override
  void initState() {
    subCats = widget.subCategories;
    allRegions = widget.allregions;
    print(subCats.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('=----');
    print(filterDetalController.subCategoryName.value);
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
            print('++++++++++');
            print(filterDetalController.subCategoryName.value);

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
                          filterDetalController.changeSortingType(
                              sortingTypee: 'min');
                          print(filterDetalController.sortingType.value);
                        });
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
                          filterDetalController.changeSortingType(
                              sortingTypee: 'max');
                          print(filterDetalController.sortingType.value);
                        });
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
                          filterDetalController.changeSortingType(
                              sortingTypee: '');
                          print(filterDetalController.sortingType.value);
                        });
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
                SizedBox(height: 20),
                Text(
                  'categoryy'.tr,
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
                            return AlertDialog(
                                content: Container(
                              height: 300,
                              width: double.maxFinite,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: subCats.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      onTap: () {
                                        filterDetalController
                                            .changerSubCategoryId(
                                                subcategoryIdd:
                                                    subCats[index].id!);
                                        filterDetalController
                                            .changerSubCategoryName(
                                                subCategoryNamee: MyPref.lang ==
                                                        'uz'
                                                    ? subCats[index].nameUz!
                                                    : MyPref.lang == 'kr'
                                                        ? subCats[index].nameEn!
                                                        : subCats[index]
                                                            .nameRu!);
                                        print(filterDetalController
                                            .subCategoryId.value);
                                        Get.back();
                                      },
                                      title: Text(MyPref.lang == 'uz'
                                          ? subCats[index].nameUz!
                                          : MyPref.lang == 'kr'
                                              ? subCats[index].nameEn!
                                              : subCats[index].nameRu!),
                                    );
                                  }),
                            ));
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
                      child: Row(
                        children: [
                          Text(filterDetalController.mainCategoryName.value),
                          Text(filterDetalController
                                  .subCategoryName.value.isEmpty
                              ? ''
                              : '/ ${filterDetalController.subCategoryName.value}'),
                        ],
                      ),
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
                            return AlertDialog(
                                content: Container(
                              height: 300,
                              width: double.maxFinite,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: allRegions.length,
                                  itemBuilder: (context, index) {
                                    List<Childs> regions =
                                        allRegions[index].childs!;
                                    return ListTile(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                  content: Container(
                                                height: 300,
                                                width: double.maxFinite,
                                                child: ListView.builder(
                                                    shrinkWrap: true,
                                                    itemCount: regions.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ListTile(
                                                        onTap: () {
                                                          filterDetalController
                                                              .districtName
                                                              .value = MyPref
                                                                      .lang ==
                                                                  'kr'
                                                              ? regions[index]
                                                                  .nameEn!
                                                              : MyPref.lang ==
                                                                      'uz'
                                                                  ? regions[
                                                                          index]
                                                                      .nameUz!
                                                                  : regions[
                                                                          index]
                                                                      .nameRu!;
                                                          filterDetalController
                                                                  .cityId
                                                                  .value =
                                                              regions[index]
                                                                  .id!;
                                                          // filterDetalController.changerCityId(
                                                          //   cityIdd: allRegions[index].id ?? 10,
                                                          // );
                                                          // filterDetalController.changerCityName(
                                                          //     cityNamee:
                                                          //         allRegions[index].nameRu!);
                                                          // print(
                                                          //     filterDetalController.cityId.value);
                                                          Get.back();
                                                          Get.back();
                                                        },
                                                        title: Text(MyPref
                                                                    .lang ==
                                                                'kr'
                                                            ? regions[index]
                                                                .nameEn!
                                                            : MyPref.lang ==
                                                                    'uz'
                                                                ? regions[index]
                                                                    .nameUz!
                                                                : regions[index]
                                                                    .nameRu!),
                                                      );
                                                    }),
                                              ));
                                            });

                                        filterDetalController.changerCityId(
                                          cityIdd: allRegions[index].id ?? 10,
                                        );
                                        filterDetalController.changerCityName(
                                            cityNamee: MyPref.lang == 'kr'
                                                ? allRegions[index].nameEn!
                                                : MyPref.lang == 'uz'
                                                    ? allRegions[index].nameUz!
                                                    : allRegions[index]
                                                        .nameRu!);
                                        print(
                                            filterDetalController.cityId.value);
                                        // Get.back();
                                      },
                                      title: Text(MyPref.lang == 'kr'
                                          ? allRegions[index].nameEn!
                                          : MyPref.lang == 'uz'
                                              ? allRegions[index].nameUz!
                                              : allRegions[index].nameRu!),
                                    );
                                  }),
                            ));
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
                      child: Row(
                        children: [
                          Text(filterDetalController.cityName.value.isEmpty
                              ? 'city'.tr
                              : filterDetalController.cityName.value),
                          Text(filterDetalController.districtName.value.isEmpty
                              ? ''
                              : '/ ${filterDetalController.districtName.value} ')
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    print('ss');
                    setState(() {
                      isPriceSelected = !isPriceSelected;
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.only(top: 10, bottom: 10, left: 10),
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
                              : Colors.white,
                          width: 2,
                        )),
                    child: Text(
                      'price'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        color: isPriceSelected == true
                            ? Colors.white
                            : Colors.black,
                      ),
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
                                  border: InputBorder.none, hintText: 'to'.tr),
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
                                filterDetalController.currencySort.value = '';
                              });
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
                                filterDetalController.currencySort.value =
                                    'usd';
                              });
                              print(filterDetalController.currencySort.value);
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
                    title: 'showResults'.tr,
                    onpress: () {
                      print('checkingggg');
                      print(filterDetalController.subCategoryId.value);
                      filterDetalController.price_start.value =
                          minPriceController.text;
                      filterDetalController.price_finish.value =
                          maxPriceController.text;
                      // filterDetalController.resetAll();
                      Get.back();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ResultAds(
                                  currencySort: filterDetalController
                                              .currencySort.value ==
                                          ''
                                      ? ""
                                      : filterDetalController
                                          .currencySort.value,
                                  catId: filterDetalController
                                              .subCategoryId.value ==
                                          0
                                      ? filterDetalController
                                          .mainCategoryId.value
                                      : filterDetalController
                                          .subCategoryId.value,
                                  catName: filterDetalController
                                      .subCategoryName.value,
                                  mainCategoryId:
                                      filterDetalController.subCategoryId.value,
                                  cityId:
                                      filterDetalController.cityId.value == 0
                                          ? ""
                                          : filterDetalController.cityId.value
                                              .toString(),
                                  priceSort:
                                      filterDetalController.sortingType == ''
                                          ? ""
                                          : filterDetalController
                                              .sortingType.value,
                                  priceStart:
                                      filterDetalController.price_start.value,
                                  priceFinish:
                                      filterDetalController.price_finish.value,
                                  cityName:
                                      filterDetalController.cityName.value,
                                )),
                      );

                      print('pressed');
                    },
                    buttonColor: ColorPalate.mainColor,
                    textColor: Colors.white)
              ],
            );
          }),
        ),
      ),
    );
  }
}
