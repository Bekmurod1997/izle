import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class FillUpWallet extends StatefulWidget {
  const FillUpWallet({Key? key}) : super(key: key);

  @override
  _FillUpWalletState createState() => _FillUpWalletState();
}

class _FillUpWalletState extends State<FillUpWallet> {
  int selectedButton = 0;
  var priceList = [
    '5 000 сум',
    '10 000 сум',
    '20 000 сум',
    '30 000 сум',
    '50 000 сум',
    '60 000 сум',
    '80 000 сум',
    '100 000 сум',
    '120 000 сум',
    '200 000 сум',
    '500 000 сум',
    '100 000 сум',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(context, title: '  Пополнить кошелек'),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Выберите сумму пополнения',
                style: FontStyles.semiBoldStyle(
                  fontSize: 20,
                  fontFamily: 'Lato',
                ),
              ),
              Text(
                'Цены указаны со всеми налогами',
                style: FontStyles.regularStyle(
                  fontSize: 12,
                  fontFamily: 'Lato',
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 1;
                        });
                      },
                      child: Text(
                        '5 000 сум',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 1
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 1
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 2;
                        });
                      },
                      child: Text(
                        '10 000 сум',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 2
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 2
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 3;
                        });
                      },
                      child: Text(
                        priceList[2],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 3
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 3
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 4;
                        });
                      },
                      child: Text(
                        priceList[3],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 4
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 4
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 5;
                        });
                      },
                      child: Text(
                        priceList[4],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 5
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 5
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 6;
                        });
                      },
                      child: Text(
                        priceList[5],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 6
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 6
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 7;
                        });
                      },
                      child: Text(
                        priceList[6],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 7
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 7
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 8;
                        });
                      },
                      child: Text(
                        priceList[7],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 8
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 8
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 9;
                        });
                      },
                      child: Text(
                        priceList[8],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 9
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 9
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 10;
                        });
                      },
                      child: Text(
                        priceList[9],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 10
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 10
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 11;
                        });
                      },
                      child: Text(
                        priceList[10],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 11
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 11
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2 - 30,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedButton = 12;
                        });
                      },
                      child: Text(
                        priceList[11],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        primary: selectedButton == 12
                            ? Colors.white
                            : Color(0xff7C7E7E),
                        backgroundColor: selectedButton == 12
                            ? ColorPalate.mainColor
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Text(
                'Как вы хотите оплатить?',
                style: FontStyles.boldStyle(
                  fontSize: 18,
                  fontFamily: 'Lato',
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset('assets/images/payme.png'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset('assets/images/paynet.png'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Center(
                  child: Image.asset('assets/images/click.png'),
                ),
              ),
              SizedBox(height: 90),
              selectedButton != 0
                  ? CutomeButton(
                      title: 'Оплатить ' + priceList[selectedButton - 1],
                      onpress: () => Get.back(),
                      buttonColor: ColorPalate.mainColor,
                      textColor: Colors.white,
                    )
                  : Container(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
