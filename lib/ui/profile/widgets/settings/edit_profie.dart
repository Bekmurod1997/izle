import 'package:flutter/material.dart';
import 'package:izle/controller/user_info.dart';
import 'package:izle/services/all_services.dart';
import 'package:izle/ui/components/custom_appbar.dart';
import 'package:izle/ui/components/cutome_button.dart';
import 'package:izle/constants/colors.dart';
import 'package:get/get.dart';
import 'package:izle/constants/fonts.dart';
import 'package:izle/utils/my_prefs.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool status1 = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureText = true;
  late String n;
  late String e;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final UserInfoController userInfoController = Get.find<UserInfoController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // executes after build
      userInfoController.fetchUserInfo(userToken: MyPref.token);
      print(userInfoController.fetchUserInfoList);
      print(MyPref.password);
      passwordController.text = MyPref.password;
      if (userInfoController.fetchUserInfoList.first.name == null ||
          userInfoController.fetchUserInfoList.first.name == '') {
        nameController.text = '';
      } else {
        nameController.text = userInfoController.fetchUserInfoList.first.name!;
      }

      // if (userInfoController.fetchUserInfoList.first.email == null ||
      //     userInfoController.fetchUserInfoList.first.email == '') {
      //   passwordController.text = '';
      // } else {
      //   emailController.text =
      //       userInfoController.fetchUserInfoList.first.email!;
      // }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalate.mainPageColor,
      appBar: customAppBar1(context, title: 'editProfile'),
      body: Obx(() {
        if (userInfoController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(ColorPalate.mainColor),
            ),
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
                    'yourName'.tr,
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
                          hintText: 'exampleSkil'.tr,
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
                    'changePassword'.tr,
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
                        child: TextField(
                          controller: passwordController,
                          style: TextStyle(fontSize: 16.0),
                          obscureText: _obscureText,
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: InkWell(
                                onTap: _toggle,
                                child: Text(
                                  _obscureText ? 'show'.tr : 'hide'.tr,
                                  style: TextStyle(
                                    color: Color(0xff635757),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        // TextFormField(
                        //   controller: passwordController,
                        //   decoration: InputDecoration(
                        //     hintText: 'Например: Велосипед SKILLMAX',
                        //     hintStyle: FontStyles.regularStyle(
                        //         fontSize: 16,
                        //         fontFamily: 'Lato',
                        //         color: Color(0xff616161)),
                        //     border: InputBorder.none,
                        //   ),
                        // ),
                        ),
                  ),
                  SizedBox(height: 45),
                  // ListTile(
                  //   onTap: () => setState(() {
                  //     status1 = !status1;
                  //   }),
                  //   title: Text(
                  //     'Показать мое фото',
                  //     style: FontStyles.regularStyle(
                  //       fontSize: 18,
                  //       fontFamily: 'Lato',
                  //       color: Colors.black87,
                  //     ),
                  //   ),
                  //   trailing: Container(
                  //     width: 45,
                  //     height: 25,
                  //     child: FlutterSwitch(
                  //       activeColor: ColorPalate.mainColor,
                  //       value: status1,
                  //       onToggle: (val) {
                  //         setState(() {
                  //           status1 = val;
                  //         });
                  //       },
                  //     ),
                  //   ),
                  // ),

                  Spacer(),

                  CutomeButton(
                    title: 'save',
                    onpress: () {
                      MyPref.userName = nameController.text;
                      MyPref.password = passwordController.text;
                      AllServices.editProfile(
                          password: passwordController.text,
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
