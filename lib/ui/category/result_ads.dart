import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/adrvertisement_subCategory_controller.dart';
import 'package:izle/controller/all_cities_controller.dart';
import 'package:izle/controller/all_regions_controller.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/controller/filter_second_controller.dart';
import 'package:izle/controller/fitler_detal_controller.dart';
import 'package:izle/controller/for_cat_controller.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/controller/sub_category_controller.dart';
import 'package:izle/models/city_model.dart';
import 'package:izle/ui/auth/auth_screen.dart';
import 'package:izle/ui/category/all_category_screen.dart';
import 'package:izle/ui/category/sub_categories.dart';
import 'package:izle/ui/category/widgets/city_choice.dart';
import 'package:izle/ui/category/widgets/detail_filter.dart';
import 'package:izle/ui/category/widgets/product_item.dart';
import 'package:izle/ui/components/my_bottom_nav.dart';
import 'package:izle/ui/home/home_screen.dart';
import 'package:izle/ui/message/message_screen.dart';
import 'package:izle/ui/message/unauth_message.dart';
import 'package:izle/ui/product_detail/product_detail_screen.dart';
import 'package:izle/models/categories/main_categories_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:izle/ui/profile/active_profile.dart';
import 'package:izle/ui/profile/profile_screen.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/create_add.dart';
import 'package:izle/utils/my_prefs.dart';

import '../nav.dart';

//type

class ResultAds extends StatefulWidget {
  final String? search;
  final int mainCategoryId;
  final int catId;
  final String catName;
  final String? imgUrl;
  final String? cityId;
  final String? cityName;
  final String? priceSort;
  final String? priceStart;
  final String? priceFinish;
  final String? currencySort;

  ResultAds({
    required this.catId,
    this.cityId,
    this.search,
    required this.catName,
    required this.mainCategoryId,
    this.imgUrl,
    this.cityName,
    this.priceStart,
    this.priceFinish,
    this.priceSort,
    this.currencySort,
  });

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
  final AllRegionsController allRegionsController =
      Get.find<AllRegionsController>();
  final FilterDetalController filterDetalController =
      Get.find<FilterDetalController>();

  final FilterSecondController filterSecondController =
      Get.put(FilterSecondController());
  final formatCurrency = NumberFormat.decimalPattern();

  TextEditingController searchText = TextEditingController();
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

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      searchText.text = filterDetalController.searchWord.value;
      print('-------');
      print(filterDetalController.searchWord.value);
      advertismentSubCategoryController.currentPageChanger(curretP: 1);
      allRegionsController.fetchAllRegions();
      print('id of maincategory');
      print(widget.mainCategoryId);
      print('id of category');
      print(widget.catId);
      print('this is intistate in results');
      initializeDateFormatting();
      Intl.defaultLocale = 'ru_RU';

