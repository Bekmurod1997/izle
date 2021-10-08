import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';

class SimilarAdds extends StatelessWidget {
  const SimilarAdds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 5),
          Text(
            'Похожие объявления',
            style: FontStyles.semiBoldStyle(
              fontSize: 24,
              fontFamily: 'Lato',
            ),
          ),
          SizedBox(height: 20),

          //Similar adds
          /////
          ///
          ///
          ///
          // Container(
          //   color: Colors.white,
          //   height: 250,
          //   width: double.infinity,
          //   child: ListView.separated(
          //     scrollDirection: Axis.horizontal,
          //     // physics: NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemBuilder: (context, index) => Container(
          //       margin: const EdgeInsets.only(left: 15),
          //       width: MediaQuery.of(context).size.width * 0.44,
          //       height: 250,
          //       child: RecommandationItem(
          //         // isFavorite: false,
          //       ),
          //     ),
          //     separatorBuilder: (context, index) => SizedBox(
          //       width: 10,
          //     ),
          //     itemCount: 12,
          //   ),
          // ),
          //Similar adds
          /////
          ///
          ///
          ///
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
