import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/creating_add_info_controller.dart';

class CreatePrice extends StatefulWidget {
  @override
  _CreatePriceState createState() => _CreatePriceState();
}

class _CreatePriceState extends State<CreatePrice> {
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();

  final TextEditingController priceController = TextEditingController();

  int selectedIndex = 0;
  int val = -1;
  bool status1 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                creatingAddInfoController.typeIdChanger(1);
                print('typeId ${creatingAddInfoController.typeId.value}');
              },
              child: Container(
                width: 101,
                height: 35,
                decoration: BoxDecoration(
                    color: selectedIndex == 1
                        ? ColorPalate.mainColor
                        : Colors.white,
                    borderRadius: new BorderRadius.circular(
                      10.0,
                    ),
                    border: Border.all(
                      color: ColorPalate.mainColor,
                      width: 2,
                    )),
                child: Center(
                  child: Text(
                    'Цена',
                    style: TextStyle(
                      fontSize: 14,
                      color: selectedIndex == 1
                          ? Colors.white
                          : ColorPalate.mainColor,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                creatingAddInfoController.typeIdChanger(2);
                print('typeId ${creatingAddInfoController.typeId.value}');
              },
              child: Container(
                width: 101,
                height: 35,
                decoration: BoxDecoration(
                    color: selectedIndex == 2
                        ? ColorPalate.mainColor
                        : Colors.white,
                    borderRadius: new BorderRadius.circular(
                      10.0,
                    ),
                    border: Border.all(
                      color: ColorPalate.mainColor,
                      width: 2,
                    )),
                child: Center(
                  child: Text(
                    'Бесплатно',
                    style: TextStyle(
                      fontSize: 14,
                      color: selectedIndex == 2
                          ? Colors.white
                          : ColorPalate.mainColor,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
                creatingAddInfoController.typeIdChanger(3);
                print('typeId ${creatingAddInfoController.typeId.value}');
              },
              child: Container(
                width: 101,
                height: 35,
                decoration: BoxDecoration(
                    color: selectedIndex == 3
                        ? ColorPalate.mainColor
                        : Colors.white,
                    borderRadius: new BorderRadius.circular(
                      10.0,
                    ),
                    border: Border.all(
                      color: ColorPalate.mainColor,
                      width: 2,
                    )),
                child: Center(
                  child: Text(
                    'Обмен',
                    style: TextStyle(
                      fontSize: 14,
                      color: selectedIndex == 3
                          ? Colors.white
                          : ColorPalate.mainColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        selectedIndex == 1 ? SizedBox(height: 20) : Container(),
        selectedIndex == 1
            ? Text(
                'Сумма*',
                style: FontStyles.regularStyle(
                  fontSize: 16,
                  fontFamily: 'Lato',
                ),
              )
            : Container(),
        selectedIndex == 1 ? SizedBox(height: 11) : Container(),
        selectedIndex == 1
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: priceController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '100 000',
                      hintStyle: FontStyles.regularStyle(
                          fontSize: 16,
                          fontFamily: 'Lato',
                          color: Color(0xff616161)),
                    ),
                    onChanged: (String value) {
                      creatingAddInfoController
                          .priceChanger(double.parse(value));
                      print(creatingAddInfoController.price);
                    },
                  ),
                ),
              )
            : Container(),
        selectedIndex == 1
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: 1,
                    groupValue: val,
                    onChanged: (a) {
                      setState(() {
                        val = 1;
                      });
                    },
                    activeColor: Colors.black,
                  ),
                  Text(
                    'UZS',
                  ),
                  Radio(
                    value: 2,
                    groupValue: val,
                    onChanged: (a) {
                      setState(() {
                        val = 2;
                      });
                    },
                    activeColor: Colors.black,
                  ),
                  Text(
                    'USD',
                  ),
                ],
              )
            : Container(),
        selectedIndex == 1
            ? ListTile(
                onTap: () => setState(() {
                  status1 = !status1;
                }),
                title: Text(
                  'Договорная',
                  style: FontStyles.regularStyle(
                    fontSize: 18,
                    fontFamily: 'Lato',
                    color: Colors.black87,
                  ),
                ),
                trailing: Container(
                  width: 45,
                  height: 25,
                  child: FlutterSwitch(
                    activeColor: ColorPalate.mainColor,
                    value: status1,
                    onToggle: (val) {
                      setState(() {
                        status1 = val;
                      });
                    },
                  ),
                ),
              )
            : Container(),
        SizedBox(height: 45),
      ],
    );
  }
}
