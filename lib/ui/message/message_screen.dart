import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:izle/ui/components/custom_bottomNavbar.dart';
import 'package:izle/ui/components/custom_listTile2.dart';
import 'package:izle/ui/message/widgets/message_item.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool istabed = false;
  var titles = [
    'Недавные',
    'Все отправленные',
    'Важные',
    'Архивные',
    'Непрочитанные',
    'Покупаю',
    'Продаю',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(30.0), // here the desired height
      //   child: AppBar(

      //     centerTitle: true,
      //     backgroundColor: Colors.white,
      //     elevation: 0,
      //     // leading: IconButton(
      //     //   padding: const EdgeInsets.only(left: 20),
      //     //   onPressed: () {},
      //     //   icon: SvgPicture.asset('assets/icons/ring.svg'),
      //     // ),
      //     // title: Text(
      //     //   'Сообщения',
      //     //   style: TextStyle(fontSize: 24, color: Colors.black),
      //     // ),
      //     actions: [
      //       GestureDetector(
      //         onTap: () {
      //           showModalBottomSheet(
      //               isScrollControlled: true,
      //               context: context,
      //               builder: (context) {
      //                 return StatefulBuilder(
      //                     builder: (context, StateSetter state) {
      //                   return FractionallySizedBox(
      //                     heightFactor: 0.9,
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         GestureDetector(
      //                           onTap: () => Get.back(),
      //                           child: Padding(
      //                             padding: const EdgeInsets.all(8.0),
      //                             child: Text('X',
      //                                 style: TextStyle(
      //                                   fontSize: 25,
      //                                 )),
      //                           ),
      //                         ),
      //                         SizedBox(height: 15),
      //                         Padding(
      //                           padding:
      //                               const EdgeInsets.symmetric(horizontal: 10),
      //                           child: Text(
      //                             'Выберите собшения',
      //                             style: TextStyle(
      //                               fontSize: 30,
      //                               fontWeight: FontWeight.bold,
      //                             ),
      //                           ),
      //                         ),
      //                         SizedBox(height: 40),
      //                         Expanded(
      //                           child: ListView.builder(
      //                             padding: const EdgeInsets.symmetric(
      //                                 horizontal: 20),
      //                             itemCount: titles.length,
      //                             itemBuilder: (context, index) =>
      //                                 CustomListTile2(
      //                               istabed: istabed,
      //                               title: titles[index],
      //                               onpress: () {
      //                                 print('tabed$index');
      //                                 setState(() {
      //                                   istabed = !istabed;
      //                                 });
      //                               },
      //                             ),
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   );
      //                 });
      //               });
      //         },
      //         child: Container(
      //           padding: const EdgeInsets.only(right: 20, top: 0),
      //           child: Text(
      //             'Фильтры',
      //             style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 15,
      //             ),
      //           ),
      //         ),
      //       ),

      //     ],
      //   ),
      // ),
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   // leading: IconButton(
      //   //   padding: const EdgeInsets.only(left: 20),
      //   //   onPressed: () {},
      //   //   icon: SvgPicture.asset('assets/icons/ring.svg'),
      //   // ),
      //   // title: Text(
      //   //   'Сообщения',
      //   //   style: TextStyle(fontSize: 24, color: Colors.black),
      //   // ),
      //   actions: [
      //     GestureDetector(
      //       onTap: () {
      //         showModalBottomSheet(
      //             isScrollControlled: true,
      //             context: context,
      //             builder: (context) {
      //               return StatefulBuilder(
      //                   builder: (context, StateSetter state) {
      //                 return FractionallySizedBox(
      //                   heightFactor: 0.9,
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       GestureDetector(
      //                         onTap: () => Get.back(),
      //                         child: Padding(
      //                           padding: const EdgeInsets.all(8.0),
      //                           child: Text('X',
      //                               style: TextStyle(
      //                                 fontSize: 25,
      //                               )),
      //                         ),
      //                       ),
      //                       SizedBox(height: 15),
      //                       Padding(
      //                         padding:
      //                             const EdgeInsets.symmetric(horizontal: 10),
      //                         child: Text(
      //                           'Выберите собшения',
      //                           style: TextStyle(
      //                             fontSize: 30,
      //                             fontWeight: FontWeight.bold,
      //                           ),
      //                         ),
      //                       ),
      //                       SizedBox(height: 40),
      //                       Expanded(
      //                         child: ListView.builder(
      //                           padding:
      //                               const EdgeInsets.symmetric(horizontal: 20),
      //                           itemCount: titles.length,
      //                           itemBuilder: (context, index) =>
      //                               CustomListTile2(
      //                             istabed: istabed,
      //                             title: titles[index],
      //                             onpress: () {
      //                               print('tabed$index');
      //                               setState(() {
      //                                 istabed = !istabed;
      //                               });
      //                             },
      //                           ),
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 );
      //               });
      //             });
      //       },
      //       child: Container(
      //         padding: const EdgeInsets.only(right: 30, top: 20),
      //         child: Text(
      //           'Фильтры',
      //           style: TextStyle(
      //             color: Colors.black,
      //             fontSize: 15,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                          builder: (context, StateSetter state) {
                        return FractionallySizedBox(
                          heightFactor: 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () => Get.back(),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('X',
                                      style: TextStyle(
                                        fontSize: 25,
                                      )),
                                ),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Выберите собшения',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              Expanded(
                                child: ListView.builder(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  itemCount: titles.length,
                                  itemBuilder: (context, index) =>
                                      CustomListTile2(
                                    istabed: istabed,
                                    title: titles[index],
                                    onpress: () {
                                      print('tabed$index');
                                      setState(() {
                                        istabed = !istabed;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                    });
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(right: 20, top: 0),
                child: Text(
                  'Фильтры',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Недавные',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.only(top: 0), child: MessageItem()),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}