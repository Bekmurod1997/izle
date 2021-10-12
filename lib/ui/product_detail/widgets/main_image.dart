import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  final String mainImage;
  MainImage({required this.mainImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      height: 250,
      color: Colors.white,
      width: double.infinity,
      child: Image.network(
        'http://izle.selfieshop.uz/' + mainImage,
        width: double.infinity,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
