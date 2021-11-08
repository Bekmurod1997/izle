import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/product_detail_controller.dart';
import 'package:izle/ui/product_detail/map.dart';
import 'package:izle/ui/product_detail/widgets/gallery_example_item.dart';
import 'package:izle/ui/product_detail/widgets/gallr.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'widgets/call_chat_buttons.dart';
import 'widgets/complain.dart';
import 'widgets/discription.dart';
import 'widgets/main_image.dart';
import 'widgets/more_vertical.dart';
import 'widgets/similar_adds.dart';
import 'widgets/type_buttons.dart';
import 'widgets/user_info.dart';
import 'package:carousel_slider/carousel_controller.dart';

class ProductDetailScreen extends StatefulWidget {
  final int? proId;
  ProductDetailScreen({required this.proId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailController productDetailController =
      Get.find<ProductDetailController>();
  final PageController _pageController = PageController(initialPage: 0);

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
    // print(productDetailController.productDetailList?.data.title);
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
  int currentPage = 0;
  bool verticalGallery = false;
  var allImages = [];
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: RotatedBox(
                quarterTurns: 2,
                child: SvgPicture.asset(
                  'assets/icons/next-icon.svg',
                  height: 20,
                ),
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
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
            ),
          );
        } else {
          // var allImages = new List<String?>.from(
          //     productDetailController.productDetailList?.data.gallery)
          //   ..add(productDetailController.productDetailList?.data.photo);
          allImages = [
            productDetailController.productDetailList?.data.photo,
            ...productDetailController.productDetailList?.data.gallery ?? []
          ];

          print('leee');
          print(allImages.length);
          // print(productDetailController
          //     .productDetailList.first.similar?.first.cityName);
          return Stack(
            children: [
              ListView(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: CarouselSlider(
                      carouselController: _controller,
                      items: allImages
                          .map((e) => GestureDetector(
                                onTap: () {
                                  // open(context, currentPage);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HeroPhotoViewRouteWrapper(
                                        imageProvider: NetworkImage(
                                          'http://izle.uz/' + e.toString(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  child: Hero(
                                      tag: '${e.toString()}',
                                      child: Image.network(
                                          'http://izle.uz/' + e.toString())),
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
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPage = index;
                            });
                            print('currentPage');
                            print(currentPage);
                          }),
                    ),
                  ),
                  if (allImages.length > 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: allImages.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: (Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.white
                                        : ColorPalate.mainColor)
                                    .withOpacity(
                                        currentPage == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  // GalleryImage(
                  //   imageUrls: allImages
                  //       .map((e) => 'http://izle.uz/' + e.toString())
                  //       .toList(),
                  // ),
                  // Container(
                  //     height: 300, color: Colors.red, child: GalleryExample()),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${productDetailController.productDetailList?.data.title}',
                          style: FontStyles.regularStyle(
                            fontSize: 24,
                            fontFamily: 'Lato',
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '${productDetailController.productDetailList?.data.price} сум',
                          style: FontStyles.blackStyle(
                              fontSize: 24, fontFamily: 'Lato', letterSpace: 2),
                        ),
                        SizedBox(height: 4),
                        SizedBox(height: 10),
                        Text(
                          '${productDetailController.productDetailList?.data.date}',
                          style: FontStyles.regularStyle(
                            fontSize: 12,
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
                          onTap: () => Get.to(() => MyMaps(
                                lat: productDetailController
                                        .productDetailList?.data.lat ??
                                    '',
                                lng: productDetailController
                                        .productDetailList?.data.lng ??
                                    '',
                              )),
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

                  // Divider(),

                  UserInfo(
                    userName:
                        '${productDetailController.productDetailList?.data.user.name}',
                    authorToken:
                        '${productDetailController.productDetailList?.data.user.token}',
                    userId:
                        productDetailController.productDetailList!.data.user.id,
                    userImage:
                        '${productDetailController.productDetailList?.data.user.photo}',
                    userPhone:
                        '${productDetailController.productDetailList!.data.user.phone}',
                  ),
                  SizedBox(height: 20),
                  // Text(
                  //     productDetailController.productDetailList?.similar),
                  // Divider(),
                  // SizedBox(height: 20),
                  // MyMaps(),
                  SimilarAdds(
                    myList: productDetailController.productDetailList?.similar,
                  ),
                  SizedBox(height: 10),

                  // CallChatButtons(),
                ],
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

void open(BuildContext context, final int index) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => GalleryPhotoViewWrapper(
        galleryItems: galleryItems,
        backgroundDecoration: const BoxDecoration(
          color: Colors.black,
        ),
        initialIndex: index,
      ),
    ),
  );
}

class HeroPhotoViewRouteWrapper extends StatelessWidget {
  const HeroPhotoViewRouteWrapper({
    required this.imageProvider,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
  });

  final ImageProvider imageProvider;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: MediaQuery.of(context).size.height,
      ),
      child: PhotoView(
        imageProvider: imageProvider,
        backgroundDecoration: backgroundDecoration,
        minScale: minScale,
        maxScale: maxScale,
        heroAttributes: const PhotoViewHeroAttributes(tag: "someTag"),
      ),
    );
  }
}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<GalleryExampleItem> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: widget.backgroundDecoration,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: _buildItem,
              itemCount: widget.galleryItems.length,
              loadingBuilder: widget.loadingBuilder,
              backgroundDecoration: widget.backgroundDecoration,
              pageController: widget.pageController,
              onPageChanged: onPageChanged,
              scrollDirection: widget.scrollDirection,
            ),
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Image ${currentIndex + 1}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  decoration: null,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryExampleItem item = widget.galleryItems[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: AssetImage(item.resource),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
      maxScale: PhotoViewComputedScale.covered * 4.1,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
    );
  }
}
