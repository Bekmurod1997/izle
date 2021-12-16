import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/home/widgets/recommendation_item.dart';
import 'package:izle/ui/product_detail/product_detail_screen.dart';

class SimilarAdds extends StatelessWidget {
  final dynamic myList;
  SimilarAdds({required this.myList});
  @override
  Widget build(BuildContext context) {
    if (myList.length > 0) {
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

            Container(
              color: Colors.white,
              height: 280,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () async {
                    print('sdasd');
                    Get.back();
                    Get.to(
                      () => ProductDetailScreen(proId: myList[index].id),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 15),
                    width: MediaQuery.of(context).size.width * 0.44,
                    height: 250,
                    child: RecommandationItem(
                      top: myList[index].top,
                      premium: myList[index].premium,
                      typeAd: '${myList[index].typeAd}',
                      city: '${myList[index].cityName}',
                      date: '${myList[index].date}',
                      id: myList[index].id,
                      imageUrl: '${myList[index].photo}',
                      isFavorite: false,
                      price: '${myList[index].price}',
                      title: '${myList[index].title}',
                      // isFavorite: false,
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                itemCount: myList.length,
              ),
            ),
            //Similar adds

            /////
            ///
            ///
            ///
            SizedBox(height: 25),
          ],
        ),
      );
    } else {
      return Container();
    }
  }
}
