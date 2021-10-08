import 'package:flutter/material.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/ui/category/widgets/products.dart';

class ResultAds extends StatefulWidget {
  final String catId;
  ResultAds({required this.catId});

  @override
  _ResultAdsState createState() => _ResultAdsState();
}

class _ResultAdsState extends State<ResultAds> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        body: SingleChildScrollView(
            // physics: ScrollPhysics(),
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30),
            Products(
              catId: widget.catId,
            ),
          ],
        )),
      ),
    );
  }
}
