import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  final String mainImage;
  final int allImagesLength;
  final dynamic images;
  MainImage(
      {required this.mainImage,
      required this.allImagesLength,
      required this.images});

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Container(
    //   margin: const EdgeInsets.only(bottom: 4),
    //   height: 250,
    //   color: Colors.white,
    //   width: double.infinity,
    //   child: CarouselSlider.builder()
    //   ),
  }
}


// Image.network(
//             'http://izle.uz/' + mainImage,
//             width: double.infinity,
//             fit: BoxFit.fitHeight,
//           );