import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DistrictScreen extends StatefulWidget {
  final List districts;
  DistrictScreen({required this.districts });
  @override
  _DistrictScreenState createState() => _DistrictScreenState();
}

class _DistrictScreenState extends State<DistrictScreen> {
  // final recieveData =Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30),
          Text(widget.districts[0].nameRu),
          // Text(widget.distircts.length.toString()),
          // Text(widget.distircts[0].childs.length.toString()),
          Expanded(child: ListView.builder(
              itemCount: 1,
            itemBuilder: (context, index)=>ListTile(
              // title: Text(widget.nameRu.toString()),
              // trailing: Icon(Icons.arrow_forward, color:ColorPalate.mainColor),
              onTap: (){

                // Get.to(()=>DistrictScreen(distircts: [allRegionsController.allRegionsList[index].childs![index]],),   );
              },
            ),),),
        ],
      ),
    );
    // return ListView.builder(
    //     itemCount:recieveData,
    //     itemBuilder: (context, index)=>Text(recieveData[0].nameRu));
  }
}
