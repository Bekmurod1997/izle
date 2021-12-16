import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as g;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/creating_add_info_controller.dart';
import 'package:izle/mask/mask_format.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/ui/edit_product/widget/app_bar_edit.dart';
import 'package:izle/ui/edit_product/widget/edit_category_choice.dart';
import 'package:izle/ui/edit_product/widget/edit_price.dart';
import 'package:izle/ui/edit_product/widget/edit_product_description.dart';
import 'package:izle/ui/edit_product/widget/edit_title.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/preview.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/map_screen.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/user_info.dart';
import 'package:izle/utils/my_prefs.dart';
import 'package:http/http.dart' as http;

class EditProductSceen extends StatefulWidget {
  final List<String>? imageGallry;
  final int? id;
  final String? type_ad;
  final String? title;
  final String? imageUrl;
  final String? category;
  final int? categoryId;
  final String? description;
  final String? type;
  final String? locationTitle;
  final String? userName;
  final String? email;
  final String? price;
  final String? lat;
  final String? long;
  final String? dateTime;
  final String? phoneNumber;
  final String? content;
  // final int status;
  EditProductSceen({
    this.id,
    this.type_ad,
    this.title,
    this.imageGallry,
    this.price,
    this.categoryId,
    this.category,
    this.description,
    this.email,
    this.imageUrl,
    this.locationTitle,
    this.phoneNumber,
    this.dateTime,
    this.type,
    this.userName,
    this.content,
    this.lat,
    this.long,
    // required this.status,
  });
  @override
  _EditProductSceenState createState() => _EditProductSceenState();
}

class _EditProductSceenState extends State<EditProductSceen> {
  var _image;
  var imagePicker;
  // List<XFile> imageUrlObject = [];
  // List<String> imageUrlList = [];
  final CreatingAddInfoController creatingAddInfoController =
      Get.find<CreatingAddInfoController>();

