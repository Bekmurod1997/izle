import 'package:get/get.dart';
import 'package:izle/models/user_info_model.dart';
import 'package:izle/services/all_services.dart';

class UserInfoController extends GetxController {
  var isLoading = true.obs;
  var fetchUserInfoList = <UserInfoModel>[];

  void fetchUserInfo() async {
    try {
      isLoading(true);
      var fetchUser = await AllServices.userInfo();
      if (fetchUser != null) {
        fetchUserInfoList.assign(fetchUser);

        print(fetchUserInfoList);
      }
    } finally {
      isLoading(false);
    }
  }
}