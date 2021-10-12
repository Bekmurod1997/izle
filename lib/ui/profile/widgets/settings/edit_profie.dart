import 'package:flutter/material.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/utils/my_prefs.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool status1 = false;
  late String n;
  late String e;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final UserInfoController userInfoController = Get.find<UserInfoController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // executes after build
      userInfoController.fetchUserInfo();
      print(userInfoController.fetchUserInfoList);
      if (userInfoController.fetchUserInfoList.first.name == null ||
          userInfoController.fetchUserInfoList.first.name == '') {
        nameController.text = '';
      } else {
        nameController.text = userInfoController.fetchUserInfoList.first.name!;
      }
      if (userInfoController.fetchUserInfoList.first.email == null ||
          userInfoController.fetchUserInfoList.first.email == '') {
        emailController.text = '';
      } else {
        emailController.text =
            userInfoController.fetchUserInfoList.first.email!;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(context, title: '  Редактировать профиль  '),
      body: Obx(() {
        if (userInfoController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ваше имя',
                    style: FontStyles.regularStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 11),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                        controller: nameController,
                        // controller: MyPref.userName ?? nameController,
                        decoration: InputDecoration(
                          hintText: 'Например: Велосипед SKILLMAX',
                          hintStyle: FontStyles.regularStyle(
                              fontSize: 16,
                              fontFamily: 'Lato',
                              color: Color(0xff616161)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Ваше новая электронная почта',
                    style: FontStyles.regularStyle(
                      fontSize: 16,
                      fontFamily: 'Lato',
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 11),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Например: Велосипед SKILLMAX',
                          hintStyle: FontStyles.regularStyle(
                              fontSize: 16,
                              fontFamily: 'Lato',
                              color: Color(0xff616161)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 45),
                  ListTile(
                    onTap: () => setState(() {
                      status1 = !status1;
                    }),
                    title: Text(
                      'Показать мое фото',
                      style: FontStyles.regularStyle(
                        fontSize: 18,
                        fontFamily: 'Lato',
                        color: Colors.black87,
                      ),
                    ),
                    trailing: Container(
                      width: 45,
                      height: 25,
                      child: FlutterSwitch(
                        activeColor: ColorPalate.mainColor,
                        value: status1,
                        onToggle: (val) {
                          setState(() {
                            status1 = val;
                          });
                        },
                      ),
                    ),
                  ),
                  Spacer(),
                  CutomeButton(
                    title: 'Сохранить',
                    onpress: () {
                      MyPref.userName = nameController.text;
                      MyPref.email = emailController.text;
                      AllServices.editProfile(
                          email: emailController.text,
                          name: nameController.text);
                      // Get.back();
                      // userInfoController.fetchUserInfo();
                    },
                    buttonColor: ColorPalate.mainColor,
                    textColor: Colors.white,
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
