import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/custom_bottomNavbar.dart';
import 'package:izle/constants/fonts.dart';

class FilterMessage extends StatefulWidget {
  const FilterMessage({Key? key}) : super(key: key);

  @override
  _FilterMessageState createState() => _FilterMessageState();
}

class _FilterMessageState extends State<FilterMessage> {
  List messageTypes = [
    'Недавние',
    'Все отправленные',
    'Важные',
    'Архивные',
    'Непрочитанные',
    'Отправленные вами',
    'Полученные'
  ];

  int selectedMessageType = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(context, title: '  Выберите сообщения  '),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 50),
          itemCount: messageTypes.length,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
            child: Column(
              children: [
                ListTile(
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                  dense: true,
                  onTap: () => setState(() {
                    selectedMessageType = index;
                  }),
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(
                    messageTypes[index],
                    style: FontStyles.regularStyle(
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  trailing: selectedMessageType == index
                      ? SvgPicture.asset('assets/icons/check.svg')
                      : SvgPicture.asset(
                          'assets/icons/check.svg',
                          color: Colors.white,
                        ),
                ),
                SizedBox(height: 10),
                Divider(),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
