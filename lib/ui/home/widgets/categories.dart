import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/constants/colors.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/category/all_category_screen.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 15, left: 20, bottom: 20),
                child: Text(
                  'Категории',
                  style: FontStyles.regularStyle(
                    fontSize: 18,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => AllCategoryScreen());
                },
                child: Container(
                  margin: EdgeInsets.only(top: 10, right: 30, bottom: 20),
                  child: Text(
                    'Смотреть все',
                    style: FontStyles.thinStyle(
                      fontSize: 12,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 115,
            width: double.infinity,
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      width: 20,
                    ),
                scrollDirection: Axis.horizontal,
                itemCount: 30,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(15),
                        height: 80,
                        width: 80,
                        margin: index == 0
                            ? EdgeInsets.only(left: 20)
                            : EdgeInsets.only(left: 0),
                        decoration: BoxDecoration(
                            color: ColorPalate.categoryBackground,
                            shape: BoxShape.circle),
                        child: Center(
                            child: SvgPicture.asset('assets/icons/dollar.svg')),
                      ),
                      SizedBox(height: 4),
                      Container(
                        margin: index == 0
                            ? EdgeInsets.only(left: 20)
                            : EdgeInsets.only(left: 0),
                        child: Text(
                          'Недвижимость',
                          style: FontStyles.mediumStyle(
                            fontSize: 12,
                            fontFamily: 'Lato',
                            color: Color(0xff616161),
                          ),
                        ),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
