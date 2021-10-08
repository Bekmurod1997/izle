import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';

class DeleteAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(context, title: 'Удалить профиль', eleveation: 0.5),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 20,
        ),
        child: Column(
          children: [
            Text(
              'Нам грустно с вами расставаться. Чтобы удалить профиль, перейдите по ссылке, которую мы отправим вам на электронную почту. Вы действительно хотите удалить профиль?',
              style: FontStyles.regularStyle(
                fontSize: 16,
                fontFamily: 'Lato',
                color: Colors.black,
              ),
            ),
            Expanded(child: Container()),
            Center(
              child: Image.asset('assets/images/izle.png'),
            ),
            Expanded(child: Container()),
            CutomeButton(
              title: 'Отправить на e-mail',
              onpress: () => Get.back(),
              buttonColor: ColorPalate.mainColor,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
