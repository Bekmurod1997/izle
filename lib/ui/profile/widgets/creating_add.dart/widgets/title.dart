import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/creating_add_info_controller.dart';

class CreateTitle extends StatelessWidget {
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();

  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          'headlineTitle'.tr,
          style: FontStyles.regularStyle(
            fontSize: 16,
            fontFamily: 'Lato',
          ),
        ),
        SizedBox(height: 11),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            child: TextFormField(
              // controller: creatingAddInfoController.title.value == 'nothing'? titleController:creatingAddInfoController.title.value,
              onChanged: (String value) {
                creatingAddInfoController.title.value = value;
              },
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: creatingAddInfoController.title.value.isEmpty
                    ? 'exampleSkil'.tr
                    : creatingAddInfoController.title.value,
                hintStyle: FontStyles.regularStyle(
                    fontSize: 16, fontFamily: 'Lato', color: Color(0xff616161)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
