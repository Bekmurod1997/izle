import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/controller/filter_category_controller.dart';

class CategoryFilters extends StatefulWidget {
  @override
  State<CategoryFilters> createState() => _CategoryFiltersState();
}

class _CategoryFiltersState extends State<CategoryFilters> {
  final FilterCategoryController filterCategoryController =
      Get.find<FilterCategoryController>();
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();
  Map<int, String>? options = Map();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (filterCategoryController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(color: ColorPalate.mainColor),
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // itemCount: filterCategoryController.filterList.length,
          children: List.generate(filterCategoryController.filterList.length,
              (index) {
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
                SizedBox(height: 15),
                filterCategoryController.filterList[index].type == 'select'
                    ? Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(
                          filterCategoryController
                                  .filterList[index].childs?.length ??
                              0,
                          (childIndex) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: filterCategoryController
                                              .filterList[index]
                                              .childs?[childIndex]
                                              .value
                                              .toString() ==
                                          options?[filterCategoryController
                                              .filterList[index].id!]
                                      ? ColorPalate.mainColor
                                      : Colors.white,
                                  borderRadius: new BorderRadius.circular(
                                    10.0,
                                  ),
                                  border: Border.all(
                                    color: ColorPalate.mainColor,
                                    width: 2,
                                  )),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: GestureDetector(
                                onTap: () {
                                  print('tapped');
                                  // print(filterCategoryController
                                  //     .filterList[index]
                                  //     .childs![childIndex]
                                  //     .id);
                                  // print(filterCategoryController
                                  //     .filterList[index]
                                  //     .childs![childIndex]
                                  //     .name);

                                  setState(() {
                                    print(options!.containsKey(
                                        filterCategoryController
                                            .filterList[index].id!));
                                    if (options!.containsKey(
                                        filterCategoryController
                                            .filterList[index].id!)) {
                                      options?.remove(filterCategoryController
                                          .filterList[index].id);
                                    } else if (options![filterCategoryController
                                            .filterList[index].id!] !=
                                        null) {
                                      options?.remove(filterCategoryController
                                          .filterList[index].id!);
                                      options?.putIfAbsent(
                                          filterCategoryController
                                              .filterList[index].id!,
                                          () => filterCategoryController
                                              .filterList[index]
                                              .childs![childIndex]
                                              .value!
                                              .toString());
                                    } else {
                                      options?.putIfAbsent(
                                          filterCategoryController
                                              .filterList[index].id!,
                                          () => filterCategoryController
                                              .filterList[index]
                                              .childs![childIndex]
                                              .value
                                              .toString());
                                    }
                                    creatingAddInfoController.myFileter.value =
                                        options ?? {};

                                    // if (options!.containsKey(
                                    //     filterCategoryController
                                    //         .filterList[index].id!)) {
                                    //   options?.remove(filterCategoryController
                                    //       .filterList[index].id!);
                                    // }
                                    print(options);
                                  });
                                  // print(filterCategoryController
                                  //     .filterList[index]
                                  //     .childs![childIndex]
                                  //     .id!);
                                },
                                child: Container(
                                  // color: filterCategoryController
                                  //             .filterList[index]
                                  //             .childs?[childIndex]
                                  //             .id
                                  //             .toString() ==
                                  //         options?[filterCategoryController
                                  //             .filterList[index].id!]
                                  //     ? Colors.green
                                  //     : Colors.red,
                                  // padding: const EdgeInsets.symmetric(
                                  //     horizontal: 10, vertical: 5),
                                  child: Text(
                                    filterCategoryController.filterList[index]
                                            .childs?[childIndex].name ??
                                        '',
                                    style: TextStyle(
                                      color: filterCategoryController
                                                  .filterList[index]
                                                  .childs?[childIndex]
                                                  .value
                                                  .toString() ==
                                              options?[filterCategoryController
                                                  .filterList[index].id!]
                                          ? Colors.white
                                          : ColorPalate.mainColor,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ))
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            onChanged: (val) {
                              setState(() {
                                if (options?[filterCategoryController
                                        .filterList[index].id!] ==
                                    null) {
                                  options?.putIfAbsent(
                                      filterCategoryController
                                          .filterList[index].id!,
                                      () => val);
                                } else {
                                  options?.update(
                                      filterCategoryController
                                          .filterList[index].id!,
                                      (value) => val);
                                }
                                creatingAddInfoController.myFileter.value =
                                    options ?? {};
                              });
                              print(options);
                            },
                          ),
                        ),
                      ),
                SizedBox(height: 15),
              ],
            );
          }),
          // return Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text(
          //       filterCategoryController.filterList[index].name ?? '',
          //       style: FontStyles.regularStyle(
          //         fontSize: 16,
          //         fontFamily: 'Lato',
          //       ),
          //     ),
          //     filterCategoryController.filterList[index].type == 'select'
          //         ? Wrap(
          //             children: List.generate(
          //             filterCategoryController
          //                     .filterList[index].childs?.length ??
          //                 0,
          //             (childIndex) {
          //               return Container(
          //                 padding: const EdgeInsets.symmetric(
          //                     horizontal: 10, vertical: 5),
          //                 child: GestureDetector(
          //                   onTap: () {
          //                     print('tapped');
          //                     // print(filterCategoryController
          //                     //     .filterList[index]
          //                     //     .childs![childIndex]
          //                     //     .id);
          //                     // print(filterCategoryController
          //                     //     .filterList[index]
          //                     //     .childs![childIndex]
          //                     //     .name);

          //                     setState(() {
          //                       print(options!.containsKey(
          //                           filterCategoryController
          //                               .filterList[index].id!));
          //                       if (options!.containsKey(
          //                           filterCategoryController
          //                               .filterList[index].id!)) {
          //                         options?.remove(filterCategoryController
          //                             .filterList[index].id);
          //                       } else if (options![
          //                               filterCategoryController
          //                                   .filterList[index].id!] !=
          //                           null) {
          //                         options?.remove(filterCategoryController
          //                             .filterList[index].id!);
          //                         options?.putIfAbsent(
          //                             filterCategoryController
          //                                 .filterList[index].id!,
          //                             () => filterCategoryController
          //                                 .filterList[index]
          //                                 .childs![childIndex]
          //                                 .id!
          //                                 .toString());
          //                       } else {
          //                         options?.putIfAbsent(
          //                             filterCategoryController
          //                                 .filterList[index].id!,
          //                             () => filterCategoryController
          //                                 .filterList[index]
          //                                 .childs![childIndex]
          //                                 .id!
          //                                 .toString());
          //                       }
          //                       creatingAddInfoController
          //                           .myFileter.value = options ?? {};

          //                       // if (options!.containsKey(
          //                       //     filterCategoryController
          //                       //         .filterList[index].id!)) {
          //                       //   options?.remove(filterCategoryController
          //                       //       .filterList[index].id!);
          //                       // }
          //                       print(options);
          //                     });
          //                     // print(filterCategoryController
          //                     //     .filterList[index]
          //                     //     .childs![childIndex]
          //                     //     .id!);
          //                   },
          //                   child: Container(
          //                     color: filterCategoryController
          //                                 .filterList[index]
          //                                 .childs?[childIndex]
          //                                 .id
          //                                 .toString() ==
          //                             options?[filterCategoryController
          //                                 .filterList[index].id!]
          //                         ? Colors.green
          //                         : Colors.red,
          //                     padding: const EdgeInsets.symmetric(
          //                         horizontal: 10, vertical: 5),
          //                     child: Text(
          //                       filterCategoryController.filterList[index]
          //                               .childs?[childIndex].name ??
          //                           '',
          //                     ),
          //                   ),
          //                 ),
          //               );
          //             },
          //           ))
          //         : TextFormField(
          //             onChanged: (val) {
          //               setState(() {
          //                 if (options?[filterCategoryController
          //                         .filterList[index].id!] ==
          //                     null) {
          //                   options?.putIfAbsent(
          //                       filterCategoryController
          //                           .filterList[index].id!,
          //                       () => val);
          //                 } else {
          //                   options?.update(
          //                       filterCategoryController
          //                           .filterList[index].id!,
          //                       (value) => val);
          //                 }
          //                 creatingAddInfoController.myFileter.value =
          //                     options ?? {};
          //               });
          //               print(options);
          //             },
          //           ),

          //   ],
          // );
        );
      }
    });
  }
}
