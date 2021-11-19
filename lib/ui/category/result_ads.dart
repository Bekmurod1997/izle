import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';

import 'package:izle/controller/adrvertisement_subCategory_controller.dart';
import 'package:izle/controller/all_cities_controller.dart';
import 'package:izle/controller/for_cat_controller.dart';
import 'package:izle/controller/sub_category_controller.dart';
import 'package:izle/models/city_model.dart';
import 'package:izle/ui/category/widgets/black_sapce.dart';
import 'package:izle/ui/category/widgets/city_choice.dart';
import 'package:izle/ui/category/widgets/product_item.dart';
import 'package:izle/ui/home/home_screen.dart';

import 'package:izle/ui/product_detail/product_detail_screen.dart';
import 'package:izle/models/categories/main_categories_model.dart';

//type

var TYPE1 = {
  "id": 854,
  "name_ru": "Кормление",
  "name_uz": "Oziqlantirish",
  "name_en": "Feeding",
  "description_ru": "",
  "description_uz": "",
  "description_en": "",
  "photo_id": null,
  "photo": "/assets_files/no-image.jpg",
  "main": 0,
};

class CategoryOption {
  final int id;
  final String name;
  CategoryOption({required this.id, required this.name});
}

class ResultAds extends StatefulWidget {
  final int catId;
  final String catName;
  final String imgUrl;
  ResultAds({required this.catId, required this.catName, required this.imgUrl});

  @override
  _ResultAdsState createState() => _ResultAdsState();
}

class _ResultAdsState extends State<ResultAds> {

  final AdvertismentSubCategoryController advertismentSubCategoryController =
      Get.find<AdvertismentSubCategoryController>();
  ScrollController _scrollController = ScrollController();
  final SubCategoryController subCategoryController =
      Get.find<SubCategoryController>();
  final ForSubCategoryController forSubCategoryController =
      Get.find<ForSubCategoryController>();
  final AllCityController allCityController = Get.put(AllCityController());

  bool cityPressed = false;
  bool categoryPressed = false;
  bool isFilter = false;
  bool forCityFilter = false;
  String dropdownvalue = 'Все';
  String dropdownvalue2 = 'Hammasi';

  List<DataCategory> subCatList = [];
  List<DataCity> cityList = [];

  List<String?> subCatStringList = [];
  List<String?> cityStringList = [];

