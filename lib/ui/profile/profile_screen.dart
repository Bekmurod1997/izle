import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/ui/components/custom_bottomNavbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/ui/components/custom_listTile.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/create_add.dart';
import 'package:marquee/marquee.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 40,
          child: Marquee(
            text: '  Добро пожаловать на izle   ',
            style: FontStyles.regularStyle(
              fontSize: 24,
              fontFamily: 'Lato',
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/user.svg',
                    height: 80,
                  ),
                  SizedBox(width: 15),
                  Flexible(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Войдите, чтобы создать объявление, ответить на сообщение или найдите то, что вам нужно. Нет профиля? Создайте его за минуты.',
                        style: FontStyles.regularStyle(
                          fontSize: 12,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Get.to(() => CreatingAddScreen()),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin: const EdgeInsets.only(top: 31),
                  decoration: BoxDecoration(
                    color: ColorPalate.mainColor,
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Text(
                      'Создать',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Профиль и настройки',
                style: FontStyles.boldStyle(
                  fontSize: 20,
                  fontFamily: 'Lato',
                ),
              ),
              SizedBox(height: 30),
              CustomListTile(
                title: 'Настройки',
                onpress: () => print('pressed button'),
              ),
              CustomListTile(
                title: 'Выбрать',
                onpress: () => print('pressed button'),
              ),
              CustomListTile(
                title: 'Условия использования',
                onpress: () => print('pressed button'),
              ),
              CustomListTile(
                title: 'Политика конфиденциальности',
                onpress: () => print('pressed button'),
              ),
              CustomListTile(
                title: 'О приложении',
                onpress: () => print('pressed button'),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
