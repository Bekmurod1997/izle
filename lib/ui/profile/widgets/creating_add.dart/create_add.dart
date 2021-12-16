import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' as g;
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/mask/mask_format.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/preview.dart';
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
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';

class CreatingAddScreen extends StatefulWidget {
  @override
  _CreatingAddScreenState createState() => _CreatingAddScreenState();
}

class _CreatingAddScreenState extends State<CreatingAddScreen> {
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();
  final UserInfoController userInfoController = Get.find<UserInfoController>();

  TextEditingController phoneNumber = TextEditingController();
  String phoneNumbeError = '';

  // bool _value = false;

  var _image;
  var imagePicker;
  // List<XFile> imageUrlObject = [];
  // List<String> imageUrlList = [];
  var limitSize = 0;

  @override
  void initState() {
    ;
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      imagePicker = new ImagePicker();
      userInfoController.fetchUserInfo(userToken: MyPref.token);
    });
  }

  // final ImagePicker _myPicker = ImagePicker();

  List<XFile>? _imageFileList = [];
  var removedIndex = 0;
  // dynamic _pickImageError;
  final ImagePicker _picker = ImagePicker();
  void selectImages() async {
    final List<XFile>? selectImages = await _picker.pickMultiImage();
    if (selectImages == null || selectImages.isEmpty) return;

    // _imageFileList.addAll(selectImages);

    print("Image list lengt" + selectImages.length.toString());
    setState(() {
      limitSize = selectImages.length > 8 ? 8 : selectImages.length;
    });
    var lim = 8 - creatingAddInfoController.images.length;
    // var realLimit = min(lim, selectImages.length);
    for (var i = 0; i < lim; i++) {
      // imageUrlObject.add(selectImages[i]);
      print('imaaaaaaa');
      //print(selectImages[removedIndex]);

      print('removedIndex value is');
      print(removedIndex);
      creatingAddInfoController.images.add(selectImages[i].path);
    }
    setState(() {
      removedIndex = creatingAddInfoController.images.length;
      print('after setState remove value is ');
      print(removedIndex);
    });

    // imageUrlList = imageUrlObject.map((e) => e.path).toList();
    print('this is imageUrlList');
    // print(imageUrlList);
    // print(imageUrlList[0]);
    // creatingAddInfoController.imagesChanger(imageUrlList);
    setState(() {});

    print('the length of controller image');
    print(creatingAddInfoController.images.length);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        creatingAddInfoController.resetAll();
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        // appBar: customAppBar1(
        //   context,
        //   title: '  Создать объявления  ',
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: g.Obx(() {
            if (userInfoController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: ColorPalate.mainColor,
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  CreatAppBar(),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        creatingAddInfoController.images.length > 0
                            ? Column(
                                children: [
                                  Container(
                                    height: 100,
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Stack(
                                            children: [
                                              Image.file(
                                                File(
                                                  creatingAddInfoController
                                                      .images[index],
                                                ),
                                                width: 50,
                                                // fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                right: 0,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    print('cancel pressed');

                                                    setState(() {
                                                      removedIndex--;
                                                      print(
                                                          'removedIndex in setSteate');
                                                      print(removedIndex);
                                                      // imageUrlObject
                                                      //     .removeAt(index);
                                                      // imageUrlList
                                                      //     .removeAt(index);

                                                      creatingAddInfoController
                                                          .images
                                                          .removeAt(index);
                                                      print(
                                                          creatingAddInfoController
                                                              .images.length);
                                                    });

                                                    // print(index);
                                                    // print(imageUrlList.length);
                                                  },
                                                  child: SvgPicture.asset(
                                                    'assets/icons/can.svg',
                                                    color:
                                                        ColorPalate.lightGreen,
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) =>
                                            SizedBox(width: 10),
                                        itemCount: creatingAddInfoController
                                            .images.length),
                                  ),
                                  SizedBox(height: 20),
                                  GestureDetector(
                                    onTap: () {
                                      creatingAddInfoController.images.length >
                                              7
                                          ? null
                                          : selectImages();
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: creatingAddInfoController
                                                      .images.length >
                                                  7
                                              ? Colors.grey
                                              : ColorPalate.lightGreen,
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        child: Text('Добавить еще фото')),
                                  ),
                                ],
                              )
                            : Container(
                                child: GestureDetector(
                                  onTap: () {
                                    print('pressssing');
                                    selectImages();
                                  },
                                  // onTap: () async {

                                  //   // selectImages();
                                  //   print('photo pressed');
                                  //   var source = ImageSource.gallery;
                                  //   XFile image = await imagePicker.pickImage(
                                  //     source: source,
                                  //     imageQuality: 50,
                                  //     // preferredCameraDevice: CameraDevice.front,
                                  //   );
                                  //   if (mounted)
                                  //     setState(() {
                                  //       _image = File(image.path);
                                  //     });
                                  //   // String fileName = image.path.split('/').last;

                                  //   creatingAddInfoController
                                  //       .mainPhotoChanger(image.path);
                                  // },
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
                                            SvgPicture.asset(
                                                'assets/icons/upload_f.svg'),
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

                        creatingAddInfoController.photoCheck.value == false &&
                                creatingAddInfoController.phCheck.value == true
                            ? Text('Вы не добавили фотографии ',
                                style: TextStyle(color: Colors.red))
                            : Container(),
                        CreateTitle(),
                        creatingAddInfoController.titleCheck.value == false &&
                                creatingAddInfoController.tCheck.value == true
                            ? Text(
                                'Не может быть короче 10 символов',
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
                        SizedBox(height: 13),
                        CategoryChoice(),
                        creatingAddInfoController.categoryCheck.value ==
                                    false &&
                                creatingAddInfoController.cCheck.value == true
                            ? Text(
                                'Поле обязательно для заполнения',
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
                        SizedBox(height: 13),
                        CreateDescription(),
                        creatingAddInfoController.descriptionCheck.value ==
                                    false &&
                                creatingAddInfoController.dCheck.value == true
                            ? Text(
                                'Не может быть короче 10 символов',
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
                        SizedBox(height: 13),
                        CreatePrice(),
                        // creatingAddInfoController.priceCheck.value == false &&
                        //         creatingAddInfoController.pCheck.value == true
                        //     ? Text(
                        //         'Пожалуйста, укажите цену',
                        //         style: TextStyle(color: Colors.red),
                        //       )
                        //     : Container(),
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
                                    creatingAddInfoController
                                            .locationInfo.value.isEmpty
                                        ? 'Вы не выбрали'
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
                        creatingAddInfoController.locationCheck.value ==
                                    false &&
                                creatingAddInfoController.lCheck.value == true
                            ? Text(
                                'Поле обязательно для заполнения',
                                style: TextStyle(color: Colors.red),
                              )
                            : Container(),
                        SizedBox(height: 13),
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
                        // UserInfo(
                        //     title: 'Электронная почта*',
                        //     userInfo: userInfoController
                        //         .fetchUserInfoList.first.email
                        //         .toString()),
                        // UserInfo(title: 'Телефон', userInfo: MyPref.phoneNumber
                        //     // userInfoController.fetchUserInfoList.first.phone
                        //     //     .toString(),
                        //     ),
                        Text(
                          'Телефон',
                          style: FontStyles.regularStyle(
                            fontSize: 16,
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
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                                keyboardType: TextInputType.phone,
                                inputFormatters: [InputMask.maskPhoneNumber],
                                controller: phoneNumber,
                                onChanged: (value) {
                                  print(value.length);
                                  creatingAddInfoController.phoneNumber.value =
                                      phoneNumber.text.replaceAll(' ', '');
                                  print(creatingAddInfoController
                                      .phoneNumber.value);
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none, hintText: '998'),
                                validator: (value) {}),
                          ),
                        ),
                        Text(
                          phoneNumbeError,
                          style: TextStyle(fontSize: 11, color: Colors.red),
                        ),

                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            if (phoneNumber.text.length < 16) {
                              setState(() {
                                phoneNumbeError =
                                    'Пожалуйста, проверьте свой номер телефона правильно';
                              });
                            }
                            if (phoneNumber.text.length == 16) {
                              setState(() {
                                phoneNumbeError = '';
                              });
                            }
                            print(creatingAddInfoController.title.value);
                            //title
                            creatingAddInfoController.title.value.isEmpty ||
                                    creatingAddInfoController
                                            .title.value.length <
                                        10
                                ? creatingAddInfoController.tCheck.value = true
                                : creatingAddInfoController.tCheck.value =
                                    false;

                            //category
                            creatingAddInfoController.mainCategory.value.isEmpty
                                ? creatingAddInfoController.cCheck.value = true
                                : creatingAddInfoController.cCheck.value =
                                    false;

                            //description
                            creatingAddInfoController
                                        .description.value.isEmpty ||
                                    creatingAddInfoController
                                            .description.value.length <
                                        10
                                ? creatingAddInfoController.dCheck.value = true
                                : creatingAddInfoController.dCheck.value =
                                    false;

                            //price
                            creatingAddInfoController.price.value == 0.0 &&
                                    creatingAddInfoController.type_ad.value ==
                                        'price'
                                ? creatingAddInfoController.pCheck.value = true
                                : creatingAddInfoController.pCheck.value =
                                    false;
                            //location
                            creatingAddInfoController.lat.value == 0.0
                                ? creatingAddInfoController.lCheck.value = true
                                : creatingAddInfoController.lCheck.value =
                                    false;

                            //photo
                            creatingAddInfoController.images.isEmpty
                                ? creatingAddInfoController.phCheck.value = true
                                : creatingAddInfoController.phCheck.value =
                                    false;
                            if (creatingAddInfoController
                                    .title.value.isNotEmpty &&
                                ((creatingAddInfoController.type_ad.value !=
                                        'price') ||
                                    (creatingAddInfoController
                                                .type_ad.value ==
                                            'price' &&
                                        creatingAddInfoController
                                                .price.value !=
                                            0.0)) &&
                                creatingAddInfoController
                                    .description.value.isNotEmpty &&
                                creatingAddInfoController
                                        .subCategoryId.value !=
                                    0 &&
                                // creatingAddInfoController.price.value != 0.0 &&
                                creatingAddInfoController.images.isNotEmpty &&
                                creatingAddInfoController
                                        .phoneNumber.value.length >
                                    11 &&
                                creatingAddInfoController
                                    .locationInfo.value.isNotEmpty &&
                                creatingAddInfoController.lat.value != 0.0 &&
                                creatingAddInfoController.long.value != 0.0) {
                              print(creatingAddInfoController
                                  .phoneNumber.value.length);
                              Get.to(() => PreviewScreen(
                                    typeAd:
                                        creatingAddInfoController.type_ad.value,
                                    imageList: creatingAddInfoController.images,
                                    lat: creatingAddInfoController.lat.value
                                        .toString(),
                                    lng: creatingAddInfoController.long.value
                                        .toString(),
                                    userName: userInfoController
                                        .fetchUserInfoList.first.name
                                        .toString(),
                                    datee: DateTime.now().toString(),
                                    titlee:
                                        creatingAddInfoController.title.value,
                                    addresss: creatingAddInfoController
                                        .locationInfo.value,
                                    categoryy: creatingAddInfoController
                                            .mainCategory.value +
                                        '/' +
                                        creatingAddInfoController
                                            .subCategory.value,
                                    descriptionn: creatingAddInfoController
                                        .description.value,
                                    pricee: creatingAddInfoController
                                        .price.value
                                        .toString(),
                                  ));
                            } else {
                              print(creatingAddInfoController
                                  .phoneNumber.value.length);
                              print(creatingAddInfoController.images.length);
                              print(creatingAddInfoController.title.value);
                              print(creatingAddInfoController
                                  .subCategoryId.value);
                              print(creatingAddInfoController.price.value);
                              print(creatingAddInfoController.type_ad.value);
                              print(
                                  creatingAddInfoController.locationInfo.value);
                              print(creatingAddInfoController.lat.value);
                              print(creatingAddInfoController.long.value);

                              print(
                                  creatingAddInfoController.phoneNumber.value);
                            }
                          },
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
                        GestureDetector(
                          onTap: () {
                            if (phoneNumber.text.length < 16) {
                              setState(() {
                                phoneNumbeError =
                                    'Пожалуйста, проверьте свой номер телефона правильно';
                              });
                            }
                            if (phoneNumber.text.length == 16) {
                              setState(() {
                                phoneNumbeError = '';
                              });
                            }
                            print(creatingAddInfoController.title.value);
                            //title
                            creatingAddInfoController.title.value.isEmpty ||
                                    creatingAddInfoController
                                            .title.value.length <
                                        10
                                ? creatingAddInfoController.tCheck.value = true
                                : creatingAddInfoController.tCheck.value =
                                    false;

                            //category
                            creatingAddInfoController.mainCategory.value.isEmpty
                                ? creatingAddInfoController.cCheck.value = true
                                : creatingAddInfoController.cCheck.value =
                                    false;

                            //description
                            creatingAddInfoController
                                        .description.value.isEmpty ||
                                    creatingAddInfoController
                                            .description.value.length <
                                        10
                                ? creatingAddInfoController.dCheck.value = true
                                : creatingAddInfoController.dCheck.value =
                                    false;

                            //price
                            creatingAddInfoController.price.value == 0.0 &&
                                    creatingAddInfoController.type_ad.value ==
                                        'price'
                                ? creatingAddInfoController.pCheck.value = true
                                : creatingAddInfoController.pCheck.value =
                                    false;
                            //location
                            creatingAddInfoController.lat.value == 0.0
                                ? creatingAddInfoController.lCheck.value = true
                                : creatingAddInfoController.lCheck.value =
                                    false;

                            //photo
                            creatingAddInfoController.images.value.isEmpty
                                ? creatingAddInfoController.phCheck.value = true
                                : creatingAddInfoController.phCheck.value =
                                    false;
                            if ((creatingAddInfoController
                                        .title.value.isNotEmpty &&
                                    creatingAddInfoController
                                            .title.value.length >
                                        9) &&
                                ((creatingAddInfoController.type_ad.value !=
                                        'price') ||
                                    (creatingAddInfoController.type_ad.value ==
                                            'price' &&
                                        creatingAddInfoController.price.value !=
                                            0.0)) &&
                                (creatingAddInfoController
                                        .description.value.isNotEmpty &&
                                    creatingAddInfoController
                                            .description.value.length >
                                        10) &&
                                creatingAddInfoController
                                        .subCategoryId.value !=
                                    0 &&
                                // creatingAddInfoController.price.value != 0.0 &&
                                creatingAddInfoController.images.isNotEmpty &&
                                creatingAddInfoController
                                        .phoneNumber.value.length >
                                    11 &&
                                creatingAddInfoController
                                    .locationInfo.value.isNotEmpty &&
                                creatingAddInfoController.lat.value != 0.0 &&
                                creatingAddInfoController.long.value != 0.0) {
                              print('++++++++');
                              print(creatingAddInfoController.title.value);
                              print(creatingAddInfoController
                                  .subCategoryId.value);
                              print(creatingAddInfoController.price.value);
                              print(
                                  creatingAddInfoController.locationInfo.value);
                              print(creatingAddInfoController.lat.value);
                              print(creatingAddInfoController.long.value);
                              print(creatingAddInfoController.type_ad.value);
                              print(creatingAddInfoController.images.length);
                              print('every thing is valid');

                              // creatingAddInfoController.isLoading.value == false
                              // ?
                              AllServices.createAd(context);
                              // : print('uploading');
                            } else {
                              print(creatingAddInfoController
                                  .phoneNumber.value.length);
                              print(creatingAddInfoController.images.length);
                              print(creatingAddInfoController.title.value);
                              print(creatingAddInfoController
                                  .subCategoryId.value);
                              print(creatingAddInfoController.price.value);
                              print(creatingAddInfoController.type_ad.value);
                              print(
                                  creatingAddInfoController.locationInfo.value);
                              print(creatingAddInfoController.lat.value);
                              print(creatingAddInfoController.long.value);

                              print(
                                  creatingAddInfoController.phoneNumber.value);
                              print(creatingAddInfoController.images.length);
                              print('some fileds are missing');

                              // print('this is imagggggg');
                              // print(creatingAddInfoController.images);
                              // for (var i = 0;
                              //     i < creatingAddInfoController.images.length;
                              //     i++) {
                              //   print(creatingAddInfoController.images[i]);
                              // }
                            }

                            // AllServices.createAd();
                            print('pressed');
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 17),
                            decoration: BoxDecoration(
                              color: ColorPalate.mainColor,
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child:
                                  // creatingAddInfoController.isLoading.value ==
                                  // true
                                  // ? CircularProgressIndicator(
                                  //     color: Colors.white,
                                  //   )
                                  // :
                                  Text(
                                'Опубликовать',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // CutomeButton(
                        //   title: 'Опубликовать',
                        //   onpress: () {
                        //     print(creatingAddInfoController.title.value);
                        //     //title
                        //     creatingAddInfoController.title.value.isEmpty ||
                        //             creatingAddInfoController
                        //                     .title.value.length <
                        //                 10
                        //         ? creatingAddInfoController.tCheck.value = true
                        //         : creatingAddInfoController.tCheck.value =
                        //             false;

                        //     //category
                        //     creatingAddInfoController.mainCategory.value.isEmpty
                        //         ? creatingAddInfoController.cCheck.value = true
                        //         : creatingAddInfoController.cCheck.value =
                        //             false;

                        //     //description
                        //     creatingAddInfoController
                        //                 .description.value.isEmpty ||
                        //             creatingAddInfoController
                        //                     .description.value.length <
                        //                 10
                        //         ? creatingAddInfoController.dCheck.value = true
                        //         : creatingAddInfoController.dCheck.value =
                        //             false;

                        //     //price
                        //     creatingAddInfoController.price.value == 0.0 &&
                        //             creatingAddInfoController.type_ad.value ==
                        //                 'price'
                        //         ? creatingAddInfoController.pCheck.value = true
                        //         : creatingAddInfoController.pCheck.value =
                        //             false;
                        //     //location
                        //     creatingAddInfoController.lat.value == 0.0
                        //         ? creatingAddInfoController.lCheck.value = true
                        //         : creatingAddInfoController.lCheck.value =
                        //             false;

                        //     //photo
                        //     creatingAddInfoController.images.value.isEmpty
                        //         ? creatingAddInfoController.phCheck.value = true
                        //         : creatingAddInfoController.phCheck.value =
                        //             false;
                        //     if (creatingAddInfoController
                        //             .title.value.isNotEmpty &&
                        //         !(creatingAddInfoController
                        //                     .type_ad.value ==
                        //                 'price' &&
                        //             creatingAddInfoController
                        //                     .price.value ==
                        //                 0.0) &&
                        //         creatingAddInfoController
                        //                 .title.value.length >
                        //             10 &&
                        //         creatingAddInfoController
                        //             .description.value.isNotEmpty &&
                        //         creatingAddInfoController
                        //                 .description.value.length >
                        //             10 &&
                        //         creatingAddInfoController.subCategoryId.value !=
                        //             1 &&
                        //         creatingAddInfoController.lat.value != 0.0) {
                        //       print('++++++++');
                        //       print(creatingAddInfoController.title.value);
                        //       print(creatingAddInfoController
                        //           .subCategoryId.value);
                        //       print(creatingAddInfoController.price.value);
                        //       print(creatingAddInfoController.type_ad.value);

                        //       AllServices.createAd();
                        //     } else {
                        //       print('-----');
                        //       print(creatingAddInfoController.title.value);
                        //       print(
                        //           creatingAddInfoController.mainCategory.value);
                        //       print(creatingAddInfoController.price.value);
                        //       print(
                        //           creatingAddInfoController.description.value);
                        //       print(creatingAddInfoController.type_ad.value);
                        //       print('some fileds are missing');

                        //       print('every thing is valid');
                        //       // print('this is imagggggg');
                        //       // print(creatingAddInfoController.images);
                        //       // for (var i = 0;
                        //       //     i < creatingAddInfoController.images.length;
                        //       //     i++) {
                        //       //   print(creatingAddInfoController.images[i]);
                        //       // }
                        //     }

                        //     AllServices.createAd();
                        //     print('pressed');
                        //   },
                        //   buttonColor: ColorPalate.mainColor,
                        //   textColor: Colors.white,
                        // ),

                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),

        // bottomNavigationBar: CustomBottomNavBar(),
      ),
    );
  }
}
