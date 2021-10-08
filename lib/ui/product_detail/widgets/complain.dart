import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class ComplainScreen extends StatefulWidget {
  @override
  _ComplainScreenState createState() => _ComplainScreenState();
}

class _ComplainScreenState extends State<ComplainScreen> {
  List complainList = [
    'Спам',
    'Неверная рубрика',
    'Запрещенный товар/услуга',
    'Неактуальное объявление',
    'Агентство в рубрике от частных лиц',
    'Мошенничество'
  ];
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(
        context,
        title: 'Пожаловаться',
      ),
      body: SingleChildScrollView(
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
                    }),
                    title: Text(
                      complainList[index],
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
                        });
                      },
                      activeColor: ColorPalate.mainColor,
                    ),
                  ),
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: complainList.length,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Описание',
                style: FontStyles.mediumStyle(
                  fontSize: 18,
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
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Напишите про жалобы',
                      hintStyle: FontStyles.mediumStyle(
                        fontSize: 16,
                        fontFamily: 'Lato',
                        color: Color(0xff616161),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              CutomeButton(
                title: 'Пожаловаться',
                onpress: () => Get.back(),
                buttonColor: ColorPalate.mainColor,
                textColor: Colors.white,
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
