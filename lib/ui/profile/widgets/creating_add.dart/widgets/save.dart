import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/filter_category_controller.dart';
import 'package:izle/models/category_filter_child_model.dart';

class CategoryFilters extends StatefulWidget {
  @override
  State<CategoryFilters> createState() => _CategoryFiltersState();
}

class _CategoryFiltersState extends State<CategoryFilters> {
  final FilterCategoryController filterCategoryController =
      Get.find<FilterCategoryController>();
  int? selectedTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // color: Colors.red,
      child: Obx(() {
        if (filterCategoryController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(color: ColorPalate.mainColor),
          );
        } else {
          return ListView.builder(
              itemCount: filterCategoryController.filterList.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      filterCategoryController.filterList[index].name ?? '',
                      style: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                      ),
                    ),
                    filterCategoryController.filterList[index].type == 'select'
                        ? Wrap(
                            children: List.generate(
                            filterCategoryController
                                    .filterList[index].childs?.length ??
                                0,
                            (childIndex) {
                              var childs = filterCategoryController
                                  .filterList[index].childs;
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    // print(filterCategoryController
                                    //     .filterList[index]
                                    //     .childs![childIndex]
                                    //     .id);
                                    // print(filterCategoryController
                                    //     .filterList[index]
                                    //     .childs![childIndex]
                                    //     .name);
                                    // for (var i = 0; i < childs!.length; i++) {
                                    //   // print(i)
                                    //   if (i == childIndex) {
                                    //     filterCategoryController
                                    //         .filterList[index]
                                    //         .childs?[childIndex]
                                    //         .isActive = true;
                                    //   } else {
                                    //     filterCategoryController
                                    //         .filterList[index]
                                    //         .childs?[i]
                                    //         .isActive = false;
                                    //   }
                                    // }

                                    // print(filterCategoryController
                                    //     .filterList[index]
                                    //     .childs![childIndex]
                                    //     .id!);
                                  },
                                  child: Container(
                                    color: filterCategoryController
                                            .filterList[index]
                                            .childs![childIndex]
                                            .isActive
                                        ? Colors.green
                                        : Colors.red,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Text(
                                      filterCategoryController.filterList[index]
                                              .childs?[childIndex].name ??
                                          '',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ))
                        : TextFormField(),
                  ],
                );
              });
        }
      }),
    );
  }
}
