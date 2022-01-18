import 'package:flutter/material.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/custom_listTile.dart';
import 'package:get/get.dart';
import 'package:izle/ui/profile/widgets/resume/resume.dart';
import 'package:izle/ui/profile/widgets/settings/delete_account.dart';
import 'package:izle/ui/profile/widgets/settings/edit_profie.dart';
import 'package:izle/ui/profile/widgets/settings/notification.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(context, title: 'settings', eleveation: 1),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          children: [
            CustomListTile(
              title: 'editProfile',
              onpress: () => Get.to(() => EditProfileScreen()),
            ),
            CustomListTile(
              title: 'notification',
              onpress: () => Get.to(() => NotificationScreen()),
            ),
            CustomListTile(
              title: 'yourResume',
              onpress: () => Get.to(() => Resume()),
            ),
            CustomListTile(
              title: 'deleteProfile',
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
