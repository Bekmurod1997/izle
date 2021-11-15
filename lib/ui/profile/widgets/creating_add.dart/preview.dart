import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/product_detail/map.dart';
import 'package:izle/ui/product_detail/widgets/address.dart';
import 'package:izle/ui/product_detail/widgets/app_bar.dart';
import 'package:izle/ui/product_detail/widgets/date.dart';
import 'package:izle/ui/product_detail/widgets/discription.dart';
import 'package:izle/ui/product_detail/widgets/price.dart';
import 'package:izle/ui/product_detail/widgets/title.dart';
import 'package:izle/ui/product_detail/widgets/user_info.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'dart:typed_data';

class PreviewScreen extends StatefulWidget {
  final String titlee;
  final String categoryy;
  final String descriptionn;
  final String pricee;
  final String addresss;
  final String datee;
  final String lat;
  final String lng;
  final String userName;
  final List imageList;

  PreviewScreen(
      {required this.titlee,
      required this.categoryy,
      required this.descriptionn,
      required this.addresss,
      required this.datee,
      required this.lat,
      required this.lng,
      required this.userName,
      required this.imageList,
      required this.pricee});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final CarouselController _controller = CarouselController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    print('hereeee');
    print(widget.imageList[0].name);
    return Scaffold(
      appBar: detailAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        children: [
          widget.imageList.isEmpty
              ? Text('empty')
              : CarouselSlider(
                  carouselController: _controller,
                  items: widget.imageList
                      .map((e) => GestureDetector(
                            onTap: () {},
                            child: Container(
                              child: Hero(
                                  tag: '${e.toString()}',
                                  child: Image.memory(
                                      File(e.path).readAsBytesSync())),
                              // child: MemoryImage(e.bytes)),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                      height: 200.0,
                      enlargeCenterPage: true,
                      autoPlay: false,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: false,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentPage = index;
                        });
                        print('currentPage');
                        print(currentPage);
                      }),
                ),
          // Image.memory(bytes: Ut),
          title(title: widget.titlee),
          SizedBox(height: 10),
          price(price: widget.pricee),
          SizedBox(height: 14),
          date(date: widget.datee),
          SizedBox(height: 4),
          address(address: widget.addresss),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () => Get.to(() => MyMaps(
                  lat: widget.lat,
                  lng: widget.lng,
                )),
            child: Text(
              'Показать на карте',
              style: FontStyles.regularStyle(
                fontSize: 13,
                fontFamily: 'Lato',
                color: Color(0xff0081BB),
              ),
            ),
          ),
          SizedBox(height: 5),
          Divider(),
          ProductDesciption(proDesc: widget.descriptionn),
          Container(
            color: Color(0xffF2F4F5),
            padding: const EdgeInsets.only(top: 5, bottom: 15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userName,
                              style: FontStyles.semiBoldStyle(
                                fontSize: 24,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              'был(а) вчера 19:35',
                              style: FontStyles.semiBoldStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                  color: Color(0xff616161)),
                            ),
                            SizedBox(height: 13),
                          ],
                        ),
                        SvgPicture.asset('assets/icons/user.svg'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
