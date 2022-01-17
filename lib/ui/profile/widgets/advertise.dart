import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/controller/list_of_tariffs_controller.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart';

class Advertise extends StatefulWidget {
  const Advertise({Key? key}) : super(key: key);

  @override
  State<Advertise> createState() => _AdvertiseState();
}

class _AdvertiseState extends State<Advertise> {
  final ListOfTarrifsController listOfTarrifsController =
      Get.put(ListOfTarrifsController());
  @override
  void initState() {
    print('this is intstate');
    listOfTarrifsController.fetchTarrifs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(
        context,
        title: 'Рекламировать',
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Obx(() {
            if (listOfTarrifsController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorPalate.mainColor,
                ),
              );
            } else {
              return Center(
                child: Container(
                  height: 400,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        print('lengtj');
                        print(listOfTarrifsController.listOfTariffs.length);
                        print(listOfTarrifsController.listOfTariffs[0].name);
                        return Container(
                          margin: const EdgeInsets.only(left: 50),
                          height: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    top: 15, right: 40, left: 40, bottom: 30),
                                child: Text(
                                  // 'Быстрая продажа',
                                  listOfTarrifsController
                                      .listOfTariffs[index].name!,
                                  textAlign: TextAlign.center,
                                  style: FontStyles.semiBoldStyle(
                                    fontSize: 18,
                                    fontFamily: 'Lato',
                                    undeline: true,
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                'assets/icons/ad_g.svg',
                                height: 80,
                              ),
                              SizedBox(height: 12),
                              Text(
                                listOfTarrifsController
                                        .listOfTariffs[index].price
                                        .toString() +
                                    ' ' +
                                    'sum'.tr,
                                style: FontStyles.boldStyle(
                                  fontSize: 20,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              Text(
                                listOfTarrifsController
                                    .listOfTariffs[index].note!,
                                style: FontStyles.regularStyle(
                                  fontSize: 18,
                                  fontFamily: 'Lato',
                                  color: ColorPalate.mainColor,
                                ),
                              ),
                              SizedBox(
                                height: 27,
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                width: 260,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Топ объявление на ' +
                                          listOfTarrifsController
                                              .listOfTariffs[index].topLimit
                                              .toString() +
                                          ' дней',
                                      style: FontStyles.regularStyle(
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/check.svg',
                                    )
                                  ],
                                ),
                              ),
                              listOfTarrifsController
                                          .listOfTariffs[index].upLimit !=
                                      null
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      width: 260,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            listOfTarrifsController
                                                    .listOfTariffs[index]
                                                    .upLimit
                                                    .toString() +
                                                ' поднятие вверх списка',
                                            style: FontStyles.regularStyle(
                                              fontSize: 14,
                                              fontFamily: 'Lato',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          SvgPicture.asset(
                                              'assets/icons/check.svg')
                                        ],
                                      ),
                                    )
                                  : Container(),
                              listOfTarrifsController
                                          .listOfTariffs[index].vipLimit !=
                                      null
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18),
                                      width: 260,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Vip-объявление ' +
                                                listOfTarrifsController
                                                    .listOfTariffs[index]
                                                    .vipLimit
                                                    .toString() +
                                                ' дней',
                                            style: FontStyles.regularStyle(
                                              fontSize: 14,
                                              fontFamily: 'Lato',
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          SvgPicture.asset(
                                              'assets/icons/check.svg')
                                        ],
                                      ),
                                    )
                                  : Container(),
                              SizedBox(height: 30),
                              GestureDetector(
                                onTap: () {
                                  print('sss');
                                  print(listOfTarrifsController
                                      .listOfTariffs[index].id);
                                  AllServices.buyTariff(
                                      id: listOfTarrifsController
                                          .listOfTariffs[index].id
                                          .toString());
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: ColorPalate.mainColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    'Выбрать',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(
                            width: 1,
                          ),
                      itemCount: listOfTarrifsController.listOfTariffs.length),
                ),
              );
            }
          }),
          SizedBox(height: 90),

          SizedBox(height: 50),
          // SizedBox(height: 30),
        ],
      ),
    );
  }
}
