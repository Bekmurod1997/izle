import 'package:flutter/material.dart';
import 'package:izle/ui/category/result_ads.dart';
import 'package:get/get.dart';
import 'package:izle/controller/all_regions_controller.dart';

class AAA extends StatelessWidget {
  const AAA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BlackSpaceSCreen extends StatefulWidget {
  const BlackSpaceSCreen({Key? key}) : super(key: key);

  @override
  State<BlackSpaceSCreen> createState() => _BlackSpaceSCreenState();
}

class _BlackSpaceSCreenState extends State<BlackSpaceSCreen> {
  final AllRegionsController allRegionsController =
      Get.put(AllRegionsController());
  @override
  void initState() {
    allRegionsController.fetchAllRegions();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: Center(
        //   child: GestureDetector(
        //       // onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ResultAds(catId: 796, catName: 'my category', imgUrl: 'asfdasd'))),

        //       child: Obx(() {
        //     if (allRegionsController.isLoading.value) {
        //       return Center(child: CircularProgressIndicator());
        //     } else {
        //       return ListView.builder(
        //           itemCount: allRegionsController.allRegionsList.length,
        //           itemBuilder: (context, index) => Column(
        //                 children: [
        //                   Text(
        //                       allRegionsController.allRegionsList[index].nameRu!),
        //                   // Text(allRegionsController.allRegionsList[index].childs![0].nameRu!),
        //                   Container(
        //                       height: 100,
        //                       child: ListView.builder(
        //                           itemCount: allRegionsController
        //                                   .allRegionsList[index].childs?.length ??
        //                               0,
        //                           itemBuilder: (context, indx) => Text(
        //                               allRegionsController.allRegionsList[index]
        //                                   .childs![indx].nameRu!)))
        //                 ],
        //               ));
        //     }
        //   })),
        // ),

        );
  }
}
