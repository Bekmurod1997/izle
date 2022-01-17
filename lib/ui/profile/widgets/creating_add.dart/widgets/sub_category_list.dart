import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/controller/filter_category_controller.dart';
import 'package:izle/controller/sub_category_controller.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';
import 'package:izle/utils/my_prefs.dart';

class SubCategoryList extends StatefulWidget {
  final int id;
  final String catName;
  final String imgUrl;

  SubCategoryList({
    required this.id,
    required this.catName,
    required this.imgUrl,
  });

  @override
  State<SubCategoryList> createState() => _SubCategoryListState();
}

class _SubCategoryListState extends State<SubCategoryList> {
  final SubCategoryController subCategoryController =
      Get.find<SubCategoryController>();
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();

  final FilterCategoryController filterCategoryController =
      Get.find<FilterCategoryController>();
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // executes after build
      subCategoryController.fetchSubCategries(widget.id);
      print('this is sub cate iniit');
      print(subCategoryController.subCategoryList);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(context, title: 'subCategory'),
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
                onTap: () {},
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
                  child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
                  ),
                );
              } else {
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: 4,
                  ),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: subCategoryController.subCategoryList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        // await creatingAddInfoController.subCategoryChanger(
                        //     subCategoryName:
                        //         '${subCategoryController.subCategoryList[index].nameRu}',
                        //     id: subCategoryController
                        //         .subCategoryList[index].id!);
                        creatingAddInfoController.subCategoryId.value =
                            subCategoryController.subCategoryList[index].id!;
                        creatingAddInfoController.subCategory.value =
                            MyPref.lang == 'kr'
                                ? subCategoryController
                                    .subCategoryList[index].nameEn!
                                : MyPref.lang == 'uz'
                                    ? subCategoryController
                                        .subCategoryList[index].nameUz!
                                    : subCategoryController
                                        .subCategoryList[index].nameRu!;
                        print('pressed sub category id and name');
                        print(creatingAddInfoController.subCategory.value);
                        print(creatingAddInfoController.subCategoryId.value);

                        await filterCategoryController.fetchFilterCategories(
                            id: subCategoryController.subCategoryList[index].id
                                .toString());
                        Navigator.pop(context);
                        Navigator.pop(context);
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
                              MyPref.lang == 'kr'
                                  ? subCategoryController
                                      .subCategoryList[index].nameEn
                                      .toString()
                                  : MyPref.lang == 'uz'
                                      ? subCategoryController
                                          .subCategoryList[index].nameUz
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
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
