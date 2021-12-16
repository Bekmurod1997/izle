import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/filter_search_controller.dart';
import 'package:izle/controller/search_controller.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/ui/home/widgets/filter_page.dart';
import 'package:flutter/rendering.dart';
import 'package:izle/ui/home/widgets/recommendation_item.dart';
import 'package:izle/ui/home/widgets/search_all_categories.dart';
import 'package:izle/ui/home/widgets/search_city.dart';
import 'package:izle/ui/product_detail/product_detail_screen.dart';
import '../home_screen.dart';

class SearchResult extends StatefulWidget {
  final String? cityId;
  final String? priceStart;
  final String? priceFinish;
  final String? priceSort;
  final String? catId;
  final String? currencySort;
  final String? categoryId;

  SearchResult(
      {this.cityId,
      this.priceSort,
      this.priceFinish,
      this.categoryId,
      this.catId,
      this.currencySort,
      this.priceStart});

  // final String searchResult;
  // SearchResult({required this.searchResult});

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final SearchController sController = Get.find<SearchController>();
  final FilterSearchController filterSearchController =
      Get.find<FilterSearchController>();
  ScrollController _scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();
  final formatCurrency = NumberFormat.decimalPattern();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      searchController.text = sController.searchTitle.value;
      sController.fetchSearch(
        currencySort: widget.currencySort,
        search: sController.searchTitle.value,
        categoryId: widget.categoryId == '' ? '' : widget.categoryId,
        cityId: widget.cityId == '' ? '' : widget.cityId,
        priceFinish: widget.priceFinish,
        priceSort: widget.priceSort,
        priceStart: widget.priceSort,
      );
      sController.fetchSearchTop(
        currencySort: widget.currencySort,
        search: sController.searchTitle.value,
        categoryId: widget.categoryId == '' ? '' : widget.categoryId,
        cityId: widget.cityId == '' ? '' : widget.cityId,
        priceFinish: widget.priceFinish,
        priceSort: widget.priceSort,
        priceStart: widget.priceSort,
      );
      sController.fetchSearchPremium(
        currencySort: widget.currencySort,
        search: sController.searchTitle.value,
        categoryId: widget.categoryId == '' ? '' : widget.categoryId,
        cityId: widget.cityId == '' ? '' : widget.cityId,
        priceFinish: widget.priceFinish,
        priceSort: widget.priceSort,
        priceStart: widget.priceSort,
      );
      print('this is init state of search result');
      print('cityName');
      print(filterSearchController.cityName.value);
      print('district');
      print(filterSearchController.districtName.value);
      _scrollController.addListener(() {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          sController.loadMore(
            search: sController.searchTitle.value,
            categoryId: widget.categoryId == '' ? '' : widget.categoryId,
            cityId: widget.cityId == '' ? '' : widget.cityId,
            currencySort: widget.currencySort,
            priceFinish: widget.priceFinish,
            priceSort: widget.priceSort,
            priceStart: widget.priceStart,
          );
          print('scrolling');
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        filterSearchController.resetAllForSearchController();
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 0,
              ),
              Container(
                // width: MediaQuery.of(context).size.width * 0.72,
                margin: EdgeInsets.fromLTRB(5, 40, 5, 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: TextField(
                  controller: searchController,
                  onSubmitted: (value) {
                    sController.currentPage.value = 1;
                    sController.searchTitleChanger(
                        sTitle: searchController.text);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => super.widget),
                    );
                  },
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {
                        sController.currentPage.value = 1;
                        sController.searchTitleChanger(
                            sTitle: searchController.text);
                        print('afterrrrrr');

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => super.widget),
                        );
                      },
                      icon: Icon(Icons.search),
                    ),
                    border: InputBorder.none,
                    hintText: 'Что вы ищете?',
                  ),
                ),
              ),
              Obx(() {
                if (sController.isLoading.value &&
                    sController.isLoadingTop.value &&
                    sController.isLoadingPremium.value &&
                    !sController.isLoadMore.value &&
                    !sController.isLoadMoreTop.value &&
                    !sController.isLoadMorePremium.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
                    ),
                  );
                } else {
                  print('+++++');
                  print(sController.searchList.length);
                  return sController.searchList.length == 0
                      ? Center(
                          child: Column(
                            children: [
                              Container(
                                height: 40,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    //FIlter Regions

                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),

                                        // color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => Get.to(
                                                () => SearchCityScreen()),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Text(filterSearchController
                                                          .cityName
                                                          .value
                                                          .isEmpty
                                                      ? 'Все города'
                                                      : filterSearchController
                                                          .cityName.value),
                                                  Text(filterSearchController
                                                          .districtName
                                                          .value
                                                          .isEmpty
                                                      ? ''
                                                      : '/ ${filterSearchController.districtName.value}'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: GestureDetector(
                                              onTap: () {
                                                filterSearchController
                                                    .cityId.value = 0;
                                                filterSearchController
                                                    .cityName.value = '';
                                                filterSearchController
                                                    .districtName.value = '';
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            SearchResult(
                                                              catId: filterSearchController
                                                                          .subCategoryId
                                                                          .value ==
                                                                      0
                                                                  ? filterSearchController
                                                                      .mainCategoryId
                                                                      .value
                                                                      .toString()
                                                                  : filterSearchController
                                                                      .subCategoryId
                                                                      .value
                                                                      .toString(),
                                                              cityId: '',
                                                              priceFinish:
                                                                  filterSearchController
                                                                      .price_finish
                                                                      .value,
                                                              priceStart:
                                                                  filterSearchController
                                                                      .price_start
                                                                      .value,
                                                            )));
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: filterSearchController
                                                            .cityId.value ==
                                                        0
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: RotatedBox(
                                                          quarterTurns: 1,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/next-icon.svg',
                                                            height: 16,
                                                          ),
                                                        ),
                                                      )
                                                    : SvgPicture.asset(
                                                        'assets/icons/can.svg'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    // Category Filter

                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),

                                        // color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => Get.to(() =>
                                                SearchAllCategoryScreen()),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Text(filterSearchController
                                                          .mainCategoryName
                                                          .value
                                                          .isEmpty
                                                      ? 'Все категории'
                                                      : filterSearchController
                                                          .mainCategoryName
                                                          .value),
                                                  Text(filterSearchController
                                                          .subCategoryName
                                                          .value
                                                          .isEmpty
                                                      ? ''
                                                      : '/ ${filterSearchController.subCategoryName.value}'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: GestureDetector(
                                              onTap: () {
                                                filterSearchController
                                                    .mainCategoryName
                                                    .value = '';
                                                filterSearchController
                                                    .subCategoryName.value = '';
                                                filterSearchController
                                                    .mainCategoryId.value = 0;
                                                filterSearchController
                                                    .subCategoryId.value = 0;

                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            SearchResult(
                                                              catId: '',
                                                              cityId:
                                                                  filterSearchController
                                                                      .cityId
                                                                      .value
                                                                      .toString(),
                                                              priceFinish:
                                                                  filterSearchController
                                                                      .price_finish
                                                                      .value,
                                                              priceStart:
                                                                  filterSearchController
                                                                      .price_start
                                                                      .value,
                                                            )));
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: filterSearchController
                                                            .mainCategoryId
                                                            .value ==
                                                        0
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: RotatedBox(
                                                          quarterTurns: 1,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/next-icon.svg',
                                                            height: 16,
                                                          ),
                                                        ),
                                                      )
                                                    : SvgPicture.asset(
                                                        'assets/icons/can.svg'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),

                                    //Picre FIlter

                                    filterSearchController
                                                .price_finish.value.isEmpty &&
                                            filterSearchController
                                                .price_start.value.isEmpty
                                        ? Container()
                                        : Container(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              // color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      if (!filterSearchController
                                                          .price_start
                                                          .value
                                                          .isEmpty)
                                                        Text('от ' +
                                                            filterSearchController
                                                                .price_start
                                                                .value
                                                                .toString() +
                                                            ' '),
                                                      if (!filterSearchController
                                                          .price_finish.isEmpty)
                                                        Text('до ' +
                                                            filterSearchController
                                                                .price_finish
                                                                .value
                                                                .toString())
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      filterSearchController
                                                          .price_finish
                                                          .value = '';
                                                      filterSearchController
                                                          .price_start
                                                          .value = '';
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  SearchResult(
                                                                    catId: filterSearchController.subCategoryId.value ==
                                                                            0
                                                                        ? filterSearchController
                                                                            .mainCategoryId
                                                                            .value
                                                                            .toString()
                                                                        : filterSearchController
                                                                            .subCategoryId
                                                                            .value
                                                                            .toString(),
                                                                    cityId: filterSearchController.cityId.value ==
                                                                            0
                                                                        ? ''
                                                                        : filterSearchController
                                                                            .cityId
                                                                            .value
                                                                            .toString(),
                                                                    priceFinish:
                                                                        '',
                                                                    priceStart:
                                                                        '',
                                                                  )));
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: filterSearchController
                                                                  .price_start
                                                                  .value
                                                                  .isEmpty &&
                                                              filterSearchController
                                                                  .price_start
                                                                  .value
                                                                  .isEmpty
                                                          ? Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 10),
                                                              child: RotatedBox(
                                                                quarterTurns: 1,
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/icons/next-icon.svg',
                                                                  height: 16,
                                                                ),
                                                              ),
                                                            )
                                                          : SvgPicture.asset(
                                                              'assets/icons/can.svg'),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/ss.png',
                                fit: BoxFit.fitWidth,
                              ),
                              Text(
                                  'К сожалению, мы не нашли ничего похожего...')
                            ],
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                height: 40,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: [
                                    //FIlter Regions
                                    GestureDetector(
                                      onTap: () => Get.to(
                                        () => FilterPage(
                                          searchTitle:
                                              sController.searchTitle.value,
                                        ),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Филтры',
                                            ),
                                            Container(
                                              padding: const EdgeInsets.only(
                                                  left: 10),
                                              child: RotatedBox(
                                                quarterTurns: 1,
                                                child: SvgPicture.asset(
                                                  'assets/icons/f.svg',
                                                  height: 22,
                                                  color: ColorPalate.mainColor,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        // color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => Get.to(
                                                () => SearchCityScreen()),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Text(filterSearchController
                                                          .cityName
                                                          .value
                                                          .isEmpty
                                                      ? 'Все города'
                                                      : filterSearchController
                                                          .cityName.value),
                                                  Text(filterSearchController
                                                          .districtName
                                                          .value
                                                          .isEmpty
                                                      ? ''
                                                      : '/ ${filterSearchController.districtName.value}'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: GestureDetector(
                                              onTap: () {
                                                filterSearchController
                                                    .cityId.value = 0;
                                                filterSearchController
                                                    .cityName.value = '';
                                                filterSearchController
                                                    .districtName.value = '';
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            SearchResult(
                                                              catId: filterSearchController
                                                                          .subCategoryId
                                                                          .value ==
                                                                      0
                                                                  ? filterSearchController
                                                                      .mainCategoryId
                                                                      .value
                                                                      .toString()
                                                                  : filterSearchController
                                                                      .subCategoryId
                                                                      .value
                                                                      .toString(),
                                                              cityId: '',
                                                              priceFinish:
                                                                  filterSearchController
                                                                      .price_finish
                                                                      .value,
                                                              priceStart:
                                                                  filterSearchController
                                                                      .price_start
                                                                      .value,
                                                            )));
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: filterSearchController
                                                            .cityId.value ==
                                                        0
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: RotatedBox(
                                                          quarterTurns: 1,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/next-icon.svg',
                                                            height: 16,
                                                          ),
                                                        ),
                                                      )
                                                    : SvgPicture.asset(
                                                        'assets/icons/can.svg'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    // Category Filter

                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        // color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () => Get.to(() =>
                                                SearchAllCategoryScreen()),
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Text(filterSearchController
                                                          .mainCategoryName
                                                          .value
                                                          .isEmpty
                                                      ? 'Все категории'
                                                      : filterSearchController
                                                          .mainCategoryName
                                                          .value),
                                                  Text(filterSearchController
                                                          .subCategoryName
                                                          .value
                                                          .isEmpty
                                                      ? ''
                                                      : '/ ${filterSearchController.subCategoryName.value}'),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: GestureDetector(
                                              onTap: () {
                                                filterSearchController
                                                    .mainCategoryName
                                                    .value = '';
                                                filterSearchController
                                                    .subCategoryName.value = '';
                                                filterSearchController
                                                    .mainCategoryId.value = 0;
                                                filterSearchController
                                                    .subCategoryId.value = 0;

                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            SearchResult(
                                                              catId: '',
                                                              cityId:
                                                                  filterSearchController
                                                                      .cityId
                                                                      .value
                                                                      .toString(),
                                                              priceFinish:
                                                                  filterSearchController
                                                                      .price_finish
                                                                      .value,
                                                              priceStart:
                                                                  filterSearchController
                                                                      .price_start
                                                                      .value,
                                                            )));
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: filterSearchController
                                                            .mainCategoryId
                                                            .value ==
                                                        0
                                                    ? Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child: RotatedBox(
                                                          quarterTurns: 1,
                                                          child:
                                                              SvgPicture.asset(
                                                            'assets/icons/next-icon.svg',
                                                            height: 16,
                                                          ),
                                                        ),
                                                      )
                                                    : SvgPicture.asset(
                                                        'assets/icons/can.svg'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),

                                    //Picre FIlter

                                    filterSearchController
                                                .price_finish.value.isEmpty &&
                                            filterSearchController
                                                .price_start.value.isEmpty
                                        ? Container()
                                        : Container(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              // color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      if (!filterSearchController
                                                          .price_start
                                                          .value
                                                          .isEmpty)
                                                        Text('от ' +
                                                            filterSearchController
                                                                .price_start
                                                                .value
                                                                .toString() +
                                                            ' '),
                                                      if (!filterSearchController
                                                          .price_finish.isEmpty)
                                                        Text('до ' +
                                                            filterSearchController
                                                                .price_finish
                                                                .value
                                                                .toString())
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      filterSearchController
                                                          .price_finish
                                                          .value = '';
                                                      filterSearchController
                                                          .price_start
                                                          .value = '';
                                                      Navigator.pushReplacement(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  SearchResult(
                                                                    catId: filterSearchController.subCategoryId.value ==
                                                                            0
                                                                        ? filterSearchController
                                                                            .mainCategoryId
                                                                            .value
                                                                            .toString()
                                                                        : filterSearchController
                                                                            .subCategoryId
                                                                            .value
                                                                            .toString(),
                                                                    cityId: filterSearchController.cityId.value ==
                                                                            0
                                                                        ? ''
                                                                        : filterSearchController
                                                                            .cityId
                                                                            .value
                                                                            .toString(),
                                                                    priceFinish:
                                                                        '',
                                                                    priceStart:
                                                                        '',
                                                                  )));
                                                    },
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 5),
                                                      child: filterSearchController
                                                                  .price_start
                                                                  .value
                                                                  .isEmpty &&
                                                              filterSearchController
                                                                  .price_start
                                                                  .value
                                                                  .isEmpty
                                                          ? Container(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 10),
                                                              child: RotatedBox(
                                                                quarterTurns: 1,
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/icons/next-icon.svg',
                                                                  height: 16,
                                                                ),
                                                              ),
                                                            )
                                                          : SvgPicture.asset(
                                                              'assets/icons/can.svg'),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'Мы нашли ' +
                                    sController.searchList.length.toString() +
                                    ' объявлений',
                                // 'Мы нашли ${sController.allSearchList().mMeta?.totalCount} объявлений',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 16),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Container(
                            //       padding: EdgeInsets.only(
                            //           left: 15, top: 5, bottom: 10),
                            //       child: Text(
                            //         'Премиум объявление',
                            //         style: FontStyles.boldStyle(
                            //           fontSize: 18,
                            //           fontFamily: 'Lato',
                            //           color: Colors.black,
                            //         ),
                            //       ),
                            //     ),
                            //     Padding(
                            //       padding:
                            //           const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            //       child: GridView.builder(
                            //         padding: EdgeInsets.zero,
                            //         physics: NeverScrollableScrollPhysics(),
                            //         shrinkWrap: true,
                            //         itemCount:
                            //             sController.searchListPremium.length,
                            //         gridDelegate:
                            //             SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            //           crossAxisCount: 2,
                            //           crossAxisSpacing: 5,
                            //           mainAxisSpacing: 5,
                            //           height:
                            //               MediaQuery.of(context).size.height *
                            //                   0.34,
                            //         ),
                            //         itemBuilder: (context, index) {
                            //           return GestureDetector(
                            //             onTap: () => Get.to(() =>
                            //                 ProductDetailScreen(
                            //                     currencySort:
                            //                         widget.currencySort,
                            //                     proId: sController
                            //                         .searchListPremium[index]
                            //                         .id!)),
                            //             child: RecommandationItem(
                            //               premium: sController
                            //                   .searchListPremium[index]
                            //                   .premium!,
                            //               top: sController
                            //                   .searchListPremium[index].top!,
                            //               typeAd: sController
                            //                       .searchListPremium[index]
                            //                       .typeAd ??
                            //                   'price',
                            //               isFavorite: false,
                            //               title: sController
                            //                   .searchListPremium[index].title!,
                            //               id: sController
                            //                   .searchListPremium[index].id!,
                            //               city: sController
                            //                   .searchListPremium[index]
                            //                   .cityName!,
                            //               price: widget.currencySort == 'usd'
                            //                   ? sController
                            //                           .searchListPremium[index]
                            //                           .price
                            //                           .toString() +
                            //                       ' y.e'
                            //                   : sController
                            //                           .searchListPremium[index]
                            //                           .price
                            //                           .toString() +
                            //                       ' сум',
                            //               date: sController
                            //                   .searchListPremium[index].date!,
                            //               imageUrl: sController
                            //                   .searchListPremium[index].photo!,
                            //             ),
                            //           );
                            //         },
                            //       ),
                            //     ),
                            //     SizedBox(height: 20),
                            //     GestureDetector(
                            //       onTap: () {
                            //         sController.loadMorePremium(
                            //           search: sController.searchTitle.value,
                            //           categoryId: widget.categoryId == ''
                            //               ? ''
                            //               : widget.categoryId,
                            //           cityId: widget.cityId == ''
                            //               ? ''
                            //               : widget.cityId,
                            //           currencySort: widget.currencySort,
                            //           priceFinish: widget.priceFinish,
                            //           priceSort: widget.priceSort,
                            //           priceStart: widget.priceStart,
                            //         );
                            //       },
                            //       child: Center(
                            //         child: Container(
                            //           padding: const EdgeInsets.symmetric(
                            //             horizontal: 10,
                            //             vertical: 10,
                            //           ),
                            //           decoration: BoxDecoration(
                            //             color: ColorPalate.lightGreen,
                            //             borderRadius: BorderRadius.circular(20),
                            //           ),
                            //           child: Text('Загрузи больше'),
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(height: 40),
                            //   ],
                            // ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Container(
                            //       padding: EdgeInsets.only(
                            //           left: 15, top: 5, bottom: 10),
                            //       child: Text(
                            //         'Топ объявление',
                            //         style: FontStyles.boldStyle(
                            //           fontSize: 18,
                            //           fontFamily: 'Lato',
                            //           color: Colors.black,
                            //         ),
                            //       ),
                            //     ),
                            //     Padding(
                            //       padding:
                            //           const EdgeInsets.fromLTRB(5, 0, 5, 0),
                            //       child: GridView.builder(
                            //         padding: EdgeInsets.zero,
                            //         physics: NeverScrollableScrollPhysics(),
                            //         shrinkWrap: true,
                            //         itemCount: sController.searchListTop.length,
                            //         gridDelegate:
                            //             SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                            //           crossAxisCount: 2,
                            //           crossAxisSpacing: 5,
                            //           mainAxisSpacing: 5,
                            //           height:
                            //               MediaQuery.of(context).size.height *
                            //                   0.34,
                            //         ),
                            //         itemBuilder: (context, index) {
                            //           return GestureDetector(
                            //             onTap: () => Get.to(() =>
                            //                 ProductDetailScreen(
                            //                     currencySort:
                            //                         widget.currencySort,
                            //                     proId: sController
                            //                         .searchListTop[index].id!)),
                            //             child: RecommandationItem(
                            //               premium: sController
                            //                   .searchListTop[index].premium!,
                            //               top: sController
                            //                   .searchListTop[index].top!,
                            //               typeAd: sController
                            //                       .searchListTop[index]
                            //                       .typeAd ??
                            //                   'price',
                            //               isFavorite: false,
                            //               title: sController
                            //                   .searchListTop[index].title!,
                            //               id: sController
                            //                   .searchListTop[index].id!,
                            //               city: sController
                            //                   .searchListTop[index].cityName!,
                            //               price: widget.currencySort == 'usd'
                            //                   ? sController.searchListTop[index]
                            //                           .price
                            //                           .toString() +
                            //                       ' y.e'
                            //                   : sController.searchListTop[index]
                            //                           .price
                            //                           .toString() +
                            //                       ' сум',
                            //               date: sController
                            //                   .searchListTop[index].date!,
                            //               imageUrl: sController
                            //                   .searchListTop[index].photo!,
                            //             ),
                            //           );
                            //         },
                            //       ),
                            //     ),
                            //     SizedBox(height: 20),
                            //     GestureDetector(
                            //       onTap: () {
                            //         sController.loadMoreTop(
                            //           search: sController.searchTitle.value,
                            //           categoryId: widget.categoryId == ''
                            //               ? ''
                            //               : widget.categoryId,
                            //           cityId: widget.cityId == ''
                            //               ? ''
                            //               : widget.cityId,
                            //           currencySort: widget.currencySort,
                            //           priceFinish: widget.priceFinish,
                            //           priceSort: widget.priceSort,
                            //           priceStart: widget.priceStart,
                            //         );
                            //       },
                            //       child: Center(
                            //         child: Container(
                            //           padding: const EdgeInsets.symmetric(
                            //             horizontal: 10,
                            //             vertical: 10,
                            //           ),
                            //           decoration: BoxDecoration(
                            //             color: ColorPalate.lightGreen,
                            //             borderRadius: BorderRadius.circular(20),
                            //           ),
                            //           child: Text('Загрузи больше'),
                            //         ),
                            //       ),
                            //     ),
                            //     SizedBox(height: 40),
                            //   ],
                            // ),

                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: sController.searchList.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.34,
                                    ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () => Get.to(() =>
                                            ProductDetailScreen(
                                                currencySort:
                                                    widget.currencySort,
                                                proId: sController
                                                    .searchList[index].id!)),
                                        child: RecommandationItem(
                                          premium: sController
                                              .searchList[index].premium!,
                                          top: sController
                                              .searchList[index].top!,
                                          typeAd: sController
                                                  .searchList[index].typeAd ??
                                              'price',
                                          isFavorite: false,
                                          title: sController
                                              .searchList[index].title!,
                                          id: sController.searchList[index].id!,
                                          city: sController
                                                  .searchList[index].cityName ??
                                              'tashkent',
                                          price: widget.currencySort == 'usd'
                                              ? formatCurrency
                                                      .format(sController
                                                          .searchList[index]
                                                          .price)
                                                      .replaceAll(',', ' ')
                                                      .toString() +
                                                  ' y.e'
                                              : formatCurrency
                                                      .format(sController
                                                          .searchList[index]
                                                          .price)
                                                      .replaceAll(',', ' ')
                                                      .toString() +
                                                  ' сум',
                                          date: sController
                                                  .searchList[index].date ??
                                              '',
                                          imageUrl: sController
                                                  .searchList[index].photo ??
                                              '',
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}


    //  GestureDetector(
    //                 onTap: () => Get.to(
    //                   () => FilterPage(
    //                     searchTitle: sController.searchTitle.value,
    //                   ),
    //                 ),
    //                 child: Container(
    //                   width: MediaQuery.of(context).size.width * 0.12,
    //                   margin: const EdgeInsets.only(top: 25, right: 20),
    //                   padding: const EdgeInsets.symmetric(
    //                       vertical: 13, horizontal: 11),
    //                   decoration: BoxDecoration(
    //                     boxShadow: [
    //                       BoxShadow(
    //                         color: Colors.grey.withOpacity(0.5),
    //                         spreadRadius: 5,
    //                         blurRadius: 7,
    //                         offset: Offset(0, 3), // changes position of shadow
    //                       ),
    //                     ],
    //                     color: Colors.white,
    //                     borderRadius: BorderRadius.circular(5),
    //                   ),
    //                   child: SvgPicture.asset(
    //                     'assets/icons/f.svg',
    //                     height: 22,
    //                   ),
    //                 ),
    //               ),
               