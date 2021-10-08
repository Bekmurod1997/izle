import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(context, title: 'Ваше резюме'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Актуальное резюме',
              style: FontStyles.regularStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 11),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/up.svg'),
                      SizedBox(width: 15),
                      Text(
                        'Азиз Кобилов.doc',
                        style: FontStyles.mediumStyle(
                          fontSize: 16,
                          fontFamily: 'Lato',
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Удалить',
                          style: FontStyles.boldStyle(
                            fontSize: 16,
                            fontFamily: 'Lato',
                            color: Colors.black87,
                            undeline: true,
                          ),
                        ),
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Хотите обновить резюме? Удалить и загрузить новое.',
              style: FontStyles.mediumStyle(
                fontSize: 14,
                fontFamily: 'Lato',
                color: Colors.black87,
              ),
            ),
            Spacer(),
            RichText(
              text: TextSpan(
                  text:
                      'Загружая файл резюме, вы соглашаетесь, что его данные будут сохранены и обработаны ',
                  style: FontStyles.mediumStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Подробнее',
                      style: FontStyles.regularStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          color: Colors.black,
                          undeline: true),
                    ),
                  ]),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
