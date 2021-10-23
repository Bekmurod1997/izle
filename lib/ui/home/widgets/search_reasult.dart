import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/controller/search_controller.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/ui/home/widgets/filter_page.dart';

import 'package:izle/ui/home/widgets/search_product.dart';

class SearchResult extends StatefulWidget {
  final String searchResult;
  SearchResult({required this.searchResult});

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  final SearchController sController = Get.find<SearchController>();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  margin: EdgeInsets.fromLTRB(20, 40, 20, 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: IconButton(
                        onPressed: () {
                          sController.searchTitleChanger(
                              sTitle: searchController.text);
                          print('afterrrrrr');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    super.widget),
                          );

                          Get.back();
                          Get.to(() => SearchResult(
                                searchResult:
                                    sController.searchTitle.toString(),
                              ));
                        },
                        icon: Icon(Icons.search),
                      ),
                      border: InputBorder.none,
                      hintText: 'Что вы ищете?',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.to(
                    () => FilterPage(),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.1,
                    margin: const EdgeInsets.only(top: 25, right: 20),
                    padding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 11),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/f.svg',
                      height: 22,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
                // onTap: () => Get.to(() => ProductDetailScreen()),
                child: SearchProduct(
              searchTitle: sController.searchTitle.toString(),
            )),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
