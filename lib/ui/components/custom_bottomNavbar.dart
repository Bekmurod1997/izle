import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/controller/page_navgation_controller.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  // ignore: unused_field
  int _selectedIndex = 0; //New

  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();

  void _onItemTapped(int index) {
    pageNavigationController.pageControler.value = index;
    setState(() {
      _selectedIndex = index;
    });
    pageNavigationController.tabIndex.value = index;
  }

  Widget _buildIcon(
    String iconUrl,
    String text,
    int index, [
    Color iconColor = Colors.white,
  ]) =>
      Container(
        // height: 45,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          // color: index == 0 ? _getBgColor(index) : ColorPalate.mainColor,
          child: InkWell(
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Icon(iconData),
                    SvgPicture.asset(
                      iconUrl,
                      color: iconColor,
                      fit: BoxFit.contain,
                      height: 25,
                    ),
                    SizedBox(height: 3),
                    Text(
                      text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: pageNavigationController.tabIndex.value == index
                            ? ColorPalate.mainColor
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                _onItemTapped(index);
                if (index == 0) {
                  // Get.offAll(() => NavScreen());
                  pageNavigationController.pageControllerChanger(0);
                  creatingAddInfoController.resetAll();
                } else if (index == 1) {
                  // Get.offAll(() => AllCategoryScreen());
                  pageNavigationController.pageControllerChanger(1);
                  creatingAddInfoController.resetAll();
                } else if (index == 2) {
                  // Get.offAll(
                  //   () =>
                  //       MyPref.token == '' ? AuthScreen() : CreatingAddScreen(),
                  // );
                  pageNavigationController.pageControllerChanger(2);
                } else if (index == 3) {
                  // Get.offAll(() => MessageScreen());
                  pageNavigationController.pageControllerChanger(3);
                  creatingAddInfoController.resetAll();
                } else if (index == 4) {
                  // Get.offAll(() => ActiveProfileScreen());
                  pageNavigationController.pageControllerChanger(4);
                }
              }),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        child: BottomNavigationBar(
          selectedFontSize: 0,

          // unselectedItemColor: Colors.white,
          // fixedColor: Colors.white,
          selectedLabelStyle: TextStyle(color: Colors.red),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: pageNavigationController.pageControler.value, //New
          onTap: _onItemTapped,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.yellow,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/icons/home3.svg',
                'mainPage'.tr,
                0,
                pageNavigationController.tabIndex.value == 0
                    ? ColorPalate.mainColor
                    : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/icons/1.svg',
                'category'.tr,
                1,
                pageNavigationController.tabIndex.value == 1
                    ? ColorPalate.mainColor
                    : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/icons/sozdat.svg',
                'create'.tr,
                2,
                pageNavigationController.tabIndex.value == 2
                    ? ColorPalate.mainColor
                    : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/icons/coolicon.svg',
                'message'.tr,
                3,
                pageNavigationController.tabIndex.value == 3
                    ? ColorPalate.mainColor
                    : Colors.grey,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/icons/profile_active.svg',
                'profile'.tr,
                4,
                pageNavigationController.tabIndex.value == 4
                    ? ColorPalate.mainColor
                    : Colors.grey,
              ),
              label: '',
            ),
          ],
        ),
      );
    });
  }
}
