import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/ui/category/all_category_screen.dart';
import 'package:izle/ui/components/custom_bottomNavbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/ui/auth/auth_screen.dart';
import 'package:izle/ui/home/home_screen.dart';
import 'package:izle/ui/message/message_screen.dart';
import 'package:izle/ui/message/unauth_message.dart';
import 'package:izle/ui/profile/active_profile.dart';
import 'package:izle/ui/profile/profile_screen.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/create_add.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NavScreen extends StatefulWidget {
  final String? messageType;
  NavScreen({this.messageType});

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();
  // ignore: unused_field
  int _selectedIndex = 0;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late AndroidNotificationChannel channel;

  // ignore: unused_field
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  List tabContents = [
    // HomeScreen2(),
    HomeScreen(),
    AllCategoryScreen(),
    MyPref.token == '' ? AuthScreen() : CreatingAddScreen(),
    MyPref.token == '' ? UnAuthMessageScreen() : MessageScreen(''),
    MyPref.token == '' ? ProfileScreen() : ActiveProfileScreen(),
  ];
  late int activeTabIndex;
  @override
  void initState() {
    print('my fcm token is');
    print(MyPref.fcmToken);
    activeTabIndex = 0;
    MyPref.loginLanding = 'isset';
    _firebaseMessaging.getNotificationSettings();
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        badge: true, alert: true, sound: true);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // if (notification != null && android != null) {
      //   flutterLocalNotificationsPlugin.show(
      //     notification.hashCode,
      //     notification.title,
      //     notification.body,
      //     NotificationDetails(
      //       android: AndroidNotificationDetails(
      //         channel.id,
      //         channel.name,

      //         // TODO add a proper drawable resource to android, for now using
      //         //      one that already exists in example app.
      //         icon: 'launch_background',
      //       ),
      //     ),
      //   );
      // }
      print('navvvvv');
      print(message.notification!.title);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage messag) {
      // Get.to(
      //   () => MyPref.token == '' ? UnAuthMessageScreen() : MessageScreen(''),
      // );
      pageNavigationController.pageControllerChanger(3);
      pageNavigationController.tabIndexChanger(3);
    });

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
    return WillPopScope(
      onWillPop: () async {
        creatingAddInfoController.resetAll();
        return true;
      },
      child: Obx(() {
        return Scaffold(
          backgroundColor: ColorPalate.mainPageColor,
          body: tabContents[pageNavigationController.pageControler.value],
          // child: HomeScreen(),

          bottomNavigationBar: CustomBottomNavBar(),
        );
      }),
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
