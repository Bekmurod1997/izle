abstract class ApiUrl {
  //forImage

  static const izleUrl = 'http://izle.uz/';
  //User

  static const baseUrl = 'http://izle.uz/';
  static const apiUrl = '${baseUrl}api/';
  static const adsUrl = '${baseUrl}api/ads';
  static const signup = '${apiUrl}user/sign-up';
  static const removeUser = '${apiUrl}user/remove';
  static const resumeUpload = '${apiUrl}user/upload-cv';
  static const resumeRemove = '${apiUrl}user/remove-cv';
  static const confirmCod = '${apiUrl}user/send-code';
  static const signin = '${apiUrl}user/sign-in';
  static const blockUser = '${apiUrl}chat/set-block';
  static const deleteMessage = '${apiUrl}chat/remove';
  static const unreadMessage = '${apiUrl}chat/users?type=unreaded';
  static const setArchive = '${apiUrl}chat/set-archive';
  static const setImportant = '${apiUrl}chat/set-important';
  static const logout = '${apiUrl}user/log-out';
  static const recoverPassword = '${apiUrl}user/recover-password';
  static const recoverCode = '${apiUrl}user/accept-recover-code';

  //Payment

  static const listOfPrice = '${apiUrl}payment/';
  static const payPost = '${apiUrl}payment/send';

  static const buyTarif = '${apiUrl}payment/tariff-buy';

  //List of category
  static const allCategories = '${apiUrl}category';
  static const mainCategories = '${apiUrl}category?type=main';
  static const subCategories = '${apiUrl}category/sub?id=796';
  static const allCities = '${apiUrl}category?type=city';
  static const services = '${apiUrl}category?type=service';
  static const filter = '${apiUrl}category/filter?id=';

  //Businesss

  static const business = '${apiUrl}user/business';
  static const editBusiness = '${apiUrl}user/update-business';
  static const myProfile = '${apiUrl}user/profile';
  static const updateProfile = '${apiUrl}user/update';

  //Adds

  static const listOfAds = '${apiUrl}ads?category_id=';
  static const subCategory = '${apiUrl}ads/index?category_id=';
  static const listOfAllAds = '${apiUrl}ads?page=';
  static const listOfTariffs = '${apiUrl}payment/tariff';
  static const createAds = '${apiUrl}ads/create';
  static const editAds = '${apiUrl}ads/create?id=';
  static const deleteAds = '${apiUrl}ads/remove?id=';

  static const adsByUser = '${apiUrl}ads?user_id=4';
  static const search = '${apiUrl}ads/index?search=';
  static const myAds = '${apiUrl}ads/mine';
  static const adsView = '${apiUrl}advertisment';
  static const allFav = '${apiUrl}ads/favorites';
  static const addAndDeleteFavorite = '${apiUrl}ads/add-favorite?id=';
  static const favorites = '${apiUrl}ads/favorites?id=';
  static const productDetail = '${apiUrl}ads/view?id=';
  static const changeStatus = '${apiUrl}ads/change-status';

  //chat/////

  static const allChat = '${apiUrl}chat/users?type=';
  static const chatId = '${apiUrl}chat/messages?id=';
  static const sendMessage = '${apiUrl}chat/send';
}