  TextEditingController phoneNumber = TextEditingController();
  String phoneNumbeError = '';
  List<String> toContain = [];
  bool circularLoader = true;
  @override
  void initState() {
    // creatingAddInfoController.images.value = widget.imageGallry!;
    // creatingAddInfoController.images.value = widget.imageGallry!;
    print('the length of ');
    print(creatingAddInfoController.images.length);
    creatingAddInfoController.titleChanger(titlee: widget.title);
    creatingAddInfoController.descriptionChanger(
        descriptionn: '${widget.content}');
    // creatingAddInfoController.typeIdChanger(int.parse(widget.type!));
    creatingAddInfoController.lat.value = double.parse(widget.lat!);
    creatingAddInfoController.long.value = double.parse(widget.long!);
    creatingAddInfoController.priceChanger(double.parse(widget.price!));
    creatingAddInfoController.locationInfoChanger(widget.locationTitle!);
    creatingAddInfoController.type_ad.value = widget.type_ad!;
    creatingAddInfoController.phoneNumber.value = widget.phoneNumber!;

    setState(() {
      phoneNumber.text = widget.phoneNumber!;
    });

    print('the phone number');
    print(widget.phoneNumber);
    print('controller value');
    print(phoneNumber.text);

    creatingAddInfoController.subCategoryId.value = widget.categoryId!;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      imagePicker = new ImagePicker();
    });
    // creatingAddInfoController.landAndLongChanger(
    //     double.parse('${widget.lat}'), double.parse(widget.long!));
    toSort();

    super.initState();
  }

  void toSort() async {
    for (var image in widget.imageGallry!) {
      var newImage = await networkImageToBase64(image);
      if (newImage != null) {
        creatingAddInfoController.images.add(newImage);
        myNewImagesBytes.add(newImage);
        toContain.add(newImage);
        print(creatingAddInfoController.images.length);
      }
    }
    setState(() {
      circularLoader = false;
    });
    print('the first element');

    print(creatingAddInfoController.images);
    // print(myNewImagesBytes);
    // print(myNewImagesBytes.length);
  }

  Future<String?> networkImageToBase64(String imageUrl) async {
    http.Response response =
        await http.get(Uri.parse('http://izle.uz/' + imageUrl));
    final Uint8List? bytes = response.bodyBytes;
    return (bytes != null ? base64Encode(bytes) : null);
  }

  List<String> myNewImagesBytes = [];

  final ImagePicker _picker = ImagePicker();
  var removedIndex = 0;
  var limitSize = 0;

  void selectImages() async {
    final List<XFile>? selectImages = await _picker.pickMultiImage();
    if (selectImages == null || selectImages.isEmpty) return;

    // _imageFileList.addAll(selectImages);

    print("Image list lengt" + selectImages.length.toString());
    setState(() {
      limitSize = selectImages.length > 8 ? 8 : selectImages.length;
    });
    var lim = 8 - widget.imageGallry!.length;
    var realLimit = min(lim, selectImages.length);
    for (var i = 0; i < realLimit; i++) {
      // imageUrlObject.add(selectImages[i]);
      print('imaaaaaaa');
      //print(selectImages[removedIndex]);

      print('removedIndex value is');
      print(removedIndex);
      creatingAddInfoController.images.add(selectImages[i].path);
      setState(() {
        widget.imageGallry?.add(selectImages[i].path);
        toContain.add(selectImages[i].path);
      });
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
  // void selectImages() async {
  //   final List<XFile>? selectImages = await _picker.pickMultiImage();
  //   if (selectImages == null || selectImages.isEmpty) return;

  //   // _imageFileList.addAll(selectImages);

  //   print("Image list lengt" + selectImages.length.toString());
  //   for (var i = 0; i < selectImages.length; i++) {
  //     imageUrlObject.add(selectImages[i]);
  //     print('imaaaaaaa');
  //     print(selectImages[i]);
  //   }
  //   // imageUrlObject=await Future.wait( imageUrlObject.map((e) async=> {
  //   // var bytes= await File(e.path).readAsBytes();
  //   // e.bytes=bytes
  //   // return e
  //   // }
  //   // )).asStream().toList();
  //   imageUrlList = imageUrlObject.map((e) => e.path).toList();
  //   print('this is imageUrlList');
  //   print(imageUrlList);
  //   print(imageUrlList[0]);
  //   creatingAddInfoController.imagesChanger(imageUrlList);
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        creatingAddInfoController.resetAll();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorPalate.mainPageColor,
          automaticallyImplyLeading: false,
          title: Text('Редактировать', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        backgroundColor: ColorPalate.mainPageColor,
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: circularLoader == true
                ? Center(
                    child:
                        CircularProgressIndicator(color: ColorPalate.mainColor))
                : Obx(
                    () => SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 100,
                            child: ListView.separated(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) => Stack(
                                      children: [
                                        toContain[index].endsWith('jpg') ||
                                                toContain[index]
                                                    .endsWith('png') ||
                                                toContain[index]
                                                    .endsWith('jpeg')
                                            ? Image.file(
                                                File(toContain[index]),
                                              )
                                            : Image.network('http://izle.uz/' +
                                                widget.imageGallry![index]
                                                    .toString()),
                                        Positioned(
                                            right: 0,
                                            child: GestureDetector(
                                                onTap: () {
                                                  print('delete pressed');
                                                  setState(() {
                                                    widget.imageGallry!
                                                        .removeAt(index);
                                                    myNewImagesBytes
                                                        .removeAt(index);
                                                  });
                                                  creatingAddInfoController
                                                      .images
                                                      .remove(index);
                                                  print(widget
                                                      .imageGallry!.length);
                                                  print(
                                                      myNewImagesBytes.length);
                                                },
                                                child: SvgPicture.asset(
                                                    'assets/icons/can.svg')))
                                      ],
                                    ),
                                separatorBuilder: (context, index) =>
                                    SizedBox(width: 20),
                                itemCount:
                                    creatingAddInfoController.images.length),
                          ),
                          SizedBox(height: 20),

                          // Text(creatingAddInfoController.images[0]),

                          GestureDetector(
                            onTap: () {
                              widget.imageGallry!.length > 7
                                  ? null
                                  : selectImages();
                            },
                            child: Center(
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                          ),
                          EditTitle(
                            title: '${widget.title}',
                          ),

                          EditCategoryChoice(category: '${widget.category}'),
                          EditCreateDescription(content: '${widget.content}'),
                          EditPrice(
                            price: '${widget.price}',
                            type_ad: '${widget.type_ad}',
                          ),
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
                            onTap: () => g.Get.to(() => MapScreen()),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 17, vertical: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      // creatingAddInfoController.locationInfo.value ==
                                      //         'nowhere'
                                      // ?
                                      '${widget.locationTitle}',
                                      // : creatingAddInfoController.locationInfo.value,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                      'assets/icons/next-icon.svg'),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          UserInfo(
                            title: 'Контактное лицо*',
                            userInfo: '${widget.userName}',
                            // '${userInfoController.fetchUserInfoList.first.name}',
                          ),
                          // UserInfo(
                          //     title: 'Электронная почта*', userInfo: '${widget.email}'),
                          // UserInfo(title: 'Телефон', userInfo: '+' + '${widget.phoneNumber}'
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
                                    creatingAddInfoController
                                            .phoneNumber.value =
                                        phoneNumber.text.replaceAll(' ', '');
                                    print(creatingAddInfoController
                                        .phoneNumber.value);
                                  },
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '998'),
                                  validator: (value) {}),
                            ),
                          ),
                          SizedBox(height: 30),
                          // GestureDetector(
                          //   onTap: () {
                          //     // creatingAddInfoController.images.length == 0
                          //     //     ? creatingAddInfoController.phCheck.value = true
                          //     //     : creatingAddInfoController.phCheck.value = false;

                          //     if (creatingAddInfoController.title.value.isNotEmpty &&
                          //         ((creatingAddInfoController.type_ad.value !=
                          //                 'price') ||
                          //             (creatingAddInfoController.type_ad.value == 'price' &&
                          //                 creatingAddInfoController.price.value !=
                          //                     0.0)) &&
                          //         creatingAddInfoController
                          //             .description.value.isNotEmpty &&
                          //         creatingAddInfoController.subCategoryId.value != 1 &&
                          //         creatingAddInfoController.images.isNotEmpty &&
                          //         creatingAddInfoController.phoneNumber.value.length >
                          //             11 &&
                          //         creatingAddInfoController
                          //             .locationInfo.value.isNotEmpty &&
                          //         creatingAddInfoController.lat.value != 0.0 &&
                          //         creatingAddInfoController.long.value != 0.0) {
                          //       Get.to(() => PreviewScreen(
                          //             typeAd: creatingAddInfoController.type_ad.value,
                          //             imageList: creatingAddInfoController.images,
                          //             lat: creatingAddInfoController.lat.value
                          //                 .toString(),
                          //             lng: creatingAddInfoController.long.value
                          //                 .toString(),
                          //             userName: widget.userName!,
                          //             datee: widget.dateTime!,
                          //             titlee: creatingAddInfoController.title.value,
                          //             addresss:
                          //                 creatingAddInfoController.locationInfo.value,
                          //             categoryy: creatingAddInfoController
                          //                     .mainCategory.value +
                          //                 '/' +
                          //                 creatingAddInfoController.subCategory.value,
                          //             descriptionn:
                          //                 creatingAddInfoController.description.value,
                          //             pricee: creatingAddInfoController.price.value
                          //                 .toString(),
                          //           ));
                          //     } else {
                          //       print(creatingAddInfoController.title.value);
                          //       print(creatingAddInfoController.subCategoryId.value);
                          //       print(creatingAddInfoController.type_ad.value);
                          //       print(creatingAddInfoController.price.value);
                          //       print(creatingAddInfoController.description.value);
                          //       print(creatingAddInfoController.phoneNumber.value);
                          //       print(creatingAddInfoController.locationInfo.value);
                          //       print(creatingAddInfoController.lat.value);
                          //       print(creatingAddInfoController.long.value);
                          //     }
                          //   },
                          //   child: Container(
                          //     width: double.infinity,
                          //     padding: const EdgeInsets.symmetric(vertical: 14),
                          //     decoration: BoxDecoration(
                          //         color: ColorPalate.mainPageColor,
                          //         borderRadius: new BorderRadius.circular(
                          //           10.0,
                          //         ),
                          //         border: Border.all(
                          //           color: ColorPalate.mainColor,
                          //           width: 2,
                          //         )),
                          //     child: Center(
                          //       child: Text(
                          //         'Предпросмотр',
                          //         style: TextStyle(
                          //           fontSize: 18,
                          //           color: ColorPalate.mainColor,
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          SizedBox(height: 10),
                          CutomeButton(
                            title: 'Редактировать',
                            onpress: () {
                              print(creatingAddInfoController.title.value);
                              print(creatingAddInfoController
                                  .subCategoryId.value);
                              print(creatingAddInfoController.type_ad.value);
                              print(creatingAddInfoController.price.value);
                              print(
                                  creatingAddInfoController.description.value);
                              print(
                                  creatingAddInfoController.phoneNumber.value);
                              print(
                                  creatingAddInfoController.locationInfo.value);
                              print(creatingAddInfoController.lat.value);
                              print(creatingAddInfoController.long.value);
                              // creatingAddInfoController.images.length == 0
                              //     ? creatingAddInfoController.phCheck.value = true
                              //     : creatingAddInfoController.phCheck.value = false;
                              // if()
                              // await AllServices.editAd(widget.id!);
                              // g.Get.to(() => NonActiveAdds());
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
                                AllServices.editAd2(
                                  context: context,
                                  id: widget.id!,
                                );
                              }
                              ;
                              print('pressed');
                            },
                            buttonColor: ColorPalate.mainColor,
                            textColor: Colors.white,
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  )),
      ),
    );
  }
}
