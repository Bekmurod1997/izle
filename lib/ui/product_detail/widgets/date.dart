import 'package:flutter/material.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/utils/my_prefs.dart';

class DateWidget extends StatefulWidget {
  final String datee;

  const DateWidget({Key? key, required this.datee}) : super(key: key);

  @override
  _DateWidgetState createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  String? day;
  String? month;

  String _dateChanger(String datee) {
    var parts = datee.split(',');
    setState(() {
      day = parts[0].trim();
      // monthh = parts[1].trim();
    });
    if (day!.contains('понедельник')) {
      setState(() {
        MyPref.lang == 'uz'
            ? day!.replaceAll('понедельник', 'dushanba')
            : MyPref.lang == 'kr'
                ? day!.replaceAll('понедельник', 'dúyshembi')
                : day!;
      });
      return MyPref.lang == 'uz'
          ? day!.replaceAll('понедельник', 'dushanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('понедельник', 'dúyshembi')
              : day!;
    } else if (day!.contains('вторник')) {
      setState(() {
        MyPref.lang == 'uz'
            ? day!.replaceAll('вторник', 'seshanba')
            : MyPref.lang == 'kr'
                ? day!.replaceAll('вторник', 'siyshembi')
                : day!;
      });
      return MyPref.lang == 'uz'
          ? day!.replaceAll('вторник', 'seshanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('вторник', 'siyshembi')
              : day!;
    } else if (day!.contains('среда')) {
      return MyPref.lang == 'uz'
          ? day!.replaceAll('среда', 'chorshanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('среда', 'sa\'rshembi')
              : day!;
    } else if (day!.contains('четверг')) {
      return MyPref.lang == 'uz'
          ? day!.replaceAll('четверг', 'payshanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('четверг', 'piyshembi')
              : day!;
    } else if (day!.contains('пятница')) {
      return MyPref.lang == 'uz'
          ? day!.replaceAll('пятница', 'juma')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('пятница', 'juma')
              : day!;
    } else if (day!.contains('суббота')) {
      return MyPref.lang == 'uz'
          ? day!.replaceAll('суббота', 'shanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('суббота', 'shembi')
              : day!;
    } else {
      return MyPref.lang == 'uz'
          ? day!.replaceAll('воскресенье', 'yakshanba')
          : MyPref.lang == 'kr'
              ? day!.replaceAll('воскресенье', 'ekshembi')
              : day!;
    }
  }

  String monthChanger(String monthh) {
    var parts = monthh.split(',');
    setState(() {
      month = parts[1].trim();
      // monthh = parts[1].trim();
    });
    // setState(() {
    //   month = parts[1].trim();
    // });
    if (month!.contains('января')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('января', 'yanvar')
          : month!;
    } else if (month!.contains('февраля')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('февраля', 'fevral')
          : month!;
    } else if (month!.contains('марта')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('марта', 'mart')
          : month!;
    } else if (month!.contains('апреля')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('апреля', 'aprel')
          : month!;
    } else if (month!.contains('мая')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('мая', 'may')
          : month!;
    } else if (month!.contains('июня')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('июня', 'iyun')
          : month!;
    } else if (month!.contains('июля')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('июля', 'iyul')
          : month!;
    } else if (month!.contains('августа')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('августа', 'avgust')
          : month!;
    } else if (month!.contains('сентября')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('сентября', 'sentyabr')
          : month!;
    } else if (month!.contains('октября')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('октября', 'oktyabr')
          : month!;
    } else if (month!.contains('ноября')) {
      setState(() {});
      return MyPref.lang == 'uz' || MyPref.lang == 'kr'
          ? month!.replaceAll('ноября', 'noyabr')
          : month!;
    }
    setState(() {});

    return MyPref.lang == 'uz' || MyPref.lang == 'kr'
        ? month!.replaceAll('декабря', 'dekabr')
        : month!;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _dateChanger(widget.datee) + ', ' + monthChanger(widget.datee),
      style: FontStyles.regularStyle(
        fontSize: 12,
        fontFamily: 'Lato',
        color: Color(0xff7F807F),
      ),
    );
  }
}
