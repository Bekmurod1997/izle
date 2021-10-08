import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/controller/adrvertisement_subCategory_controller.dart';
import 'package:izle/controller/all_categories.dart';
import 'package:izle/controller/sub_category_controller.dart';
import 'package:izle/ui/category/sub_categories.dart';
import 'package:izle/ui/components/custom_bottomNavbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';

class AllCategoryScreen extends StatefulWidget {
  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  final AdvertismentSubCategoryController advertismentSubCategoryController =
      Get.put(AdvertismentSubCategoryController());

  final MainCategories mainCategories = Get.find<MainCategories>();

  final SubCategoryController subCategoryController =
      Get.put(SubCategoryController());

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
        title: Text('Категории',
            style: FontStyles.regularStyle(
              fontSize: 24,
              fontFamily: 'Lato',
            )),
      ),
      backgroundColor: ColorPalate.mainPageColor,
      body: Obx(() {
        if (mainCategories.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: mainCategories.categoriesList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.to(() => SubCategories(
                      id: mainCategories.categoriesList[index].id!,
                      catName: mainCategories.categoriesList[index].nameRu!,
                      imgUrl: mainCategories.categoriesList[index].photo!,
                    )),
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
                      mainCategories.categoriesList[index].nameRu.toString(),
                      style: FontStyles.semiBoldStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                      ),
                    ),
                    subtitle: Text(
                      '42345 объявлений',
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
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}