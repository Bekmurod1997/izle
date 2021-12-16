import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/controller/complain_controller.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/utils/my_prefs.dart';

class ComplainScreen extends StatefulWidget {
  final int id;
  ComplainScreen({required this.id});
  @override
  _ComplainScreenState createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  final ComplainController complainController = Get.put(ComplainController());

  // List complainList = [
  //   'Спам',
  //   'Неверная рубрика',
  //   'Запрещенный товар/услуга',
  //   'Неактуальное объявление',
  //   'Агентство в рубрике от частных лиц',
  //   'Мошенничество'
  // ];

  int complainId = 0;
  int val = -1;
  @override
  void initState() {
    complainController.fetchComplains();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        appBar: customAppBar1(
          context,
          title: 'Пожаловаться',
        ),
        body: Obx(() {
          if (complainController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPalate.mainColor,
              ),
            );
          } else {
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Что не так с объявлением?',
                      style: FontStyles.mediumStyle(
                        fontSize: 18,
                        fontFamily: 'Lato',
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 430,
                      color: Colors.white,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                          onTap: () => setState(() {
                            val = index;
                            complainId =
                                complainController.complatList[index].id!;
                            print(complainId);
                          }),
                          title: Text(
                            complainController.complatList[index].nameRu!,
                            style: FontStyles.mediumStyle(
                              fontSize: 16,
                              fontFamily: 'Lato',
                            ),
                          ),
                          trailing: Radio(
                            value: index,
                            groupValue: val,
                            onChanged: (value) {
                              setState(() {
                                val = index;
                                complainId =
                                    complainController.complatList[index].id!;
                              });
                              print(complainId);
                            },
                            activeColor: ColorPalate.mainColor,
                          ),
                        ),
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: complainController.complatList.length,
                      ),
                    ),
                    // SizedBox(height: 20),
                    // Text(
                    //   'Описание',
                    //   style: FontStyles.mediumStyle(
                    //     fontSize: 18,
                    //     fontFamily: 'Lato',
                    //   ),
                    // ),
                    // SizedBox(height: 11),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: new BorderRadius.circular(10.0),
                    //   ),
                    //   child: Padding(
                    //     padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    //     child: TextFormField(
                    //       decoration: InputDecoration(
                    //         border: InputBorder.none,
                    //         hintText: 'Напишите про жалобы',
                    //         hintStyle: FontStyles.mediumStyle(
                    //           fontSize: 16,
                    //           fontFamily: 'Lato',
                    //           color: Color(0xff616161),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 60,
                    ),
                    CutomeButton(
                      title: 'Пожаловаться',
                      onpress: () => MyPref.token.isNotEmpty && complainId != 0
                          ? AllServices.sendComplain(
                              ads_id: widget.id.toString(),
                              complainId: complainId.toString())
                          : Get.dialog(
                              Scaffold(
                                backgroundColor: Colors.black.withOpacity(.1),
                                body: Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    color: Colors.white,
                                    width: double.infinity,
                                    height: 100.0,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(
                                            'Вы должны авторизоваться, чтобы использовать эту функцию '),
                                        Text(
                                            'Или вы не выбрали указанные выше варианты'),
                                        SizedBox(
                                          width: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      buttonColor: ColorPalate.mainColor,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            );
          }
        }));
  }
}
