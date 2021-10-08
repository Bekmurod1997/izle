import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  int selectedIndex = 0;
  int priceFitlerIndex = 0;
  int val = -1;
  String dropdownValue = 'Недвижимость';
  String dropdownCities = 'Tashkent';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(
        context,
        title: 'Фильтры',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Сортировка',
                style:
                    FontStyles.regularStyle(fontSize: 16, fontFamily: 'Roboto'),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      width: 101,
                      height: 31,
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
                          'Дешевые',
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
                    },
                    child: Container(
                      width: 101,
                      height: 31,
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
                          'Дорогие',
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
                    },
                    child: Container(
                      width: 101,
                      height: 31,
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
                          'Новые',
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
              SizedBox(height: 15),
              Text(
                'Категория',
                style:
                    FontStyles.regularStyle(fontSize: 16, fontFamily: 'Roboto'),
              ),
              SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue,
                  icon: SvgPicture.asset('assets/icons/bottom.svg'),
                  iconSize: 20,
                  elevation: 0,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Недвижимость',
                    'Транспорт',
                    'Работа',
                    'Животные'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: FontStyles.regularStyle(
                            fontSize: 16, fontFamily: 'Roboto'),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Местоположение',
                style:
                    FontStyles.regularStyle(fontSize: 16, fontFamily: 'Roboto'),
              ),
              SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownCities,
                  icon: SvgPicture.asset('assets/icons/bottom.svg'),
                  iconSize: 20,
                  elevation: 0,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownCities = newValue!;
                    });
                  },
                  items: <String>['Tashkent', 'Buxoro', 'Smarkand', 'Andijon']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: FontStyles.regularStyle(
                            fontSize: 16, fontFamily: 'Roboto'),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    priceFitlerIndex = 1;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: priceFitlerIndex == 1
                          ? ColorPalate.mainColor
                          : Colors.white,
                      borderRadius: new BorderRadius.circular(
                        10.0,
                      ),
                      border: Border.all(
                        color: priceFitlerIndex == 1
                            ? ColorPalate.mainColor
                            : Colors.white,
                        width: 2,
                      )),
                  child: Text(
                    'Цена',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          priceFitlerIndex == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    priceFitlerIndex = 2;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: priceFitlerIndex == 2
                          ? ColorPalate.mainColor
                          : Colors.white,
                      borderRadius: new BorderRadius.circular(
                        10.0,
                      ),
                      border: Border.all(
                        color: priceFitlerIndex == 2
                            ? ColorPalate.mainColor
                            : Colors.white,
                        width: 2,
                      )),
                  child: Text(
                    'Обмен',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          priceFitlerIndex == 2 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              GestureDetector(
                onTap: () {
                  setState(() {
                    priceFitlerIndex = 3;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: priceFitlerIndex == 3
                          ? ColorPalate.mainColor
                          : Colors.white,
                      borderRadius: new BorderRadius.circular(
                        10.0,
                      ),
                      border: Border.all(
                        color: priceFitlerIndex == 3
                            ? ColorPalate.mainColor
                            : Colors.white,
                        width: 2,
                      )),
                  child: Text(
                    'Бесплатно',
                    style: TextStyle(
                      fontSize: 16,
                      color:
                          priceFitlerIndex == 3 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              priceFitlerIndex == 1
                  ? Text(
                      'Цена',
                      style: FontStyles.regularStyle(
                          fontSize: 16, fontFamily: 'Roboto'),
                    )
                  : Container(),
              SizedBox(height: 12),
              priceFitlerIndex == 1
                  ? Row(
                      children: [
                        Container(
                          height: 50,
                          width: 120,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'От'),
                          ),
                        ),
                        SizedBox(width: 25),
                        Container(
                          height: 50,
                          width: 120,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'До'),
                          ),
                        ),
                      ],
                    )
                  : Container(),
              priceFitlerIndex == 1
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
              SizedBox(height: 80),
              CutomeButton(
                  title: 'Показать результаты',
                  onpress: () => Get.back(),
                  buttonColor: ColorPalate.mainColor,
                  textColor: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}
