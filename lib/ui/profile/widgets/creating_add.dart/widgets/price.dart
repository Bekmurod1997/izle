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
  void initState() {
    setState(() {
      selectedIndex = 1;
    });
    super.initState();
  }

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
                  creatingAddInfoController.type_ad.value = 'price';
                });
                // creatingAddInfoController.typeIdChanger(1);
                print('typeId ${creatingAddInfoController.type_ad.value}');
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
                    'price'.tr,
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
                  creatingAddInfoController.type_ad.value = 'free';
                });
                creatingAddInfoController.typeIdChanger(2);

                print('typeId ${creatingAddInfoController.type_ad.value}');
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
                    'free'.tr,
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
                  creatingAddInfoController.type_ad.value = 'exchange';
                });
                // creatingAddInfoController.typeIdChanger(3);
                print('typeId ${creatingAddInfoController.type_ad.value}');
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
                    'exchange'.tr,
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
                'price'.tr + '*',
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
                  child: Stack(
                    children: [
                      TextFormField(
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
                          creatingAddInfoController.priceChanger(
                              double.parse(value.replaceAll(' ', '')));
                          print(creatingAddInfoController.price);
                        },
                      ),
                      Positioned(
                        right: 0,
                        top: 9,
                        child: Text(
                          'sum'.tr,
                          style: FontStyles.regularStyle(
                              fontSize: 20,
                              fontFamily: 'Lato',
                              color: Color(0xff616161)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
        creatingAddInfoController.priceCheck.value == false &&
                creatingAddInfoController.pCheck.value == true
            ? Text(
                'pleaseGivePrice'.tr,
                style: TextStyle(color: Colors.red),
              )
            : Container(),
        selectedIndex == 1
            ? ListTile(
                onTap: () => setState(() {
                  status1 = !status1;
                }),
                title: Text(
                  'negotiable'.tr,
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
                      if (status1 == true) {
                        creatingAddInfoController.type_ad.value = 'negotiable';
                      } else {
                        creatingAddInfoController.type_ad.value = 'price';
                      }
                      print('switch value');
                      print(creatingAddInfoController.type_ad.value);
                    },
                  ),
                ),
              )
            : Container(),
        SizedBox(height: 15),
      ],
    );
  }
}
