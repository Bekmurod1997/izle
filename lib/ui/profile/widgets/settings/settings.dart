import 'package:flutter/material.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/custom_listTile.dart';
import 'package:get/get.dart';
import 'package:izle/ui/profile/widgets/resume/resume.dart';
import 'package:izle/ui/profile/widgets/settings/delete_account.dart';
import 'package:izle/ui/profile/widgets/settings/edit_profie.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(context, title: 'Настройки', eleveation: 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          children: [
            CustomListTile(
              title: 'Редактировать профиль',
              onpress: () => Get.to(() => EditProfileScreen()),
            ),
            CustomListTile(
              title: 'Уведомления',
              onpress: () {},
            ),
            CustomListTile(
              title: 'Ваше резюме',
              onpress: () => Get.to(() => Resume()),
            ),
            CustomListTile(
              title: 'Удалить профиль',
              onpress: () => Get.to(() => DeleteAccountScreen()),
            ),
            Expanded(child: Container()),
            Center(
              child: Image.asset('assets/images/izle.png'),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
