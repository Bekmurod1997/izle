import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/constants/colors.dart';
import 'package:izle/constants/fonts.dart';
import 'package:get/get.dart' as g;
import 'package:izle/utils/my_prefs.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  final UserInfoController userInfoController =
      g.Get.find<UserInfoController>();
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      userInfoController.fetchUserInfo(userToken: MyPref.token);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalate.mainPageColor,
        appBar: customAppBar1(context, title: 'yourResume'),
        body: g.Obx(() {
          if (userInfoController.isLoading.value) {
            return Center(
                child: CircularProgressIndicator(
              color: ColorPalate.mainColor,
            ));
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'actualResume'.tr,
                    style: FontStyles.regularStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 11),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () async {
                                  final result =
                                      await FilePicker.platform.pickFiles();
                                  if (result == null) return;
                                  final file = result.files.first;
                                  print('Name:${file.name} ');
                                  print('Byte:${file.bytes} ');
                                  print('Size:${file.size} ');
                                  print('Extension:${file.extension} ');
                                  print('Path:${file.path} ');
                                  userInfoController.resume.value =
                                      file.path.toString();
                                  print('-----');
                                  print(userInfoController.resume.value);

                                  await AllServices.sendResume();
                                  userInfoController.fetchUserInfo(
                                      userToken: MyPref.token);
                                },
                                child: SvgPicture.asset('assets/icons/up.svg')),
                            SizedBox(width: 15),
                            GestureDetector(
                              onTap: () {
                                print('I pressed');
                                print('http://izle.uz/' +
                                    '${userInfoController.fetchUserInfoList.first.filePath}');
                                userInfoController
                                            .fetchUserInfoList.first.filePath !=
                                        null
                                    ? openFile(
                                        url: 'http://izle.uz/' +
                                            '${userInfoController.fetchUserInfoList.first.filePath}',
                                        // fileName: 'resume.pdf',
                                      )
                                    : print('need to upload resume');
                              },
                              child: Text(
                                userInfoController.fetchUserInfoList.first
                                                .filePath ==
                                            null ||
                                        userInfoController.fetchUserInfoList
                                                .first.filePath ==
                                            ''
                                    ? 'uploadYourResume'.tr
                                    : '${userInfoController.fetchUserInfoList.first.filePath?.split('/').last}',
                                // 'Азиз Кобилов.doc',
                                style: FontStyles.mediumStyle(
                                  fontSize: 16,
                                  fontFamily: 'Lato',
                                  color: Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            TextButton(
                              onPressed: () async {
                                await AllServices.removeResum();
                                userInfoController.fetchUserInfo(
                                    userToken: MyPref.token);
                              },
                              child: Text(
                                'delete'.tr,
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
                    'wantToUpdateResume'.tr,
                    style: FontStyles.mediumStyle(
                      fontSize: 14,
                      fontFamily: 'Lato',
                      color: Colors.black87,
                    ),
                  ),
                  Spacer(),
                  RichText(
                    text: TextSpan(
                        text: 'uploadingYourResume'.tr,
                        style: FontStyles.mediumStyle(
                          fontSize: 14,
                          fontFamily: 'Lato',
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'more'.tr,
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
            );
          }
        }));
  }

  void openResume(PlatformFile file) {
    OpenFile.open(file.path!);
    userInfoController.resume.value = file.path!;
  }

  Future openFile({required String url, String? fileName}) async {
    final name = fileName ?? url.split('/').last;
    final file = await downloadFile(url, name);
    if (file == null) return null;
    print('Path: ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      print('error in resume');
      print(e);
      return null;
    }
  }
}
