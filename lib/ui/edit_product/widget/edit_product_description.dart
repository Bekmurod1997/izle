import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/creating_add_info_controller.dart';

class EditCreateDescription extends StatefulWidget {
  final String content;
  EditCreateDescription({required this.content});
  @override
  State<EditCreateDescription> createState() => _EditCreateDescriptionState();
}

class _EditCreateDescriptionState extends State<EditCreateDescription> {
  TextEditingController itemDec = TextEditingController();
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();

  String workdCount = '';

  @override
  void initState() {
    itemDec.text = widget.content;
    workdCount = widget.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Описание*',
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
                    creatingAddInfoController.description.value = itemDec.text;
                  },
                  controller: itemDec,
                  maxLines: 8,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    // hintText:
                    // creatingAddInfoController.description.value ==
                    //         'nothing'
                    //     ?
                    // 'Подумайте, какие подробности вы хотели бы узнать из объявления. И добавьте их в описание.',
                    // : creatingAddInfoController.description.value,
                    // hintStyle: FontStyles.regularStyle(
                    //     fontSize: 16,
                    //     fontFamily: 'Lato',
                    //     color: Color(0xff616161)),
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
        SizedBox(height: 25),
      ],
    );
  }
}
