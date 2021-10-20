import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/ui/edit_product/widget/edit_category_list.dart';

class EditCategoryChoice extends StatelessWidget {
  final String category;
  EditCategoryChoice({required this.category});

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
                            creatingAddInfoController.subCategory.value ==
                                'nothing'
                        ? category
                        : creatingAddInfoController.mainCategory.value +
                            '/' +
                            creatingAddInfoController.subCategory.value),
                    trailing: Icon(Icons.navigate_next),
                    onTap: () => Get.to(() => EditCategoryList()));
              })),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
