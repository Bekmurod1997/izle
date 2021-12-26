import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/all_regions_controller.dart';
import 'package:izle/models/all_regions_model.dart';
import 'package:izle/ui/edit_product/widget/edit_subregion_choice.dart';
import 'package:izle/ui/home/widgets/search_district.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/sub_region_choice.dart';

// ignore: must_be_immutable
class EditRegionChoice extends StatefulWidget {
  // final int mainCategoryId;
  // final String mainCategoryName;
  bool isDetailed;
  final String? cityName;
  EditRegionChoice(
      {
      //   required this.mainCategoryId,
      // required this.mainCategoryName,
      this.isDetailed = false,
      this.cityName});

  @override
  _EditRegionChoiceState createState() => _EditRegionChoiceState();
}

class _EditRegionChoiceState extends State<EditRegionChoice> {
  final AllRegionsController allRegionsController =
      Get.find<AllRegionsController>();
  @override
  void initState() {
    allRegionsController.fetchAllRegions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  // color: Colors.red,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: SvgPicture.asset(
                      'assets/icons/next-icon.svg',
                      height: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Text(
                'Местоположение',
                style: FontStyles.boldStyle(
                  fontSize: 24,
                  fontFamily: 'Lato',
                  color: Color(0xff4B4F5F),
                ),
              ),
            ],
          ),
          Obx(() {
            if (allRegionsController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorPalate.mainColor,
                ),
              );
            } else {
              return Expanded(
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  itemCount: allRegionsController.allRegionsList.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                        allRegionsController.allRegionsList[index].nameRu!),
                    trailing:
                        Icon(Icons.arrow_forward, color: ColorPalate.mainColor),
                    onTap: () {
                      Get.to(() => EditSubRegionChoice(
                          districts: allRegionsController
                                  .allRegionsList[index].childs ??
                              <Childs>[],
                          mainCityId:
                              allRegionsController.allRegionsList[index].id!,
                          mainCityName: allRegionsController
                              .allRegionsList[index].nameRu!));
                      // Get.to(
                      //   () => DistrictScreen(
                      //     // mainCategoryId: widget.mainCategoryId,
                      //     // mainCategoryName: widget.mainCategoryName,
                      //     mainCityId:
                      //         allRegionsController.allRegionsList[index].id!,
                      //     // mainCatId: widget.mainCategoryId,
                      //     mainCityName: allRegionsController
                      //         .allRegionsList[index].nameRu!,
                      //     districts: allRegionsController
                      //             .allRegionsList[index].childs ??
                      //         <Childs>[],
                      //   ),
                      // );
                    },
                  ),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
