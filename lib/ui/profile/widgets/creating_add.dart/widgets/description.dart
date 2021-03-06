import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/creating_add_info_controller.dart';

class CreateDescription extends StatefulWidget {
  const CreateDescription({Key? key}) : super(key: key);

  @override
  State<CreateDescription> createState() => _CreateDescriptionState();
}

class _CreateDescriptionState extends State<CreateDescription> {
  TextEditingController itemDec = TextEditingController();
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();
  String workdCount = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'desctiption'.tr + '*',
          style: FontStyles.regularStyle(
            fontSize: 16,
            fontFamily: 'Lato',
          ),
        ),
        SizedBox(height: 11),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      workdCount = text;
                      print(workdCount.length);
                    });
                    creatingAddInfoController.description.value = workdCount;
                  },
                  controller: itemDec,
                  maxLines: 8,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText:
                        creatingAddInfoController.description.value.isEmpty
                            ? 'thinkAboutDes'.tr
                            : creatingAddInfoController.description.value,
                    hintStyle: FontStyles.regularStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                        color: Color(0xff616161)),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                  margin: const EdgeInsets.only(right: 20, bottom: 11),
                  child: Text(
                    workdCount.length.toString() + '/9000',
                    style: TextStyle(fontSize: 15, color: Color(0xff616161)),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
