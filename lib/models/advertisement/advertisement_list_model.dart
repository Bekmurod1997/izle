class AdvertisementListModel {
  List<Data>? data;
  Links? lLinks;
  Meta? mMeta;

  var status;

  AdvertisementListModel({this.data, this.lLinks, this.mMeta});

  AdvertisementListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
      });
    }
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
    mMeta = json['_meta'] != null ? new Meta.fromJson(json['_meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks?.toJson();
    }
    if (this.mMeta != null) {
      data['_meta'] = this.mMeta?.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? typeAd;
  String? photo;
  String? phone;
  String? email;
  String? responsiblePerson;
  String? cityName;
  int? categoryId;

  String? categoryName;
  int? type;
  String? title;
  String? description;
  String? content;
  String? address;
  num? price;
  int? priceD;
  int? status;
  String? lng;
  String? lat;
  int? views;
  int? messages;
  int? viewPhone;
  int? premium;
  int? top;
  int? favorites;
  String? date;
  String? dateExpire;
  List<String>? gallery;
  User? user;
  List<Filter>? filter;

  Data(
      {this.id,
      this.photo,
      this.phone,
      this.typeAd,
      this.email,
      this.responsiblePerson,
      this.cityName,
      this.categoryId,
      this.categoryName,
      this.type,
      this.title,
      this.description,
      this.content,
      this.address,
      this.price,
      this.priceD,
      this.status,
      this.lng,
      this.lat,
      this.views,
      this.messages,
      this.viewPhone,
      this.premium,
      this.top,
      this.favorites,
      this.date,
      this.dateExpire,
      this.gallery,
      this.user,
      this.filter});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeAd = json['type_ad'];
    photo = json['photo'];
    phone = json['phone'];
    email = json['email'];
    responsiblePerson = json['responsible_person'];
    cityName = json['city_name'];
    categoryId = json['category_id'];

    categoryName = json['category_name'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    content = json['content'];
    address = json['address'];
    price = json['price'];
    priceD = json['price_d'];
    status = json['status'];
    lng = json['lng'];
    lat = json['lat'];
    views = json['views'];
    messages = json['messages'];
    viewPhone = json['view_phone'];
    premium = json['premium'];
    top = json['top'];
    favorites = json['favorites'];
    date = json['date'];
    dateExpire = json['date_expire'];
    gallery = json['gallery'].cast<String>();
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['filter'] != null) {
      filter = <Filter>[];
      json['filter'].forEach((v) {
        filter?.add(new Filter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_ad'] = this.typeAd;
    data['photo'] = this.photo;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['responsible_person'] = this.responsiblePerson;
    data['city_name'] = this.cityName;
    data['category_id'] = this.categoryId;

    data['category_name'] = this.categoryName;
    data['type'] = this.type;
    data['title'] = this.title;
    data['description'] = this.description;
    data['content'] = this.content;
    data['address'] = this.address;
    data['price'] = this.price;
    data['price_d'] = this.priceD;
    data['status'] = this.status;
    data['lng'] = this.lng;
    data['lat'] = this.lat;
    data['views'] = this.views;
    data['messages'] = this.messages;
    data['view_phone'] = this.viewPhone;
    data['premium'] = this.premium;
    data['top'] = this.top;
    data['favorites'] = this.favorites;
    data['date'] = this.date;
    data['date_expire'] = this.dateExpire;
    data['gallery'] = this.gallery;
    if (this.user != null) {
      data['user'] = this.user?.toJson();
    }
    if (this.filter != null) {
      data['filter'] = this.filter?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? token;
  String? name;
  String? phone;
  String? email;
  String? photo;
  String? date;
  String? city;
  int? balance;

  User(
      {this.id,
      this.token,
      this.name,
      this.phone,
      this.email,
      this.photo,
      this.date,
      this.city,
      this.balance});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    name = json['name'] ?? '';
    phone = json['phone'];
    email = json['email'];
    photo = json['photo'];
    date = json['date'];
    city = json['city'];
    balance = json['balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token'] = this.token;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['photo'] = this.photo;
    data['date'] = this.date;
    data['city'] = this.city;
    data['balance'] = this.balance;
    return data;
  }
}

class Filter {
  int? filterId;
  String? name;
  String? value;

  Filter({this.filterId, this.name, this.value});

  Filter.fromJson(Map<String, dynamic> json) {
    filterId = json['filter_id'];
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['filter_id'] = this.filterId;
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class Links {
  Self? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self?.toJson();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Meta {
  int? totalCount;
  int? pageCount;
  int? currentPage;
  int? perPage;

  Meta({this.totalCount, this.pageCount, this.currentPage, this.perPage});

  Meta.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    pageCount = json['pageCount'];
    currentPage = json['currentPage'];
    perPage = json['perPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['pageCount'] = this.pageCount;
    data['currentPage'] = this.currentPage;
    data['perPage'] = this.perPage;
    return data;
  }
}
