import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izle/services/all_services.dart';

void logOutDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text('Xотите выйти'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () async {
                  print('pressed yes');
                  await AllServices.logout();
                  print('fff');
                },
                child: Text('Yes'),
              ),
            ],
            // content: Text('This is my content'),
          ));
}
