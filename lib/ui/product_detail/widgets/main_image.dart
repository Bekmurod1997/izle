import 'package:flutter/material.dart';

class MainImage extends StatelessWidget {
  const MainImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      height: 250,
      color: Colors.white,
      width: double.infinity,
      child: Image.asset(
        'assets/images/111.jpeg',
        width: double.infinity,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
