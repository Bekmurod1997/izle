import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' as g;
import 'package:http/http.dart' as http;
import 'package:izle/constants/api.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/ui/components/custom_bottomNavbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/appbar.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/category_choice.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/description.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/map_screen.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/price.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/title.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/user_info.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class CreatingAddScreen extends StatefulWidget {
  @override
  _CreatingAddScreenState createState() => _CreatingAddScreenState();
}

class _CreatingAddScreenState extends State<CreatingAddScreen> {
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();
  final UserInfoController userInfoController = Get.find<UserInfoController>();

  int selectedIndex = 0;
  bool status1 = false;
  // bool _value = false;
  int val = -1;

  // Future getUserImage() async {
  //   final pickedUserImage =
  //       await userImagePicker.getImage(source: ImageSource.gallery);
  //   setState(() {
  //     if (pickedUserImage != null) {
  //       _userImage = File(pickedUserImage.path);
  //     } else {
  //       print('No Image Selected');
  //     }
  //   });
  // }
  var _image;
  var imagePicker;

  @override
  void initState() {
    imagePicker = new ImagePicker();
    userInfoController.fetchUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        // appBar: customAppBar1(
        //   context,
        //   title: '  Создать объявления  ',
        // ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CreatAppBar(),
                  Container(
                    child: GestureDetector(
                      onTap: () async {
                        print('photo pressed');
                        var source = ImageSource.gallery;
                        XFile image = await imagePicker.pickImage(
                          source: source,
                          imageQuality: 50,
                          // preferredCameraDevice: CameraDevice.front,
                        );
                        setState(() {
                          _image = File(image.path);
                        });
                      },
                      child: _image != null
                          ? Image.file(
                              _image,
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.fitHeight,
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset('assets/icons/upload_f.svg'),
                                Text('Добавить фото',
                                    style: FontStyles.semiBoldStyle(
                                      fontSize: 24,
                                      fontFamily: 'Lato',
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                    ),
                    width: double.infinity,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/wallet.png',
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  CreateTitle(),
                  CategoryChoice(),
                  CreateDescription(),
                  CreatePrice(),
                  Center(
                    child: Text(
                      'Ваши контактные данные',
                      style: FontStyles.regularStyle(
                        fontSize: 20,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Местоположения*',
                    style: FontStyles.regularStyle(
                        fontSize: 16, fontFamily: 'Lato'),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => Get.to(() => MapScreen()),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            creatingAddInfoController.locationInfo.value ==
                                    'nowhere'
                                ? 'Ташкент, Учтепинский район'
                                : creatingAddInfoController.locationInfo.value,
                          ),
                          SvgPicture.asset('assets/icons/next-icon.svg'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  ////////////////////////////////
                  ////////////////////////////////
                  //checking for null name //////
                  ////////////////////////////////
                  ////////////////////////////////
                  if (userInfoController.fetchUserInfoList.first.name != null)
                    UserInfo(title: 'Контактное лицо*', userInfo: 'Азиз'),
                  ////////////////////////////////
                  ////////////////////////////////
                  //checking for null email //////
                  ////////////////////////////////
                  ////////////////////////////////
                  if (userInfoController.fetchUserInfoList.first.name != null)
                    UserInfo(
                        title: 'Электронная почта*',
                        userInfo: 'azizakbarov@gmail.com'),
                  UserInfo(
                      title: 'Телефон',
                      userInfo: '+' +
                          userInfoController.fetchUserInfoList.first.phone
                              .toString()),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () => g.Get.back(),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                          color: ColorPalate.mainPageColor,
                          borderRadius: new BorderRadius.circular(
                            10.0,
                          ),
                          border: Border.all(
                            color: ColorPalate.mainColor,
                            width: 2,
                          )),
                      child: Center(
                        child: Text(
                          'Предпросмотр',
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorPalate.mainColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CutomeButton(
                    title: 'Опубликовать',
                    onpress: () async {
                      print('pressed');
                      var client = http.Client();
                      try {
                        var response =
                            await client.get(Uri.parse(ApiUrl.listOfAllAds));
                        if (response.statusCode == 200) {
                          print('success in creating ads');
                          print(response.body);
                        }
                      } catch (e) {
                        print('error in creating adds');
                        print(e);
                      }
                    },
                    buttonColor: ColorPalate.mainColor,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
