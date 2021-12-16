import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/controller/my_ads_active_controller.dart';
import 'package:izle/controller/my_ads_inactive_controller.dart';
import 'package:izle/controller/my_ads_onmoderation_controller.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/main.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/components/profile_listTile.dart';
import 'package:izle/ui/favorites/favorite_screen.dart';
import 'package:izle/ui/message/message_screen.dart';
import 'package:izle/ui/photo_example.dart';
import 'package:izle/ui/profile/widgets/adds/%20non_active_ads.dart';
import 'package:izle/ui/profile/widgets/adds/active_adds.dart';
import 'package:izle/ui/profile/widgets/adds/moderation.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/create_add.dart';
import 'package:izle/ui/profile/widgets/settings/edit_profie.dart';
import 'package:izle/ui/profile/widgets/settings/settings.dart';
import 'package:izle/ui/profile/widgets/wallet/fill_up_wallet.dart';
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

  final MyAdsActiveController myAdsActiveController =
      Get.put(MyAdsActiveController());
  final MyAdsInActiveController myAdsInActiveController =
      Get.put(MyAdsInActiveController());
  final MyAdsOnModerationController myAdsOnModerationController =
      Get.put(MyAdsOnModerationController());
  static PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  int nonActiveAds = 0;

  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      print('this is my password');
      print(MyPref.password);
      print(MyPref.phoneNumber);
      myAdsActiveController.fetchMyActiveOrders();
      myAdsInActiveController.fetchMyInActiveOrders();
      myAdsOnModerationController.fetchMyOnModerationOrders();

      ffff();
    });

    super.initState();
  }

  void ffff() async {
    await userInfoController.fetchUserInfo(userToken: MyPref.token);
    print('ss');

    if (userInfoController.fetchUserInfoList.first.name ==
        userInfoController.fetchUserInfoList.first.phone) {
      myModal();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE5E5E5),
        body: Obx(() {
          if (userInfoController.isLoading.value &&
              myAdsInActiveController.isLoading.value &&
              myAdsOnModerationController.isLoading.value &&
              myAdsActiveController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: ColorPalate.mainColor,
              ),
            );
          } else {
            int? balance;
            if (userInfoController.fetchUserInfoList.isNotEmpty) {
              balance = userInfoController.fetchUserInfoList.first.balance;
            } else {
              balance = 0;
            }

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
                    padding:
                        const EdgeInsets.only(top: 15, bottom: 15, left: 20),
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
                              // 'user',
                              //   userInfoController.fetchUserInfoList.first.name
                              // :
                              // 'a',
                              MyPref.userName,
                              style: FontStyles.semiBoldStyle(
                                fontSize: 22,
                                fontFamily: 'Lato',
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(right: 10, bottom: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Ваш кошелек: ${balance ?? '0'}',
                                    // +
                                    // userInfoController
                                    //     .fetchUserInfoList.first.balance
                                    //     .toString(),
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white70),
                                  ),
                                  // Text(userInfoController
                                  //     .fetchUserInfoList.first.balance
                                  //     .toString()),
                                  SizedBox(width: 5),
                                  GestureDetector(
                                    onTap: () => Get.to(() => WalletInstruction(
                                          balance: balance ?? 0,
                                        )),
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
                            GestureDetector(
                              onTap: () => Get.to(() => EditProfileScreen()),
                              child: Text(
                                'Редактировать профиль',
                                style: FontStyles.regularStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    color: Colors.white70),
                              ),
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
                      onpress: () => Get.to(() => CreatingAddScreen()),
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
                      onpress: () => Get.to(() => FillUpWallet()),
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
                                isAmount: true,
                                amount:
                                    '${myAdsInActiveController.allMyAdsList().data?.length ?? 0}',
                                iconUrl: 'assets/icons/act_no1.svg',
                                title: 'Неактивные ',
                                onpress: () => Get.to(
                                  () => NonActiveAdsScreen(),
                                ),
                              ),
                              ProfileListTile(
                                isAmount: true,
                                amount:
                                    '${myAdsOnModerationController.allMyAdsList().data?.length ?? 0}',
                                iconUrl: 'assets/icons/act_no1.svg',
                                title: 'На модерации ',
                                onpress: () => Get.to(
                                  () => Moderation(),
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
                                  () => MessageScreen(''),
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
                                  () => WalletScreen(balance: balance ?? 0),
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
                                  onpress: () => print('ss')),
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
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: Text('Xотите выйти'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Get.back(),
                                            child: Text('Нет'),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              await AllServices.logout();

                                              print('fff');
                                            },
                                            child: Text('Да'),
                                          ),
                                        ],
                                        // content: Text('This is my content'),
                                      ));
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
        }));
  }

  void myModal() {
    TextEditingController nameController = TextEditingController();
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              backgroundColor: ColorPalate.mainPageColor,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Пожалуйста, введите Ваше имя'),
                  SizedBox(height: 20),
                  Container(
                    // margin: const EdgeInsets.only(left: 0, right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Имя'),
                      ),
                    ),
                  ),
                ],
              ),
              // title: Text(
              // //   'Пожалуйста, введите ваш адрес электронной почты',
              // //   style: TextStyle(fontSize: 16),
              // // ),

              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: Text('Отменить'),
                ),
                TextButton(
                  onPressed: () async {
                    print('pressed yes');
                    await AllServices.editName(
                        // password: emailController.text,
                        name: nameController.text);

                    // await Get.offAll(() => NavScreen());
                    // pageNavigationController.pageControllerChanger(4);
                    // pageNavigationController.tabIndexChanger(4);
                  },
                  child: Text('Редактировать'),
                ),
              ],
              // content: Text('This is my content'),
            ));
  }
}