  int currentIndex = 0;
  String firstValue = '-1';
  var dropDown = [
    'AllCity',
    'city',
    'city2',
    'city3',
    'city4',
  ];
  @override
  void initState() {
    print('this is intistate in results');
    setState(() {
      currentIndex = widget.catId;
      dropdownvalue = widget.catName;
    });
    advertismentSubCategoryController.fetchAdsSubCat(
        catId: widget.catId.toString());
    subCategoryController.fetchSubCategries(widget.catId);
    print(widget.catId);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        advertismentSubCategoryController.loadMore(
            catId: widget.catId.toString());
        print(
          advertismentSubCategoryController.adsSubList.length,
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        body: Obx(() {
          if (advertismentSubCategoryController.isLoading.value &&
              !advertismentSubCategoryController.isLoadMore.value &&
              subCategoryController.isLoading.value &&
              allCityController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPalate.mainColor,
              ),
            );
          } else {
            subCatList = subCategoryController.subCategoryList;
            subCatList = [
              new DataCategory(
                  id: forSubCategoryController.mainCatId.value, nameRu: widget.catName ),
              ...subCatList
            ];
            subCatStringList = subCatList.map((e) => e.nameRu).toList();

            cityStringList = cityList.map((e) => e.nameRu).toList();
            return ListView(
              controller: _scrollController,
              children: [
                // Container(
                //   width: 50,
                //   margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                //   color: Colors.white,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Container(
                //         width: MediaQuery.of(context).size.width * 0.75,
                //         margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                //         decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(10)),
                //         child: TextField(
                //           decoration: InputDecoration(
                //             prefixIcon: IconButton(
                //               onPressed: () {},
                //               icon: Icon(Icons.search),
                //             ),
                //             border: InputBorder.none,
                //             hintText: 'Что вы ищете?',
                //           ),
                //         ),
                //       ),
                //       RotatedBox(
                //         quarterTurns: 1,
                //         child: GestureDetector(
                //           onTap: () {
                //             setState(() {
                //               isFilter = !isFilter;
                //             });
                //           },
                //           child: Container(
                //             width: MediaQuery.of(context).size.width * 0.1,
                //             padding: const EdgeInsets.symmetric(
                //                 vertical: 13, horizontal: 11),
                //             decoration: BoxDecoration(
                //               color: Colors.white,
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //             child: SvgPicture.asset(
                //               'assets/icons/f.svg',
                //               color: ColorPalate.mainColor,
                //               height: 22,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),

                //mana ochirdim
              SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      height: 45,
                      padding: EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => BlackSpaceSCreen());
                        },
                        child: Container(
                          height: 45,
                          child: RotatedBox(
                            quarterTurns: 1,
                            child: Container(
                              // width: MediaQuery.of(context).size.width * 0.1,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/f.svg',
                                color: ColorPalate.mainColor,
                                height: 28,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: ()=>Get.to(()=>CityChoice(
                              id:widget.catId
                          )),
                          child: Container(
                            // width: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            height: 50,
                            color:Colors.white,
                            child: Center(child: Text('Все города')),
                          ),
                        ),
                        // Container(
                        //   // margin: const EdgeInsets.only(left: 20),
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(10),
                        //
                        //   ),
                        //
                        //   padding: const EdgeInsets.symmetric(horizontal: 10),
                        //   width: MediaQuery.of(context).size.width * 0.3,
                        //   child: DropdownButtonHideUnderline(
                        //     child: DropdownButton(
                        //       isExpanded: true,
                        //       value: firstValue,
                        //       // icon: Icon(Icons.keyboard_arrow_down),
                        //       icon: Visibility(
                        //           visible: false,
                        //           child: Icon(Icons.arrow_downward)),
                        //       items: [
                        //         new DataCity(id: -1, nameRu: "Все города"),
                        //         ...allCityController.cityList
                        //       ]
                        //           .map((e) => DropdownMenuItem(
                        //               value: e.id.toString(),
                        //               child: Text(
                        //                 e.nameRu.toString(),
                        //                 style: TextStyle(fontSize: 12),
                        //                 overflow: TextOverflow.ellipsis,
                        //               )))
                        //           .toList(),
                        //       onChanged: (String? value) {
                        //         setState(() {
                        //           firstValue = value.toString();
                        //           firstValue == '-1'
                        //               ? advertismentSubCategoryController
                        //                   .fetchAdsSubCat(
                        //                       catId: forSubCategoryController
                        //                           .mainCatId.value
                        //                           .toString())
                        //               : advertismentSubCategoryController
                        //                   .fetchAdsSubCatWithCityId(
                        //                       catId: forSubCategoryController
                        //                           .mainCatId.value
                        //                           .toString(),
                        //                       cityId: int.parse(firstValue));
                        //         });
                        //       },
                        //     ),
                        //   ),
                        // ),
                        if (firstValue != '-1')
                          Positioned(
                              right: 5,
                              top: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    firstValue = '-1';
                                  });
                                  advertismentSubCategoryController
                                      .fetchAdsSubCat(
                                          catId: widget.catId.toString());
                                },
                                child: Container(

                                    width: 20,
                                    height: 20,
                                    child: GestureDetector(
                                      child: Icon(
                                        Icons.cancel,
                                      ),
                                    )),
                              ))
                      ],
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: ()=>Get.to(()=>CityChoice(
                        id:widget.catId
                      )),
                      child: Container(
                        // width: 50,
                        height: 50,
                        color:Colors.white,
                        child: Center(child: Text(widget.catName)),
                      ),
                    ),
                    // Stack(
                    //   children: [
                    //     Container(
                    //          width: MediaQuery.of(context).size.width * 0.3,
                    //         padding: const EdgeInsets.symmetric(horizontal: 10),
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(10),
                    //
                    //         ),
                    //         child: Center(
                    //           child: DropdownButtonHideUnderline(
                    //             child: DropdownButton(
                    //               isExpanded: true,
                    //               value: dropdownvalue,
                    //               // icon: Icon(Icons.keyboard_arrow_down),
                    //               icon: Visibility(
                    //                   visible: false,
                    //                   child: Icon(Icons.arrow_downward)),
                    //               items: subCatStringList
                    //                   .map((e) => DropdownMenuItem(
                    //                       value: e,
                    //                       child: Text(
                    //                         e.toString(),
                    //                         style: TextStyle(fontSize: 12),
                    //                         overflow: TextOverflow.ellipsis,
                    //                       )))
                    //                   .toList(),
                    //               onChanged: (value) {
                    //                 setState(() {
                    //                   dropdownvalue = value.toString();
                    //                 });
                    //                 print(subCatList
                    //                     .firstWhere((element) =>
                    //                         element.nameRu == value)
                    //                     .id);
                    //                 dynamic iii = -1;
                    //                 iii = subCatList
                    //                     .firstWhere(
                    //                         (element) =>
                    //                             element.nameRu == value,
                    //                         orElse: () => new DataCategory(
                    //                             id: forSubCategoryController
                    //                                 .mainCatId.value))
                    //                     .id!;
                    //                 print({iii});
                    //                 if (iii ==
                    //                     forSubCategoryController
                    //                         .mainCatId.value) {
                    //                   advertismentSubCategoryController
                    //                       .fetchAdsSubCat(
                    //                           catId: forSubCategoryController
                    //                               .mainCatId.value
                    //                               .toString());
                    //                 } else {
                    //                   advertismentSubCategoryController
                    //                       .fetchAdsSubCat(
                    //                           catId: iii.toString());
                    //                 }
                    //               },
                    //             ),
                    //           ),
                    //         ),
                    //         alignment: Alignment.center),
                    //     if (dropdownvalue != widget.catName && categoryPressed == false)
                    //       Positioned(
                    //           right: 5,
                    //           top: 10,
                    //           child: Container(
                    //               width: 20,
                    //               height: 20,
                    //               child: GestureDetector(
                    //                 onTap: () {
                    //                   setState(() {
                    //                     categoryPressed = true;
                    //                   });
                    //                   advertismentSubCategoryController
                    //                       .fetchAdsSubCat(
                    //                           catId: forSubCategoryController
                    //                               .mainCatId.value
                    //                               .toString());
                    //                 },
                    //                 child: Icon(
                    //                   Icons.cancel,
                    //                 ),
                    //               )))
                    //   ],
                    // ),
                    //
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        advertismentSubCategoryController.adsSubList.length,
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 15,
                      height: MediaQuery.of(context).size.height * 0.33,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.to(() => ProductDetailScreen(
                              proId: advertismentSubCategoryController
                                  .adsSubList[index].id,
                            )),
                        child: ProductItem(
                            cityName: advertismentSubCategoryController
                                    .adsSubList[index].cityName ??
                                '',
                            date: advertismentSubCategoryController
                                    .adsSubList[index].date ??
                                '',
                            imageUrl: advertismentSubCategoryController
                                    .adsSubList[index].photo ??
                                '',
                            price: advertismentSubCategoryController
                                .adsSubList[index].price
                                .toString(),
                            title: advertismentSubCategoryController
                                    .adsSubList[index].title ??
                                '',
                            id: advertismentSubCategoryController
                                .adsSubList[index].id!,
                            isFavorite: false),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        }));
  }
}
