import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/edit_product/edit_product_screen.dart';

class ModerationCard extends StatelessWidget {
  final List<String>? gallery;
  final int? categoryId;
  final int id;
  final String type_ad;
  final String title;
  final String imageUrl;
  final String category;
  final String description;
  final String type;
  final String locationTitle;
  final String userName;
  final String email;
  final int price;
  final String phoneNumber;
  final String date;
  final String content;
  final int status;
  final String lat;
  final String long;
  final String address;
  final String cityId;
  final String cityName;
  // final int nonActiveAds;

  ModerationCard({
    required this.id,
    required this.address,
    required this.type_ad,
    required this.categoryId,
    required this.gallery,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.email,
    required this.imageUrl,
    required this.locationTitle,
    required this.phoneNumber,
    required this.type,
    required this.content,
    required this.userName,
    required this.date,
    required this.status,
    required this.cityId,
    required this.cityName,
    required this.lat,
    required this.long,
    // required this.nonActiveAds,
  });
  final formatCurrency = NumberFormat.decimalPattern();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorPalate.addsBackgroundColor,
                    ),
                    child: Image.network(
                      'http://izle.uz/' + imageUrl,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10, top: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: FontStyles.semiBoldStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          type_ad == 'price'
                              ? '${formatCurrency.format(price).replaceAll(',', ' ')} сум'
                              : type_ad == 'exchange'
                                  ? 'обмен'
                                  : type_ad == 'negotiable'
                                      ? 'договорная'
                                      : 'бесплатно',
                          style: FontStyles.boldStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 3),
                        Text(
                          // 'С 14 июля по 13 августа',
                          date,
                          style: FontStyles.regularStyle(
                            fontSize: 12,
                            fontFamily: 'Lato',
                            color: Color(0xff7f807F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => EditProductSceen(
                          cityId: cityId,
                          cityName: cityName,
                          categoryId: categoryId,
                          // lat: lat,
                          // long: long,
                          dateTime: date,
                          adderss: address,
                          imageGallry: gallery,
                          type_ad: type_ad,
                          id: id,
                          category: category,
                          description: description,
                          email: email,
                          imageUrl: imageUrl,
                          // locationTitle: locationTitle,
                          phoneNumber: phoneNumber,
                          price: price.toString(),
                          title: title,
                          type: type,
                          userName: userName,
                          content: content,
                        ));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1 - 40,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.circular(
                          10.0,
                        ),
                        border: Border.all(
                          color: ColorPalate.mainColor,
                          width: 2,
                        )),
                    child: Center(
                      child: Text(
                        'Редактировать',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorPalate.mainColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Text(type_ad),
            // Text(categoryId.toString()),
            SizedBox(height: 13),
          ],
        ),
      ),
    );
  }
}
