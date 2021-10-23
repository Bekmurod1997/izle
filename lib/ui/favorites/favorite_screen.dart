import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/controller/favorities_controller.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';
import 'package:izle/ui/product_detail/product_detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  void initState() {
    print('thsi is sfsdf');
    favoriteController.fetchFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(context, title: 'Избранное'),
      body: Obx(() {
        if (favoriteController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (favoriteController.favoriteList.isEmpty) {
          return Center(
            child: Text('Вы еще не добавили'),
          );
        } else {
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 5),
                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemBuilder: (context, index) => GestureDetector(
                          onTap: () => Get.to(() => ProductDetailScreen(
                              proId:
                                  favoriteController.favoriteList[index].id)),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: ColorPalate.addsBackgroundColor),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 9),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5)),
                                    height: 110,
                                    child: Image.network(
                                      'http://izle.selfieshop.uz/' +
                                          favoriteController
                                              .favoriteList[index].photo!,

                                      // height: MediaQuery.of(context).size.height * 0.20,
                                      // width: MediaQuery.of(context).size.width * 0.20,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 9, bottom: 9),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          // 'Стенка в гостинную Hyper коричневый ЛДСП',
                                          favoriteController
                                              .favoriteList[index].title!,
                                          style: FontStyles.regularStyle(
                                              fontSize: 12, fontFamily: 'Lato'),
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          // '90 500 000 сум',
                                          favoriteController
                                                  .favoriteList[index].price
                                                  .toString() +
                                              ' сум',
                                          style: FontStyles.boldStyle(
                                              fontSize: 12, fontFamily: 'Lato'),
                                        ),
                                        SizedBox(height: 12),
                                        Text(
                                          // 'Ташкент',
                                          favoriteController
                                              .favoriteList[index].cityName!,
                                          style: FontStyles.regularStyle(
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            color: Color(0xff616161),
                                          ),
                                        ),
                                        Text(
                                          // 'Сегодня 11:25',
                                          favoriteController
                                              .favoriteList[index].date!,
                                          style: FontStyles.regularStyle(
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                            color: Color(0xff616161),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: GestureDetector(
                                    onTap: () async {
                                      await AllServices.addAndRemoveFav(
                                          favoriteController
                                              .favoriteList[index].id!);
                                      favoriteController.fetchFavorites();
                                      print('after deleting');
                                      print(favoriteController
                                          .favoriteList.length);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(top: 19),
                                      child: SvgPicture.asset(
                                          'assets/icons/star_active.svg'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: favoriteController.favoriteList.length),
              ],
            ),
          );
        }
      }),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
