// import 'package:get/get.dart';
// import 'package:izle/services/all_services.dart';
// import 'package:izle/models/advertisement/advertisement_list_model.dart';

// class AllAdvertisementsController extends GetxController {
//   var isLoading = false.obs;
//   RxList<Data> allAdsList = <Data>[].obs;
//   var meta = 0.obs;
//   var isNull = false.obs;
//   var isLoadMore = false.obs;
//   var currentPage = 1;

//   @override
//   void onInit() async {
//     fetchAllAds();
//     super.onInit();
//   }

//   fetchAllAds() async {
//     try {
//       var adsList = await AllServices.fetchAds();
//       int? pageCount = adsList?.mMeta;
//       if (pageCount == null || currentPage > pageCount) {
//         return;
//       }
//       if (adsList != null) {
//         allAdsList.assignAll(adsList.data);
//         meta.value = adsList.mMeta._totalPage;
//         return;
//       }
//       print(adsList);
//     } finally {
//       isLoading(false);
//     }
//   }

//   void loadMore(page) async {
//     isLoading(true);
//     isLoadMore(true);

//     try {
//       var adsList = await AllServices.fetchAds(page: page);
//       if (adsList != null) {
//         allAdsList.addAll(adsList.data);
//         meta.value = adsList.mMeta._totalPage;
//         return;
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }
