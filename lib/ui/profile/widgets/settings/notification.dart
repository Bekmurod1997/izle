import 'package:flutter/material.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar1(context, title: 'notification', eleveation: 1),
      body: Center(
        child: Text('NoNotificationYet'.tr),
      ),
    );
  }
}
