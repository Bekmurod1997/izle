import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/category_list.dart';

class CategoryChoice extends StatelessWidget {
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Категория*',
          style: FontStyles.regularStyle(
            fontSize: 16,
            fontFamily: 'Lato',
          ),
        ),
        SizedBox(height: 11),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Obx(() {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(creatingAddInfoController.mainCategory.value ==
                            'nothing' &&
                        creatingAddInfoController.subCategory.value == 'nothing'
                    ? 'выберите категорию'
                    : creatingAddInfoController.mainCategory.value +
                        '/' +
                        creatingAddInfoController.subCategory.value),
                trailing: Icon(Icons.navigate_next),
                onTap: () => Get.to(
                  () => CategoryList(),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
