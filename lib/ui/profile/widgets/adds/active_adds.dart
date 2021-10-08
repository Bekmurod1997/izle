import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/ui/profile/widgets/adds/widgets/adds_card.dart';

class ActiveAdds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: ColorPalate.mainPageColor,
        // appBar: PreferredSize(
        //   child: customAppBar1(context, title: 'Активные'),
        //   preferredSize: Size.fromHeight(40),
        // ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Divider(
                thickness: 3,
              ),
              SizedBox(height: 3),
              Container(
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: SvgPicture.asset(
                          'assets/icons/next-icon.svg',
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Text(
                      'Активные',
                      style: FontStyles.boldStyle(
                        fontSize: 24,
                        fontFamily: 'Lato',
                        color: Color(0xff4B4F5F),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3),
              Divider(
                thickness: 3,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => AddsCard(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
                itemCount: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
