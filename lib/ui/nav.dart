import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/ui/category/all_category_screen.dart';
import 'package:izle/ui/components/custom_bottomNavbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/ui/auth/auth_screen.dart';
import 'package:izle/ui/favorites/favorite_screen.dart';
import 'package:izle/ui/home/home_screen.dart';
import 'package:izle/ui/message/message_screen.dart';
import 'package:izle/ui/profile/active_profile.dart';
import 'package:izle/ui/profile/profile_screen.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/create_add.dart';
import 'package:izle/utils/my_prefs.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  // ignore: unused_field
  int _selectedIndex = 0;
  // ignore: unused_field
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  List tabContents = [
    HomeScreen(),
    AllCategoryScreen(),
    MyPref.token == '' ? AuthScreen() : CreatingAddScreen(),
    MessageScreen(),
    MyPref.token == '' ? ProfileScreen() : ActiveProfileScreen(),
  ];
  late int activeTabIndex;
  @override
  void initState() {
    activeTabIndex = 0;
    print('tokeeen in nav');
    print(MyPref.token);
    super.initState();
  }

  void onTabPress(int tabIndex) {
    setState(() {
      activeTabIndex = tabIndex;
    });
  }

  void onPageChange(int tabIndex) {
    setState(() {
      activeTabIndex = tabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      body: Obx(() {
        return tabContents[pageNavigationController.pageControler.value];
        // child: HomeScreen(),
      }),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }

  // Widget bottomNavigationBar() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 15, horizontal: 21),
  //     width: MediaQuery.of(context).size.width,
  //     decoration: BoxDecoration(
  //       color: Color(0xff038992),
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(15),
  //         topRight: Radius.circular(15),
  //       ),
  //     ),
  //     child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
  //       GestureDetector(
  //         child: SvgPicture.asset(
  //           activeTabIndex == 0
  //               ? 'assets/icons/home_active.svg'
  //               : 'assets/icons/home.svg',
  //         ),
  //         onTap: () => onTabPress(0),
  //       ),
  //       GestureDetector(
  //         child: SvgPicture.asset(
  //           activeTabIndex == 1
  //               ? 'assets/icons/favorite_active.svg'
  //               : 'assets/icons/favorite.svg',
  //         ),
  //         onTap: () => onTabPress(1),
  //       ),
  //       GestureDetector(
  //         child: SvgPicture.asset(
  //           activeTabIndex == 2
  //               ? 'assets/icons/add3.svg'
  //               : 'assets/icons/add3.svg',
  //         ),
  //         onTap: () => onTabPress(2),
  //       ),
  //       GestureDetector(
  //         child: SvgPicture.asset(
  //           activeTabIndex == 3
  //               ? 'assets/icons/sms_active.svg'
  //               : 'assets/icons/sms.svg',
  //         ),
  //         onTap: () => onTabPress(3),
  //       ),
  //       GestureDetector(
  //         child: SvgPicture.asset(
  //           activeTabIndex == 4
  //               ? 'assets/icons/profile_active.svg'
  //               : 'assets/icons/profile.svg',
  //         ),
  //         onTap: () => onTabPress(4),
  //       ),
  //       GestureDetector(
  //         child: SvgPicture.asset(
  //           activeTabIndex == 5
  //               ? 'assets/icons/profile_active.svg'
  //               : 'assets/icons/profile.svg',
  //           color: Colors.purple,
  //         ),
  //         onTap: () => onTabPress(5),
  //       ),
  //     ]),
  //   );
  // }

}
