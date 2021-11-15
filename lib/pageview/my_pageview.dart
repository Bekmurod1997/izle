import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/ads_view_controller.dart';
import 'package:izle/pageview/widgets/pageview_item.dart';
import 'package:izle/ui/nav.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final AdsViewController _adsViewController = Get.put(AdsViewController());

  var exampleText = ['hello1', 'bye2', 'something3', 'okayy4'];
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  //NavScreen

  @override
  void initState() {
    _adsViewController.fetchAdsView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        body: Obx(() {
          if (_adsViewController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPalate.mainColor,
              ),
            );
          } else {
            print(_adsViewController.adsViewList.length);
            return Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 4,
                    child: PageView(
                      controller: _pageController,
                      physics: ClampingScrollPhysics(),
                      onPageChanged: (int page) {
                        setState(() {
                          currentPage = page;
                        });
                      },
                      children: _adsViewController.adsViewList
                          .map(
                            (e) => PageViewItem(
                              imageUrl: e.photo!,
                              titile: e.name.toString(),
                              // titile: 'Мгновенная связь с поставщиком',
                            ),
                          )
                          .toList(),
                      // children: [
                      //   PageViewItem(
                      //     imageUrl: 'assets/images/4.jpg',
                      //     titile: 'Мгновенная связь с поставщиком',
                      //   ),
                      //   PageViewItem(
                      //     imageUrl: 'assets/images/2.png',
                      //     titile: 'Поиск продукции в онлайн режиме',
                      //   ),
                      //   PageViewItem(
                      //     imageUrl: 'assets/images/3.png',
                      //     titile: 'Платформа бесплатных объявлений',
                      //   ),
                      // ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _adsViewController.adsViewList.length,
                        (index) => buildDots(index: index),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.5,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                      elevation: 0,
                      color: ColorPalate.mainColor,
                      onPressed: () {
                        currentPage == _adsViewController.adsViewList.length - 1
                            ? Get.to(() => NavScreen())
                            : _pageController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        currentPage == 2 ? 'Далее'.tr : 'Далее'.tr,
                        style: FontStyles.boldStyle(
                            fontSize: 16,
                            fontFamily: 'Ubuntu',
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
        }));
  }

  Container buildDots({int? index}) {
    int curPage = currentPage;
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: curPage == index ? 20 : 7.0,
      height: 7,
      decoration: BoxDecoration(
        borderRadius: curPage == index
            ? BorderRadius.circular(6.0)
            : BorderRadius.circular(10.0),
        color: curPage == index ? ColorPalate.mainColor : Colors.white,
      ),
    );
  }
}
