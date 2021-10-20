import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/controller/sub_category_controller.dart';
import 'package:izle/ui/category/result_ads.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';

class SubCategories extends StatefulWidget {
  final int id;
  final String catName;
  final String imgUrl;
  SubCategories(
      {required this.id, required this.catName, required this.imgUrl});

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  final SubCategoryController subCategoryController =
      Get.find<SubCategoryController>();

  @override
  void initState() {
    subCategoryController.fetchSubCategries(widget.id);
    print(widget.id);
    print('this is sub cate iniit');
    print(subCategoryController.subCategoryList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(context, title: 'Категории'),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              margin: EdgeInsets.only(top: 5),
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => ResultAds(
                        catId: widget.id.toString(),
                      ));
                },
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: ColorPalate.categoryBackground,
                          shape: BoxShape.circle),
                      child: Center(
                        child: SvgPicture.network(
                            'http://izle.loko.uz/' + widget.imgUrl),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      widget.catName,
                      style: FontStyles.semiBoldStyle(
                        fontSize: 18,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              if (subCategoryController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.separated(
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
                        Get.to(() => ResultAds(
                              catId: subCategoryController
                                  .subCategoryList[index].id
                                  .toString(),
                            ));
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
                              subCategoryController
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
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
