import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as g;
import 'package:image_picker/image_picker.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/ui/edit_product/widget/app_bar_edit.dart';
import 'package:izle/ui/edit_product/widget/edit_category_choice.dart';
import 'package:izle/ui/edit_product/widget/edit_price.dart';
import 'package:izle/ui/edit_product/widget/edit_product_description.dart';
import 'package:izle/ui/edit_product/widget/edit_title.dart';
import 'package:izle/ui/profile/widgets/adds/non_active_adds.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/map_screen.dart';
import 'package:izle/ui/profile/widgets/creating_add.dart/widgets/user_info.dart';

class EditProductSceen extends StatefulWidget {
  final int? id;
  final String? title;
  final String? imageUrl;
  final String? category;
  final String? description;
  final String? type;
  final String? locationTitle;
  final String? userName;
  final String? email;
  final String? price;

  final String? phoneNumber;
  final String? content;
  // final int status;
  EditProductSceen({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.email,
    this.imageUrl,
    this.locationTitle,
    this.phoneNumber,
    this.type,
    this.userName,
    this.content,

    // required this.status,
  });
  @override
  _EditProductSceenState createState() => _EditProductSceenState();
}

class _EditProductSceenState extends State<EditProductSceen> {
  int selectedIndex = 0;
  bool status1 = false;
  int val = -1;
  var _image;
  var imagePicker;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                EditAppBar(),
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
                      if (mounted)
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
                EditTitle(
                  title: '${widget.title}',
                ),
                EditCategoryChoice(category: '${widget.category}'),
                EditCreateDescription(content: '${widget.content}'),
                EditPrice(
                  price: '${widget.price}',
                  type: '${widget.type}',
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
                  style:
                      FontStyles.regularStyle(fontSize: 16, fontFamily: 'Lato'),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        SvgPicture.asset('assets/icons/next-icon.svg'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                UserInfo(
                  title: 'Контактное лицо*', userInfo: '${widget.userName}',
                  // '${userInfoController.fetchUserInfoList.first.name}',
                ),
                UserInfo(
                    title: 'Электронная почта*', userInfo: '${widget.email}'),
                UserInfo(
                    title: 'Телефон', userInfo: '+' + '${widget.phoneNumber}'
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
                  title: 'Редактировать',
                  onpress: () async {
                    await AllServices.editAd(widget.id!);
                    // g.Get.to(() => NonActiveAdds());

                    print('pressed');
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
    );
  }
}