      print('currency sort');
      print(widget.currencySort);
      print(widget.cityId);
      advertismentSubCategoryController.fetchAdsSubCat(
          searchWord: filterDetalController.searchWord.value.isEmpty
              ? ""
              : filterDetalController.searchWord.value,
          catId: widget.catId.toString(),
          cityId: widget.cityId,
          priceStart: widget.priceStart,
          priceFinish: widget.priceFinish,
          priceSort: widget.priceSort,
          currenySort: widget.currencySort);
      advertismentSubCategoryController.fetchAdsSubCatTop(
          searchWord: filterDetalController.searchWord.value.isEmpty
              ? ""
              : filterDetalController.searchWord.value,
          catId: widget.catId.toString(),
          cityId: widget.cityId,
          priceStart: widget.priceStart,
          priceFinish: widget.priceFinish,
          priceSort: widget.priceSort,
          currenySort: widget.currencySort);
      advertismentSubCategoryController.fetchAdsSubCatPremium(
          searchWord: filterDetalController.searchWord.value.isEmpty
              ? ""
              : filterDetalController.searchWord.value,
          catId: widget.catId.toString(),
          cityId: widget.cityId,
          priceStart: widget.priceStart,
          priceFinish: widget.priceFinish,
          priceSort: widget.priceSort,
          currenySort: widget.currencySort);
      subCategoryController
          .fetchSubCategries(filterDetalController.mainCategoryId.value);
    });
    print('it should be length');
    print(
      advertismentSubCategoryController.adsSubList.length,
    );

    print('this is main category id');
    print(filterDetalController.mainCategoryId.value);

    setState(() {
      currentIndex = widget.catId;
      dropdownvalue = widget.catName;
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        advertismentSubCategoryController.loadMore(
            cityId: widget.cityId,
            currenySort: widget.currencySort,
            priceFinish: widget.priceFinish,
            priceSort: widget.priceSort,
            priceStart: widget.priceStart,
            searchWord: filterDetalController.searchWord.value.isEmpty
                ? ""
                : filterDetalController.searchWord.value,
            catId: widget.catId.toString());
        print(
          advertismentSubCategoryController.adsSubList.length,
        );
      }
    });

    super.initState();
  }

  // @override
  // void dispose() {
  //   print('this issssssssdfsdfsdfsdfsdfsdf');
  //   super.dispose();
  // }
  int _selectedIndex = 0; //New

  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();
  void _onItemTapped(int index) {
    pageNavigationController.pageControler.value = index;
    setState(() {
      _selectedIndex = index;
    });
    pageNavigationController.tabIndex.value = index;
  }

  Widget _buildIcon(
    String iconUrl,
    String text,
    int index, [
    Color iconColor = Colors.white,
  ]) =>
      Container(
        // height: 45,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          // color: index == 0 ? _getBgColor(index) : ColorPalate.mainColor,
          child: InkWell(
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Icon(iconData),
                    SvgPicture.asset(
                      iconUrl,
                      color: iconColor,
                      fit: BoxFit.contain,
                      height: 25,
                    ),
                    SizedBox(height: 3),
                    Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: pageNavigationController.tabIndex.value == index
                            ? ColorPalate.mainColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                _onItemTapped(index);
                if (index == 0) {
                  Get.offAll(() => NavScreen());
                  pageNavigationController.pageControllerChanger(0);
                  creatingAddInfoController.resetAll();
                } else if (index == 1) {
                  Get.offAll(() => NavScreen());
                  // Get.offAll(() => AllCategoryScreen());
                  pageNavigationController.pageControllerChanger(1);
                  creatingAddInfoController.resetAll();
                } else if (index == 2) {
                  Get.offAll(() => NavScreen()
                      // MyPref.token == '' ? AuthScreen() : CreatingAddScreen(),
                      );
                  pageNavigationController.pageControllerChanger(2);
                } else if (index == 3) {
                  Get.offAll(() => NavScreen()
                      // MyPref.token == ''
                      // ? UnAuthMessageScreen()
                      // : MessageScreen(''),
                      );
                  pageNavigationController.pageControllerChanger(3);
                  creatingAddInfoController.resetAll();
                } else if (index == 4) {
                  Get.offAll(() => NavScreen()
                      // MyPref.token == ''
                      //     ? ProfileScreen()
                      //     : ActiveProfileScreen(),
                      );
                  pageNavigationController.pageControllerChanger(4);
                }
              }),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        filterDetalController.resetAll();
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        body: Obx(() {
          if (advertismentSubCategoryController.isLoading.value &&
              advertismentSubCategoryController.isLoadingTop.value &&
              advertismentSubCategoryController.isLoadingPremium.value &&
              !advertismentSubCategoryController.isLoadMore.value &&
              !advertismentSubCategoryController.isLoadMoreTop.value &&
              !advertismentSubCategoryController.isLoadMorePremium.value &&
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
                  id: forSubCategoryController.mainCatId.value,
                  nameRu: widget.catName),
              ...subCatList
            ];
            subCatStringList = subCatList.map((e) => e.nameRu).toList();

            cityStringList = cityList.map((e) => e.nameRu).toList();
            return ListView(
              controller: _scrollController,
              children: [
                // IconButton(
                //     onPressed: () => Get.back(),
                //     icon: Icon(Icons.arrow_back)),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.fromLTRB(5, 20, 5, 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    textInputAction: TextInputAction.go,
                    onSubmitted: (value) {
                      filterDetalController.changerSearchWord(
                          searchW: searchText.text);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ResultAds(
                              search: filterDetalController.searchWord.value,
                              catId: filterDetalController
                                          .subCategoryId.value ==
                                      0
                                  ? filterDetalController.mainCategoryId.value
                                  : filterDetalController.subCategoryId.value,
                              cityId: filterDetalController.cityId == 0
                                  ? ""
                                  : filterDetalController.cityId.value
                                      .toString(),
                              catName:
                                  filterDetalController.mainCategoryName.value,
                              mainCategoryId:
                                  filterDetalController.mainCategoryId.value,
                              priceFinish:
                                  filterDetalController.price_finish.value == 0
                                      ? ""
                                      : filterDetalController.price_finish.value
                                          .toString(),
                              priceStart:
                                  filterDetalController.price_start.value == 0
                                      ? ""
                                      : filterDetalController.price_start.value
                                          .toString(),
                              priceSort: filterDetalController
                                      .sortingType.value.isEmpty
                                  ? ""
                                  : filterDetalController.sortingType.value,
                            ),
                          ));
                    },
                    controller: searchText,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.arrow_back)),
                      suffixIcon: GestureDetector(
                          onTap: () {
                            filterDetalController.changerSearchWord(
                                searchW: searchText.text);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ResultAds(
                                          search: filterDetalController
                                              .searchWord.value,
                                          catId: filterDetalController
                                                      .subCategoryId.value ==
                                                  0
                                              ? filterDetalController
                                                  .mainCategoryId.value
                                              : filterDetalController
                                                  .subCategoryId.value,
                                          cityId:
                                              filterDetalController.cityId == 0
                                                  ? ""
                                                  : filterDetalController
                                                      .cityId.value
                                                      .toString(),
                                          catName: filterDetalController
                                              .mainCategoryName.value,
                                          mainCategoryId: filterDetalController
                                              .mainCategoryId.value,
                                          priceFinish: filterDetalController
                                                      .price_finish.value ==
                                                  0
                                              ? ""
                                              : filterDetalController
                                                  .price_finish.value
                                                  .toString(),
                                          priceStart: filterDetalController
                                                      .price_start.value ==
                                                  0
                                              ? ""
                                              : filterDetalController
                                                  .price_start.value
                                                  .toString(),
                                          priceSort: filterDetalController
                                                  .sortingType.value.isEmpty
                                              ? ""
                                              : filterDetalController
                                                  .sortingType.value,
                                        )));
                          },
                          child: Icon(
                            Icons.search,
                            size: 25,
                          )),
                      border: InputBorder.none,
                      hintText: 'Что вы ищете?',
                      hintStyle: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                        color: Color(0xff7E8389),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => DetailFilterScreen(
                                  subCategories:
                                      subCategoryController.subCategoryList,
                                  catName: widget.catName,
                                  allregions:
                                      allRegionsController.allRegionsList,
                                ));
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Фильтры',
                                ),
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: Container(
                                    height: 30,
                                    // width: MediaQuery.of(context).size.width * 0.1,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 5),

                                    child: SvgPicture.asset(
                                      'assets/icons/f.svg',
                                      color: ColorPalate.mainColor,
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3),
                      Container(
                        // width: 50,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          // color: Colors.white,
                        ),

                        child: Row(
                          // overflow: Overflow.visible,
                          children: [
                            GestureDetector(
                              onTap: () => Get.to(() => CityChoice(
                                    mainCategoryId: widget.catId,
                                    mainCategoryName: widget.catName,
                                  )),
                              child: Container(
                                margin: const EdgeInsets.only(right: 5),
                                // color: Colors.red,
                                child: Center(
                                    child: Row(
                                  children: [
                                    Text(filterDetalController.cityName.value ==
                                            ''
                                        ? 'Все города'
                                        : filterDetalController.cityName.value
                                            .toString()),
                                    Text(filterDetalController
                                            .districtName.value.isEmpty
                                        ? ''
                                        : '/ ${filterDetalController.districtName.value}'),
                                  ],
                                )),
                              ),
                            ),
                            filterDetalController.cityName.value.isEmpty ||
                                    filterDetalController.districtName.isEmpty
                                ? Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: RotatedBox(
                                      quarterTurns: 1,
                                      child: SvgPicture.asset(
                                        'assets/icons/next-icon.svg',
                                        height: 16,
                                      ),
                                    ),
                                  )
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 0),
                                    // color: Colors.yellow,
                                    child: GestureDetector(
                                      onTap: () {
                                        filterDetalController.cityId.value = 0;
                                        filterDetalController.cityName.value =
                                            '';
                                        filterDetalController
                                            .districtName.value = '';
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        ResultAds(
                                                          search:
                                                              filterDetalController
                                                                  .searchWord
                                                                  .value,
                                                          catId: filterDetalController
                                                                      .subCategoryId
                                                                      .value ==
                                                                  0
                                                              ? filterDetalController
                                                                  .mainCategoryId
                                                                  .value
                                                              : filterDetalController
                                                                  .subCategoryId
                                                                  .value,
                                                          cityId: "0",
                                                          catName:
                                                              filterDetalController
                                                                  .mainCategoryName
                                                                  .value,
                                                          mainCategoryId:
                                                              filterDetalController
                                                                  .mainCategoryId
                                                                  .value,
                                                          priceFinish: filterDetalController
                                                                      .price_finish
                                                                      .value ==
                                                                  0
                                                              ? ""
                                                              : filterDetalController
                                                                  .price_finish
                                                                  .value
                                                                  .toString(),
                                                          priceStart: filterDetalController
                                                                      .price_start
                                                                      .value ==
                                                                  0
                                                              ? ""
                                                              : filterDetalController
                                                                  .price_start
                                                                  .value
                                                                  .toString(),
                                                          priceSort: filterDetalController
                                                                  .sortingType
                                                                  .value
                                                                  .isEmpty
                                                              ? ""
                                                              : filterDetalController
                                                                  .sortingType
                                                                  .value,
                                                        )));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: SvgPicture.asset(
                                            'assets/icons/can.svg'),
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
                      //Category FIlter//////
                      Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        // width: 50,
                        height: 50,
                        // color: Colors.white,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          // color: Colors.white,
                        ),
                        child: Row(
                          // overflow: Overflow.visible,
                          children: [
                            GestureDetector(
                              onTap: () => Get.to(
                                () => SubCategories(
                                  mainCategoryId: widget.mainCategoryId,
                                  subCategories:
                                      subCategoryController.subCategoryList,
                                  id: widget.mainCategoryId,
                                  imgUrl: widget.imgUrl ?? '',
                                  catName: widget.catName,
                                  cityId: widget.cityId,
                                  cityName: widget.cityName,
                                ),
                                // () => CityChoice(id: widget.catId),
                              ),
                              child: Container(
                                // color: Colors.green,
                                padding: const EdgeInsets.only(right: 5),
                                child: Row(
                                  children: [
                                    Text(filterDetalController
                                        .mainCategoryName.value),
                                    Text(filterDetalController
                                            .subCategoryName.value.isEmpty
                                        ? ''
                                        : '/ ${filterDetalController.subCategoryName.value}'),
                                  ],
                                ),
                              ),
                            ),
                            filterDetalController.subCategoryName.isEmpty
                                ? Container(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: RotatedBox(
                                      quarterTurns: 1,
                                      child: SvgPicture.asset(
                                        'assets/icons/next-icon.svg',
                                        height: 16,
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      filterDetalController
                                          .subCategoryName.value = '';
                                      filterDetalController
                                          .subCategoryId.value = 0;
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ResultAds(
                                                    search:
                                                        filterDetalController
                                                            .searchWord.value,
                                                    catId: filterDetalController
                                                        .mainCategoryId.value,
                                                    cityId:
                                                        filterDetalController
                                                            .cityId.value
                                                            .toString(),
                                                    catName:
                                                        filterDetalController
                                                            .mainCategoryName
                                                            .value,
                                                    mainCategoryId:
                                                        filterDetalController
                                                            .mainCategoryId
                                                            .value,
                                                    priceFinish:
                                                        filterDetalController
                                                                    .price_finish
                                                                    .value ==
                                                                0
                                                            ? ""
                                                            : filterDetalController
                                                                .price_finish
                                                                .value
                                                                .toString(),
                                                    priceStart:
                                                        filterDetalController
                                                                    .price_start
                                                                    .value ==
                                                                0
                                                            ? ""
                                                            : filterDetalController
                                                                .price_start
                                                                .value
                                                                .toString(),
                                                    priceSort:
                                                        filterDetalController
                                                                .sortingType
                                                                .value
                                                                .isEmpty
                                                            ? ""
                                                            : filterDetalController
                                                                .sortingType
                                                                .value,
                                                  )));
                                    },
                                    child: Container(

                                        // color: Colors.pink,
                                        padding: const EdgeInsets.only(
                                            left: 0, right: 0, top: 5),
                                        child: SvgPicture.asset(
                                            'assets/icons/can.svg')),
                                  )
                          ],
                        ),
                      ),
                      SizedBox(width: 15),

                      //Price FIlter//////

                      filterDetalController.price_finish.value.isEmpty &&
                              filterDetalController.price_start.isEmpty
                          ? Container()
                          : Container(
                              // padding: const EdgeInsets.only(
                              //     left: 10, right: 20),
                              height: 50,
                              // color: Colors.white,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                // color: Colors.white,
                              ),
                              child: Row(
                                // overflow: Overflow.visible,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 10),
                                    // color: Colors.red,
                                    child: Center(
                                      child: Row(
                                        children: [
                                          if (!filterDetalController
                                              .price_start.value.isEmpty)
                                            Text('от ' +
                                                filterDetalController
                                                    .price_start.value
                                                    .toString() +
                                                ' '),
                                          if (!filterDetalController
                                              .price_finish.isEmpty)
                                            Text('до ' +
                                                filterDetalController
                                                    .price_finish.value
                                                    .toString())
                                        ],
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      filterDetalController.price_finish.value =
                                          '';
                                      filterDetalController.price_start.value =
                                          '';
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder:
                                                  (BuildContext context) =>
                                                      ResultAds(
                                                        search:
                                                            filterDetalController
                                                                .searchWord
                                                                .value,
                                                        catId: filterDetalController
                                                                    .subCategoryId.value ==
                                                                0
                                                            ? filterDetalController
                                                                .mainCategoryId
                                                                .value
                                                            : filterDetalController
                                                                .subCategoryId
                                                                .value,
                                                        cityId: filterDetalController
                                                                    .cityId ==
                                                                0
                                                            ? ""
                                                            : filterDetalController
                                                                .cityId.value
                                                                .toString(),
                                                        catName:
                                                            filterDetalController
                                                                .mainCategoryName
                                                                .value,
                                                        mainCategoryId:
                                                            filterDetalController
                                                                .mainCategoryId
                                                                .value,
                                                        priceFinish: filterDetalController
                                                                    .price_finish
                                                                    .value ==
                                                                0
                                                            ? ""
                                                            : filterDetalController
                                                                .price_finish
                                                                .value
                                                                .toString(),
                                                        priceStart: filterDetalController
                                                                    .price_start
                                                                    .value ==
                                                                0
                                                            ? ""
                                                            : filterDetalController
                                                                .price_start
                                                                .value
                                                                .toString(),
                                                        priceSort:
                                                            filterDetalController
                                                                    .sortingType
                                                                    .value
                                                                    .isEmpty
                                                                ? ""
                                                                : filterDetalController
                                                                    .sortingType
                                                                    .value,
                                                      )));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: SvgPicture.asset(
                                          'assets/icons/can.svg'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                advertismentSubCategoryController.adsSubList.isEmpty &&
                        advertismentSubCategoryController.isLoading.isFalse
                    ? Center(
                        child: Text(
                        'К сожалению, мы не нашли ничего похожего...',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ))
                    //     : advertismentSubCategoryController
                    //             .adsSubPremiumList.isEmpty
                    //         ? Container()
                    //         : Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Container(
                    //                 padding: EdgeInsets.only(
                    //                     left: 15, top: 5, bottom: 10),
                    //                 child: Text(
                    //                   'Премиум объявление',
                    //                   style: FontStyles.boldStyle(
                    //                     fontSize: 18,
                    //                     fontFamily: 'Lato',
                    //                     color: Colors.black,
                    //                   ),
                    //                 ),
                    //               ),
                    //               Padding(
                    //                 padding:
                    //                     const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    //                 child: GridView.builder(
                    //                   padding: EdgeInsets.zero,
                    //                   physics: NeverScrollableScrollPhysics(),
                    //                   shrinkWrap: true,
                    //                   itemCount: advertismentSubCategoryController
                    //                       .adsSubPremiumList.length,
                    //                   gridDelegate:
                    //                       SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    //                     crossAxisCount: 2,
                    //                     crossAxisSpacing: 5,
                    //                     mainAxisSpacing: 15,
                    //                     height:
                    //                         MediaQuery.of(context).size.height *
                    //                             0.33,
                    //                   ),
                    //                   itemBuilder: (context, index) {
                    //                     return GestureDetector(
                    //                       onTap: () => Get.to(() =>
                    //                           ProductDetailScreen(
                    //                             currencySort:
                    //                                 widget.currencySort == 'usd'
                    //                                     ? 'usd'
                    //                                     : '',
                    //                             proId:
                    //                                 advertismentSubCategoryController
                    //                                     .adsSubPremiumList[index]
                    //                                     .id,
                    //                           )),
                    //                       child: ProductItem(
                    //                           premium: advertismentSubCategoryController
                    //                                   .adsSubPremiumList[index]
                    //                                   .premium ??
                    //                               0,
                    //                           top: advertismentSubCategoryController
                    //                                   .adsSubPremiumList[index]
                    //                                   .top ??
                    //                               0,
                    //                           cityName: advertismentSubCategoryController
                    //                                   .adsSubPremiumList[index]
                    //                                   .cityName ??
                    //                               '',
                    //                           date: advertismentSubCategoryController
                    //                                   .adsSubPremiumList[index]
                    //                                   .date ??
                    //                               '',
                    //                           imageUrl: advertismentSubCategoryController
                    //                                   .adsSubPremiumList[index]
                    //                                   .photo ??
                    //                               '',
                    //                           price: widget.currencySort == 'usd'
                    //                               ? '${advertismentSubCategoryController.adsSubPremiumList[index].price} y.e'
                    //                               : '${advertismentSubCategoryController.adsSubPremiumList[index].price} сум'
                    //                                   .toString(),
                    //                           title: advertismentSubCategoryController.adsSubPremiumList[index].title ?? '',
                    //                           id: advertismentSubCategoryController.adsSubPremiumList[index].id!,
                    //                           isFavorite: false),
                    //                     );
                    //                   },
                    //                 ),
                    //               ),
                    //               SizedBox(height: 20),
                    //               GestureDetector(
                    //                 onTap: () {
                    //                   advertismentSubCategoryController
                    //                       .loadMorePremium(
                    //                           cityId: widget.cityId,
                    //                           currenySort: widget.currencySort,
                    //                           priceFinish: widget.priceFinish,
                    //                           priceSort: widget.priceSort,
                    //                           priceStart: widget.priceStart,
                    //                           searchWord: filterDetalController
                    //                                   .searchWord.value.isEmpty
                    //                               ? ""
                    //                               : filterDetalController
                    //                                   .searchWord.value,
                    //                           catId: widget.catId.toString());
                    //                 },
                    //                 child: Center(
                    //                   child: Container(
                    //                     padding: const EdgeInsets.symmetric(
                    //                       horizontal: 10,
                    //                       vertical: 10,
                    //                     ),
                    //                     decoration: BoxDecoration(
                    //                       color: ColorPalate.lightGreen,
                    //                       borderRadius: BorderRadius.circular(20),
                    //                     ),
                    //                     child: Text('Загрузи больше'),
                    //                   ),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    // advertismentSubCategoryController.adsSubTopList.isEmpty
                    //     ? Container()
                    //     : Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           Container(
                    //             padding:
                    //                 EdgeInsets.only(left: 15, top: 5, bottom: 10),
                    //             child: Text(
                    //               'Топ объявление',
                    //               style: FontStyles.boldStyle(
                    //                 fontSize: 18,
                    //                 fontFamily: 'Lato',
                    //                 color: Colors.black,
                    //               ),
                    //             ),
                    //           ),
                    //           Padding(
                    //             padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    //             child: GridView.builder(
                    //               padding: EdgeInsets.zero,
                    //               physics: NeverScrollableScrollPhysics(),
                    //               shrinkWrap: true,
                    //               itemCount: advertismentSubCategoryController
                    //                   .adsSubTopList.length,
                    //               gridDelegate:
                    //                   SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    //                 crossAxisCount: 2,
                    //                 crossAxisSpacing: 5,
                    //                 mainAxisSpacing: 15,
                    //                 height:
                    //                     MediaQuery.of(context).size.height * 0.33,
                    //               ),
                    //               itemBuilder: (context, index) {
                    //                 return GestureDetector(
                    //                   onTap: () =>
                    //                       Get.to(() => ProductDetailScreen(
                    //                             currencySort:
                    //                                 widget.currencySort == 'usd'
                    //                                     ? 'usd'
                    //                                     : '',
                    //                             proId:
                    //                                 advertismentSubCategoryController
                    //                                     .adsSubTopList[index].id,
                    //                           )),
                    //                   child: ProductItem(
                    //                       premium: advertismentSubCategoryController
                    //                               .adsSubPremiumList[index]
                    //                               .premium ??
                    //                           0,
                    //                       top: advertismentSubCategoryController
                    //                               .adsSubPremiumList[index].top ??
                    //                           0,
                    //                       cityName: advertismentSubCategoryController
                    //                               .adsSubTopList[index]
                    //                               .cityName ??
                    //                           '',
                    //                       date: advertismentSubCategoryController
                    //                               .adsSubTopList[index].date ??
                    //                           '',
                    //                       imageUrl: advertismentSubCategoryController
                    //                               .adsSubTopList[index].photo ??
                    //                           '',
                    //                       price: widget.currencySort == 'usd'
                    //                           ? '${advertismentSubCategoryController.adsSubTopList[index].price} y.e'
                    //                           : '${advertismentSubCategoryController.adsSubTopList[index].price} сум'.toString(),
                    //                       title: advertismentSubCategoryController.adsSubTopList[index].title ?? '',
                    //                       id: advertismentSubCategoryController.adsSubTopList[index].id!,
                    //                       isFavorite: false),
                    //                 );
                    //               },
                    //             ),
                    //           ),
                    //           SizedBox(height: 20),
                    //           GestureDetector(
                    //             onTap: () {
                    //               advertismentSubCategoryController.loadMoreTop(
                    //                   cityId: widget.cityId,
                    //                   currenySort: widget.currencySort,
                    //                   priceFinish: widget.priceFinish,
                    //                   priceSort: widget.priceSort,
                    //                   priceStart: widget.priceStart,
                    //                   searchWord: filterDetalController
                    //                           .searchWord.value.isEmpty
                    //                       ? ""
                    //                       : filterDetalController
                    //                           .searchWord.value,
                    //                   catId: widget.catId.toString());
                    //             },
                    //             child: Center(
                    //               child: Container(
                    //                 padding: const EdgeInsets.symmetric(
                    //                   horizontal: 10,
                    //                   vertical: 10,
                    //                 ),
                    //                 decoration: BoxDecoration(
                    //                   color: ColorPalate.lightGreen,
                    //                   borderRadius: BorderRadius.circular(20),
                    //                 ),
                    //                 child: Text('Загрузи больше'),
                    //               ),
                    //             ),
                    //           ),
                    //         ],
                    //       ),

                    : Column(
                        children: [
                          // SizedBox(height: 20),
                          // SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: GridView.builder(
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: advertismentSubCategoryController
                                  .adsSubList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 15,
                                height:
                                    MediaQuery.of(context).size.height * 0.33,
                              ),
                              itemBuilder: (context, index) {
                                var giventDate = DateTime.parse(
                                    advertismentSubCategoryController
                                        .adsSubList[index].date!);
                                var format = DateFormat("MMMMEEEEd");
                                return GestureDetector(
                                  onTap: () => Get.to(() => ProductDetailScreen(
                                        currencySort:
                                            widget.currencySort == 'usd'
                                                ? 'usd'
                                                : '',
                                        proId: advertismentSubCategoryController
                                            .adsSubList[index].id,
                                      )),
                                  child: ProductItem(
                                      typeAd: advertismentSubCategoryController
                                              .adsSubList[index].typeAd ??
                                          'price',
                                      premium: advertismentSubCategoryController
                                          .adsSubList[index].premium!,
                                      top: advertismentSubCategoryController
                                          .adsSubList[index].top!,
                                      cityName:
                                          advertismentSubCategoryController
                                                  .adsSubList[index].cityName ??
                                              '',
                                      date: format.format(giventDate),
                                      // date: advertismentSubCategoryController
                                      //         .adsSubList[index].date ??

                                      imageUrl:
                                          advertismentSubCategoryController
                                                  .adsSubList[index].photo ??
                                              '',
                                      //               formatCurrency
                                      // .format(adsController.adsList[index].price)
                                      // .replaceAll(',', ' ')
                                      price: widget.currencySort == 'usd'
                                          ? '${formatCurrency.format(advertismentSubCategoryController.adsSubList[index].price).replaceAll(',', ' ')} y.e'
                                          : '${formatCurrency.format(advertismentSubCategoryController.adsSubList[index].price).replaceAll(',', ' ')} сум'
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
                      )
              ],
            );
          }
        }),
        bottomNavigationBar: MyBottomNav(),
      ),
    );
  }
}
