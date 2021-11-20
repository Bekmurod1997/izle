import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/models/all_regions_model.dart';
import 'package:izle/ui/category/result_ads.dart';

class DistrictScreen extends StatefulWidget {
  final int mainCategoryId;
  final int mainCatId;
  final String mainCategoryName;
  final String mainCityName;
  final int mainCityId;
  final List<Childs> districts;
  DistrictScreen(
      {required this.districts,
      required this.mainCategoryName,
      required this.mainCategoryId,
      required this.mainCatId,
      required this.mainCityId,
      required this.mainCityName});
  @override
  _DistrictScreenState createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
  List<Childs> districts = [];
  @override
  void initState() {
    // TODO: implement initState
    districts = widget.districts;
    super.initState();
  }

  // final recieveData =Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30),
          Container(
            color: ColorPalate.lightGreen,
            child: ListTile(
                title: Text('Весь ' + widget.mainCityName),
                onTap: () {
                  Get.back();
                  Get.back();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ResultAds(
                                mainCategoryId: widget.mainCategoryId,
                                catId: widget.mainCatId,
                                catName: widget.mainCategoryName,
                                cityId: widget.mainCityId,
                                cityName: widget.mainCityName,
                              )));
                }),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 4,
              ),
              padding: EdgeInsets.zero,
              itemCount: districts.length,
              itemBuilder: (context, index) => Container(
                child: ListTile(
                    trailing: Text(districts[index].id.toString()),
                    title: Text(districts[index].nameRu!),
                    // trailing: Icon(Icons.arrow_forward, color:ColorPalate.mainColor),
                    // onTap: () {
                    //   print(districts[index].id!);
                    // },

                    onTap: () {
                      Get.back();
                      Get.back();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => ResultAds(
                                    mainCategoryId: widget.mainCategoryId,
                                    catId: widget.mainCatId,
                                    catName: widget.mainCategoryName,
                                    cityId: districts[index].id,
                                    cityName: widget.mainCityName,
                                  )));
                    }),
              ),
            ),
          ),
        ],
      ),
    );
    // return ListView.builder(
    //     itemCount:recieveData,
    //     itemBuilder: (context, index)=>Text(recieveData[0].nameRu));
  }
}
