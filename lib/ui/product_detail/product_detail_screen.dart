import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/product_detail_controller.dart';

import 'widgets/call_chat_buttons.dart';
import 'widgets/complain.dart';
import 'widgets/discription.dart';
import 'widgets/main_image.dart';
import 'widgets/more_vertical.dart';
import 'widgets/similar_adds.dart';
import 'widgets/type_buttons.dart';
import 'widgets/user_info.dart';

class ProductDetailScreen extends StatefulWidget {
  final int? proId;
  ProductDetailScreen({required this.proId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailController productDetailController =
      Get.find<ProductDetailController>();
  // @override
  // void initState() {
  //   productDetailController.fetchProductDetail(widget.proId!);
  //   print(productDetailController.productDetailList);
  //   print('id');
  //   print(widget.proId);
  //   super.initState();
  // }
  @override
  void initState() {
    productDetailController.fetchProductDetail(widget.proId!);
    print(productDetailController.productDetailList?.data.title);
    print('id');
    print(widget.proId);
    print('------');
    super.initState();
  }

  // @override
  // void didChangeDependencies() async {
  //   await productDetailController.fetchProductDetail(widget.proId!);
  //   print(productDetailController.productDetailList!.data.title);
  //   print('id');
  //   print(widget.proId);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/left-arrow.svg',
                height: 18,
              ),
              onPressed: () => Get.back(),
            ),
            actions: [
              MoreVertical(),
            ],
          ),
          preferredSize: Size.fromHeight(40)),
      body: Obx(() {
        if (productDetailController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // print(productDetailController
          //     .productDetailList.first.similar?.first.cityName);
          return Stack(
            children: [
              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainImage(
                      mainImage:
                          '${productDetailController.productDetailList?.data.photo}',
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${productDetailController.productDetailList?.data.title}',
                            textAlign: TextAlign.center,
                            style: FontStyles.regularStyle(
                              fontSize: 24,
                              fontFamily: 'Lato',
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${productDetailController.productDetailList?.data.price}сум',
                            style: FontStyles.blackStyle(
                              fontSize: 24,
                              fontFamily: 'Lato',
                            ),
                          ),
                          SizedBox(height: 4),
                          SizedBox(height: 10),
                          Text(
                            '${productDetailController.productDetailList?.data.date}',
                            style: FontStyles.regularStyle(
                              fontSize: 10,
                              fontFamily: 'Lato',
                              color: Color(0xff7F807F),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${productDetailController.productDetailList?.data.address}',
                            style: FontStyles.regularStyle(
                              fontSize: 18,
                              fontFamily: 'Lato',
                              color: Color(0xff7F807F),
                            ),
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            child: Text(
                              'Показать на карте',
                              style: FontStyles.regularStyle(
                                fontSize: 13,
                                fontFamily: 'Lato',
                                color: Color(0xff0081BB),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 5),
                    Divider(),
                    SizedBox(height: 7),
                    TypeButtons(),
                    SizedBox(height: 7),
                    Divider(),
                    SizedBox(height: 0),
                    ProductDesciption(
                      proDesc:
                          '${productDetailController.productDetailList?.data.description}',
                    ),
                    SizedBox(height: 0),
                    Center(
                      child: GestureDetector(
                        onTap: () => Get.to(
                          () => ComplainScreen(),
                        ),
                        child: Text(
                          'Пожаловаться',
                          style: FontStyles.semiBoldStyle(
                            fontSize: 16,
                            fontFamily: 'Lato',
                            undeline: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Divider(),
                    SizedBox(height: 0),
                    UserInfo(
                      userName:
                          '${productDetailController.productDetailList?.data.user.name}',
                      authorToken:
                          '${productDetailController.productDetailList?.data.user.token}',
                    ),
                    // Text(
                    //     productDetailController.productDetailList?.similar),
                    // Divider(),
                    // SizedBox(height: 20),
                    // MyMaps(),
                    SimilarAdds(
                      myList:
                          productDetailController.productDetailList?.similar,
                    ),

                    Container(color: Colors.white, height: 20),
                    // CallChatButtons(),
                    SizedBox(height: 34),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: CallChatButtons(
                      userId: productDetailController
                          .productDetailList?.data.user.id,
                      userPhone: productDetailController
                          .productDetailList?.data.user.phone,
                      userName: productDetailController
                          .productDetailList?.data.user.name,
                      imageUrl: productDetailController
                          .productDetailList?.data.user.photo,
                    )),
              ),
            ],
          );
        }
      }),
    );
  }
}
