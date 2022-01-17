import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/controller/search_controller.dart';
import 'package:izle/ui/home/widgets/search_reasult.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final PageNavigationController pageController =
      Get.find<PageNavigationController>();
  final SearchController sController = Get.find<SearchController>();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(5, 40, 5, 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        textInputAction: TextInputAction.go,
        onSubmitted: (value) {
          // search: searchController.text,
          print('entered');
          sController.searchTitleChanger(sTitle: searchController.text);
          Get.to(() => SearchResult(
              // search: searchController.text,
              // searchResult: sController.searchTitle.toString(),
              ));
          // pageController.pageControllerChanger(6);
        },
        controller: searchController,
        decoration: InputDecoration(
          prefixIcon: GestureDetector(
              onTap: () {
                sController.searchTitleChanger(sTitle: searchController.text);
                Get.to(() => SearchResult(
                    // search: searchController.text,
                    // search: searchController.text,
                    // searchResult: sController.searchTitle.toString(),
                    ));
                // pageController.pageControllerChanger(6);
              },
              child: Icon(
                Icons.search,
                size: 25,
              )),
          border: InputBorder.none,
          hintText: 'whatYouAreLookingFor'.tr,
          hintStyle: FontStyles.regularStyle(
            fontSize: 16,
            fontFamily: 'Lato',
            color: Color(0xff7E8389),
          ),
        ),
      ),
    );
  }
}
