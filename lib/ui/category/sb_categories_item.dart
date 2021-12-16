import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/controller/sub_category_controller.dart';

class SbCategoriesItem extends StatefulWidget {
  @override
  _SbCategoriesItemState createState() => _SbCategoriesItemState();
}

class _SbCategoriesItemState extends State<SbCategoriesItem> {
  final SubCategoryController subCategoryController =
      Get.find<SubCategoryController>();

  String dropdownvalue = 'Apple';

  var items = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'watermelon',
    'Pineapple'
  ];
  @override
  void initState() {
    print('this is init state in sb');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  // onSubmitted: (value) {
                  //   Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) =>
                  //             super.widget),
                  //   );
                  // },
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {
                        // sController.searchTitleChanger(
                        //     sTitle: searchController.text);
                        // print('afterrrrrr');

                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (BuildContext context) => this.widget),
                        // );

                        // Get.back();
                        // Get.to(() => lt(
                        //     // searchResult:
                        //     //     sController.searchTitle.toString(),
                        //     ));
                      },
                      icon: Icon(Icons.search),
                    ),
                    border: InputBorder.none,
                    hintText: 'Что вы ищете?',
                  ),
                ),
              ),
              RotatedBox(
                quarterTurns: 1,
                child: GestureDetector(
                  // onTap: () => Get.to(
                  //   // () => FilterPage(),
                  // ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    // margin: const EdgeInsets.only(top: 0, right: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 11),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/f.svg',
                      height: 22,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(() {
          if (subCategoryController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                // child: DropdownButtonHideUnderline(
                //   child: DropdownButton(
                //     value: dropdownvalue,
                //     icon: Icon(Icons.keyboard_arrow_down),
                //     items: items
                //         .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                //         .toList(),
                //     // items: items.map((String items) {
                //     //   return DropdownMenuItem(
                //     //       value: items,
                //     //       child: SizedBox(child: Text(items)));
                //     // }).toList(),
                //     onChanged: (String? value) {
                //       setState(() {
                //         dropdownvalue = value!;
                //       });
                //     },
                //   ),

                // ),
                alignment: Alignment.center);
          }
        }),
      ],
    );
  }
}
