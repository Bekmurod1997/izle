import 'package:get/get.dart';
import 'package:izle/controller/page_navgation_controller.dart';
import 'package:izle/ui/nav.dart';

class CreatingAddInfoController extends GetxController {
  static PageNavigationController pageNavigationController =
      Get.find<PageNavigationController>();
  // var isLoading = false.obs;
  var sendMegabay = 0.0.obs;
  var totalMegabayt = 0.0.obs;
  var uploadingPercentage = 0.obs;

  var messageSendMegabay = 0.0.obs;
  var messageTotalMegabayt = 0.0.obs;
  var messageUploadingPercentage = 0.obs;

  var messageSendMegabayFirst = 0.0.obs;
  var messageTotalMegabaytFirst = 0.0.obs;
  var messageUploadingPercentageFirst = 0.obs;

  var phoneNumber = ''.obs;
  var titleCheck = false.obs;
  var tCheck = false.obs;
  var categoryCheck = false.obs;
  var cCheck = false.obs;
  var descriptionCheck = false.obs;
  var dCheck = false.obs;
  var locationCheck = false.obs;
  var lCheck = false.obs;
  var priceCheck = false.obs;
  var pCheck = false.obs;
  var phCheck = false.obs;
  var photoCheck = false.obs;
  var typeAdCheck = false.obs;
  var tyCheck = false.obs;

  var imageSizeToEdit = 0.obs;
  var mainCategory = ''.obs;
  var subCategory = ''.obs;
  var subCategoryId = 1.obs;
  var description = ''.obs;
  var title = ''.obs;
  var lat = 0.0.obs;
  var long = 0.0.obs;
  var locationInfo = ''.obs;
  var typeId = 0.obs;
  var name = ''.obs;
  var price = 0.0.obs;
  var mainPhoto = ''.obs;
  var images = [].obs;
  var messgeRoomId = 1.obs;
  var type_ad = 'price'.obs;
  var cityId = ''.obs;
  var cityName = ''.obs;

  void messageUploadingPercentageChanger(int itsPercentage) {
    print('this is in if');
    print(messageUploadingPercentage.value == 100);
    if (messageUploadingPercentage.value == 100) {
      print('its equal if');
      messageUploadingPercentage.value = 0;
      messageSendMegabay.value = 0.0;
      messageTotalMegabayt.value = 0.0;
      Get.offAll(
        () => NavScreen(),
      );
      pageNavigationController.pageControllerChanger(3);
      pageNavigationController.tabIndexChanger(3);
    }
    messageUploadingPercentage.value = itsPercentage;
  }

  void messageUploadingPercentageChanger2(int itsPercentage) {
    print('this is in if');
    print(messageUploadingPercentage.value == 100);
    if (messageUploadingPercentage.value == 100) {
      print('its equal if');
      messageUploadingPercentage.value = 0;
      messageSendMegabay.value = 0.0;
      messageTotalMegabayt.value = 0.0;
      // Get.back();
      // Get.offAll(
      //   () => NavScreen(),
      // );
      // pageNavigationController.pageControllerChanger(3);
      // pageNavigationController.tabIndexChanger(3);
    }
    messageUploadingPercentage.value = itsPercentage;
  }

  void messageUploadingFirstPercentageChanger(int itsPercentage) {
    print('this is in if');
    print(messageUploadingPercentageFirst.value == 100);
    if (messageUploadingPercentageFirst.value == 100) {
      print('its equal if');
      messageUploadingPercentageFirst.value = 0;
      messageSendMegabayFirst.value = 0.0;
      messageTotalMegabaytFirst.value = 0.0;
      Get.back();
    }
    messageUploadingPercentage.value = itsPercentage;
  }

  void totalUploadChanger(int itsPercentage) {
    print('this is in if');
    print(uploadingPercentage.value == 100);
    if (uploadingPercentage.value == 100) {
      uploadingPercentage.value = 0;
      sendMegabay.value = 0.0;
      totalMegabayt.value = 0.0;
      Get.offAll(
        () => NavScreen(),
      );
      pageNavigationController.pageControllerChanger(4);
      pageNavigationController.tabIndexChanger(4);
    }
    uploadingPercentage.value = itsPercentage;
  }

  void resetAll() {
    cityId.value = '';
    cityName.value = '';
    mainCategory.value = '';
    subCategory.value = '';
    subCategoryId.value = 1;
    description.value = '';
    title.value = '';
    lat.value = 0.0;
    long.value = 0.0;
    locationInfo.value = '';
    typeId.value = 0;
    name.value = '';
    price.value = 0.0;
    mainPhoto.value = '';
    images.value = [];
    messgeRoomId.value = 1;
    imageSizeToEdit.value = 0;
    titleCheck.value = false;
    tCheck.value = false;
    categoryCheck.value = false;
    cCheck.value = false;
    descriptionCheck.value = false;
    dCheck.value = false;
    locationCheck.value = false;
    lCheck.value = false;
    priceCheck.value = false;
    pCheck.value = false;
    phCheck.value = false;
    photoCheck.value = false;
    type_ad.value = 'price';
    typeAdCheck.value = false;
    tyCheck.value = false;
  }

  void changerRoomId(int roomId) {
    messgeRoomId.value = roomId;
  }

  void imagesChanger(List imagesC) {
    images.addAll(imagesC);
  }

  void mainPhotoChanger(String imageUrl) {
    mainPhoto.value = imageUrl;
  }

  void allClear() {
    imageSizeToEdit.value = 0;
    mainCategory.value = '';
    subCategory.value = '';
    subCategoryId.value = 1;
    description.value = '';
    title.value = '';
    lat.value = 0.0;
    long.value = 0.0;
    locationInfo.value = '';
    typeId.value = 0;
    name.value = '';
    price.value = 0.0;
    mainPhoto.value = '';
    images.value = [];
    messgeRoomId.value = 1;
  }

  void nameChanger(String nameC) {
    name.value = nameC;
  }

  void priceChanger(double priceC) {
    price.value = priceC;
  }

  void typeIdChanger(int id) {
    typeId.value = id;
  }

  void locationInfoChanger(String locInfo) {
    locationInfo.value = locInfo;
  }

  void titleChanger({String? titlee}) {
    title.value = titlee!;
  }

  void landAndLongChanger(double latitude, double longitude) {
    lat.value = latitude;
    long.value = longitude;
  }

  void mainCategoryChanger({String? categoryName}) {
    mainCategory.value = categoryName!;
  }

  Future subCategoryChanger(
      {required String subCategoryName, required int id}) async {
    subCategory.value = subCategoryName;
    subCategoryId.value = id;
  }

  void descriptionChanger({required String descriptionn}) {
    description.value = descriptionn;
  }
}
