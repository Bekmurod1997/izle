import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' as g;
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/services/all_services.dart';
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
import 'package:izle/utils/my_prefs.dart';

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

  var _image;
  var imagePicker;
  List<String> imageUrl = [];
  @override
  void initState() {
    // imagePicker = new ImagePicker();
    // userInfoController.fetchUserInfo();
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // executes after build
      imagePicker = new ImagePicker();
      userInfoController.fetchUserInfo(userToken: MyPref.token);
    });
  }

  // final ImagePicker _myPicker = ImagePicker();
  // List<XFile>? _imageFileList = [];
  // dynamic _pickImageError;
  // final ImagePicker _picker = ImagePicker();
  // void selectImages() async {
  //   final List<XFile>? selectImages = await _picker.pickMultiImage();
  //   if (selectImages!.isNotEmpty) {
  //     _imageFileList!.addAll(selectImages);
  //   }
  //   print("Image list lengt" + _imageFileList!.length.toString());
  //   for (var i = 0; i < _imageFileList!.length; i++) {
  //     imageUrl.add('${_imageFileList![i].path}');
  //   }
  //   creatingAddInfoController.imagesChanger(imageUrl);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      // appBar: customAppBar1(
      //   context,
      //   title: '  Создать объявления  ',
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: SingleChildScrollView(child: g.Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              CreatAppBar(),

              // ElevatedButton(
              //   child: Text("Pick images"),
              //   onPressed: () {
              //     selectImages();
              //   },
              // ),

              // Container(
              //   height: 100,
              //   width: double.infinity,
              //   child: ListView.separated(
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Image.file(
              //             File(_imageFileList![index].path));
              //       },
              //       separatorBuilder: (context, index) =>
              //           SizedBox(width: 30),
              //       itemCount: _imageFileList!.length),
              // ),

              // if (_imageFileList!.isEmpty)

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      child: GestureDetector(
                        onTap: () async {
                          // selectImages();
                          print('photo pressed');
                          var source = ImageSource.gallery;
                          XFile image = await imagePicker.pickImage(
                            source: source,
                            imageQuality: 50,
                            // preferredCameraDevice: CameraDevice.front,
                          );
                          if (mounted)
                            setState(() {
                              _image = File(image.path);
                            });
                          // String fileName = image.path.split('/').last;

                          creatingAddInfoController
                              .mainPhotoChanger(image.path);
                        },
                        child: _image != null
                            ? Image.file(
                                _image,
                                width: 200.0,
                                height: 200.0,
                                fit: BoxFit.fitHeight,
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                            Flexible(
                              child: Text(
                                creatingAddInfoController.locationInfo.value ==
                                        'nowhere'
                                    ? 'Ташкент, Учтепинский район'
                                    : creatingAddInfoController
                                        .locationInfo.value,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
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
                    // if (userInfoController.fetchUserInfoList.first.name != null)
                    // UserInfo(
                    //   title: 'Контактное лицо*', userInfo: MyPref.userName,
                    //   // '${userInfoController.fetchUserInfoList.first.name}',
                    // ),
                    ////////////////////////////////
                    ////////////////////////////////
                    //checking for null email //////
                    ////////////////////////////////
                    ////////////////////////////////
                    // if (userInfoController.fetchUserInfoList.first.name != null)
                    UserInfo(
                        title: 'Электронная почта*',
                        userInfo: 'azizakbarov@gmail.com'),
                    UserInfo(title: 'Телефон', userInfo: MyPref.phoneNumber
                        // userInfoController.fetchUserInfoList.first.phone
                        //     .toString(),
                        ),
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
                      onpress: () {
                        print(_image);
                        // print(creatingAddInfoController.images);
                        // List imageeeee = [];
                        // for (var i = 0; i < imageUrl.length; i++) {
                        //   print(imageUrl[i]);
                        //   imageeeee.addAll([
                        //     'gallery[$i], ',
                        //   ]);
                        //   print(imageeeee[i]);
                        //   print('--------');
                        //   print(creatingAddInfoController.images[i].toString());
                        // }

                        AllServices.createAd();
                        print('pressed');
                      },
                      buttonColor: ColorPalate.mainColor,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          );
        })),
      ),

      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
