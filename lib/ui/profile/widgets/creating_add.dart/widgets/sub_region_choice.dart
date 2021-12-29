import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/models/all_regions_model.dart';

class SubRegionChoice extends StatefulWidget {
  final bool isDetailed;
  final String mainCityName;
  final int mainCityId;
  final List<Childs> districts;
  SubRegionChoice(
      {this.isDetailed = false,
      required this.districts,
      required this.mainCityId,
      required this.mainCityName});
  @override
  _SubRegionChoiceState createState() => _SubRegionChoiceState();
}

class _SubRegionChoiceState extends State<SubRegionChoice> {
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();
  List<Childs> districts = [];
  @override
  void initState() {
    creatingAddInfoController.mainCity.value = widget.mainCityName;
    districts = widget.districts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Container(
            child: Row(
              children: [
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
                SizedBox(width: 20),
                Text(
                  widget.mainCityName,
                  style: FontStyles.boldStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                    color: Color(0xff4B4F5F),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 4,
              ),
              padding: EdgeInsets.zero,
              itemCount: districts.length,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: Colors.black,
                  width: 0.4,
                ))),
                child: ListTile(
                    trailing:
                        Icon(Icons.arrow_forward, color: ColorPalate.mainColor),
                    title: Text(districts[index].nameRu!),
                    onTap: () {
                      // creatingAddInfoController.cityName.value =
                      //     widget.mainCityName;
                      creatingAddInfoController.cityId.value =
                          districts[index].id!.toString();

                      creatingAddInfoController.districtName.value =
                          widget.mainCityName;

                      print('my city id');
                      print(creatingAddInfoController.cityId.value);
                      creatingAddInfoController.cityName.value =
                          districts[index].nameRu!;

                      creatingAddInfoController.address.value =
                          creatingAddInfoController.mainCity.value +
                              '  ${districts[index].nameRu}';
                      print(creatingAddInfoController.address.value);
                      Get.back();
                      Get.back();
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (BuildContext context) => SearchResult(
                      //         cityId: creatingAddInfoController.cityId.value == 0
                      //             ? ""
                      //             : creatingAddInfoController.cityId.value
                      //                 .toString(),
                      //         catId: filterSearchController
                      //                     .subCategoryId.value ==
                      //                 0
                      //             ? filterSearchController.mainCategoryId.value
                      //                 .toString()
                      //             : filterSearchController.subCategoryId.value
                      //                 .toString(),
                      //         priceFinish: filterSearchController
                      //                 .price_finish.value.isEmpty
                      //             ? ""
                      //             : filterSearchController.price_finish.value,
                      //         priceSort: filterSearchController
                      //                 .sortingType.value.isEmpty
                      //             ? ""
                      //             : filterSearchController.sortingType.value,
                      //         priceStart: filterSearchController
                      //                 .price_start.value.isEmpty
                      //             ? ""
                      //             : filterSearchController.price_start.value,
                      //       ),
                      //     ));

                      // filterDetalController.cityName.value =
                      //     widget.mainCityName;
                      // filterDetalController.districtName.value =
                      //     districts[index].nameRu!;
                      // filterDetalController.cityId.value = districts[index].id!;
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (BuildContext context) => ResultAds(
                      //               mainCategoryId: widget.mainCategoryId,
                      //               catId: widget.mainCatId,
                      //               catName: widget.mainCategoryName,
                      //               cityId: districts[index].id.toString(),
                      //               cityName: filterDetalController.cityName
                      //                   .toString(),
                      //             )));
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
