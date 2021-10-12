import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/controller/my_ads_controller.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/ui/components/custom_bottomNavbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/components/logout_dialog.dart';
import 'package:izle/ui/components/profile_listTile.dart';
import 'package:izle/ui/favorites/favorite_screen.dart';
import 'package:izle/ui/message/message_screen.dart';
import 'package:izle/ui/profile/widgets/adds/active_adds.dart';
import 'package:izle/ui/profile/widgets/adds/non_active_adds.dart';
import 'package:izle/ui/profile/widgets/settings/edit_profie.dart';
import 'package:izle/ui/profile/widgets/settings/settings.dart';
import 'package:izle/ui/profile/widgets/wallet/transactions.dart';
import 'package:izle/ui/profile/widgets/wallet/wallet.dart';
import 'package:izle/ui/wallet_instruction/wallet_instruction.dart';
import 'package:izle/utils/my_prefs.dart';

class ActiveProfileScreen extends StatefulWidget {
  const ActiveProfileScreen({Key? key}) : super(key: key);

  @override
  State<ActiveProfileScreen> createState() => _ActiveProfileScreenState();
}

class _ActiveProfileScreenState extends State<ActiveProfileScreen> {
  final UserInfoController userInfoController = Get.find<UserInfoController>();
  final MyAdsController myAdsController = Get.put(MyAdsController());

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // executes after build
      print(MyPref.token);
      userInfoController.fetchUserInfo();
      print(userInfoController.fetchUserInfoList);
      print('this is init state in active');
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Obx(() {
        if (userInfoController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 65),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff038992),
                  ),
                  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 20),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/user.svg',
                        height: 80,
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'a',
                            // userInfoController.fetchUserInfoList.first.name ??
                            //     '',
                            style: FontStyles.semiBoldStyle(
                              fontSize: 22,
                              fontFamily: 'Lato',
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 10, bottom: 5),
                            child: Row(
                              children: [
                                Text(
                                  'Ваш кошелек: 20 500,00 UZS',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white70),
                                ),
                                SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () =>
                                      Get.to(() => WalletInstruction()),
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: ColorPalate.lightGreen,
                                        width: 2,
                                      ),
                                    ),
                                    child: Text(
                                      'i',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: ColorPalate.lightGreen,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Редактировать профиль',
                            style: FontStyles.regularStyle(
                                fontSize: 12,
                                fontFamily: 'Lato',
                                color: Colors.white70),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: CutomeButton(
                    title: 'Опубликовать',
                    onpress: () => print('pressed'),
                    buttonColor: ColorPalate.lightGreen,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: CutomeButton(
                    title: 'Купить пакет',
                    onpress: () => print('pressed'),
                    buttonColor: ColorPalate.lightGreen,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 18,
                          top: 21,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ваши объявления',
                              style: FontStyles.semiBoldStyle(
                                fontSize: 18,
                                fontFamily: 'Lato',
                              ),
                            ),
                            SizedBox(height: 17),
                            ProfileListTile(
                              iconUrl: 'assets/icons/comm2.svg',
                              title: 'Активные',
                              onpress: () => Get.to(
                                () => ActiveAdds(),
                              ),
                            ),
                            ProfileListTile(
                              iconUrl: 'assets/icons/act_no.svg',
                              title: 'Неактивные',
                              onpress: () => Get.to(
                                () => NonActiveAdds(),
                              ),
                            ),
                            ProfileListTile(
                              iconUrl: 'assets/icons/act_fav.svg',
                              title: 'Избранное',
                              isDivider: false,
                              onpress: () => Get.to(
                                () => FavoriteScreen(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 23),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 18,
                          top: 21,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Сообщения',
                              style: FontStyles.semiBoldStyle(
                                fontSize: 18,
                                fontFamily: 'Lato',
                              ),
                            ),
                            SizedBox(height: 17),
                            ProfileListTile(
                              iconUrl: 'assets/icons/act_mes.svg',
                              title: 'Недавние',
                              onpress: () => Get.to(
                                () => MessageScreen(),
                              ),
                            ),
                            ProfileListTile(
                              iconUrl: 'assets/icons/act_arch.svg',
                              title: 'Архивные',
                              isDivider: false,
                              onpress: () =>
                                  print('it should go to archive message'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 23),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 18,
                          top: 21,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Платежи',
                              style: FontStyles.semiBoldStyle(
                                fontSize: 18,
                                fontFamily: 'Lato',
                              ),
                            ),
                            SizedBox(height: 17),
                            ProfileListTile(
                              iconUrl: 'assets/icons/act_wal.svg',
                              title: 'Ваш кошелек',
                              onpress: () => Get.to(
                                () => WalletScreen(),
                              ),
                            ),
                            ProfileListTile(
                              iconUrl: 'assets/icons/act_his.svg',
                              isDivider: false,
                              title: 'История платежей',
                              onpress: () => Get.to(
                                () => TransactionScreen(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 18,
                          top: 21,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Настройки и другое',
                              style: FontStyles.semiBoldStyle(
                                fontSize: 18,
                                fontFamily: 'Lato',
                              ),
                            ),
                            SizedBox(height: 17),
                            ProfileListTile(
                              iconUrl: 'assets/icons/act_set.svg',
                              title: 'Настройки',
                              onpress: () => Get.to(
                                () => Settings(),
                              ),
                            ),
                            ProfileListTile(
                              iconUrl: 'assets/icons/act_help.svg',
                              title: 'Помощь',
                              onpress: () => print('pressed'),
                            ),
                            ProfileListTile(
                              iconUrl: 'assets/icons/act_term.svg',
                              title: 'Условия использования',
                              onpress: () => print('pressed'),
                            ),
                            ProfileListTile(
                              iconUrl: 'assets/icons/act_locked.svg',
                              title: 'Политика конфиденциальности',
                              onpress: () => print('pressed'),
                            ),
                            ProfileListTile(
                              iconUrl: 'assets/icons/act_about.svg',
                              title: 'О приложении',
                              isDivider: false,
                              onpress: () => print('pressed'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      CutomeButton(
                        title: 'Редактировать',
                        onpress: () => Get.to(() => EditProfileScreen()),
                        buttonColor: ColorPalate.mainColor,
                        textColor: Colors.white,
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: TextButton.icon(
                          icon: SvgPicture.asset('assets/icons/logout.svg'),
                          onPressed: () {
                            print('pressedddd');
                            logOutDialog(context);
                            // AllServices.logout();
                          },
                          label: Text('Выйти',
                              style: FontStyles.semiBoldStyle(
                                fontSize: 20,
                                fontFamily: 'Lato',
                              )),
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
