class ProductDetailModel2 {
  Data? data;
  List<Similar>? similar;

  ProductDetailModel2({this.data, this.similar});

  ProductDetailModel2.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    if (json['similar'] != null) {
      similar = <Similar>[];
      json['similar'].forEach((v) {
        similar!.add(new Similar.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.similar != null) {
      data['similar'] = this.similar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? photo;
  String? phone;
  String? email;
  String? responsiblePerson;
  String? cityName;
  String? categoryName;
  String? type;
  String? title;
  String? description;
  String? content;
  String? address;
  int? price;
  int? priceD;
  int? status;
  String? lng;
  String? lat;
  int? views;
  int? viewPhone;
  int? premium;
  int? favorites;
  String? date;
  String? dateExpire;
  List<String>? gallery;
  User? user;
  List<String>? filter;

  Data(
      {this.id,
      this.photo,
      this.phone,
      this.email,
      this.responsiblePerson,
      this.cityName,
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
      this.viewPhone,
      this.premium,
      this.favorites,
      this.date,
      this.dateExpire,
      this.gallery,
      this.user,
      this.filter});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    phone = json['phone'];
    email = json['email'];
    responsiblePerson = json['responsible_person'];
    cityName = json['city_name'];
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
    viewPhone = json['view_phone'];
    premium = json['premium'];
    favorites = json['favorites'];
    date = json['date'];
    dateExpire = json['date_expire'];
    // if (json['gallery'] != null) {
    //   gallery =  <String>[];
    //   json['gallery'].forEach((v) {
    //     gallery!.add( Similar.fromJson(v));
    //   });
    // }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    // if (json['filter'] != null) {
    //   filter =  <String>[];
    //   json['filter'].forEach((v) {
    //     filter!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['responsible_person'] = this.responsiblePerson;
    data['city_name'] = this.cityName;
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
    data['view_phone'] = this.viewPhone;
    data['premium'] = this.premium;
    data['favorites'] = this.favorites;
    data['date'] = this.date;
    data['date_expire'] = this.dateExpire;
    // if (this.gallery != null) {
    //   data['gallery'] = this.gallery!.map((v) => v.toJson()).toList();
    // }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    // if (this.filter != null) {
    //   data['filter'] = this.filter!.map((v) => v.toJson()).toList();
    // }
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
    name = json['name'];
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

class Similar {
  int? id;
  String? photo;
  String? phone;
  String? email;
  String? responsiblePerson;
  String? cityName;
  String? categoryName;
  String? type;
  String? title;
  String? description;
  String? content;
  String? address;
  int? price;
  int? priceD;
  int? status;
  String? lng;
  String? lat;
  int? views;
  int? viewPhone;
  int? premium;
  int? favorites;
  String? date;
  String? dateExpire;
  List<String>? gallery;
  User? user;
  List<Filter>? filter;

  Similar(
      {this.id,
      this.photo,
      this.phone,
      this.email,
      this.responsiblePerson,
      this.cityName,
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
      this.viewPhone,
      this.premium,
      this.favorites,
      this.date,
      this.dateExpire,
      this.gallery,
      this.user,
      this.filter});

  Similar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    phone = json['phone'];
    email = json['email'];
    responsiblePerson = json['responsible_person'];
    cityName = json['city_name'];
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
    viewPhone = json['view_phone'];
    premium = json['premium'];
    favorites = json['favorites'];
    date = json['date'];
    dateExpire = json['date_expire'];
    gallery = json['gallery'].cast<String>();
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['filter'] != null) {
      filter = <Filter>[];
      json['filter'].forEach((v) {
        filter!.add(new Filter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['responsible_person'] = this.responsiblePerson;
    data['city_name'] = this.cityName;
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
    data['view_phone'] = this.viewPhone;
    data['premium'] = this.premium;
    data['favorites'] = this.favorites;
    data['date'] = this.date;
    data['date_expire'] = this.dateExpire;
    data['gallery'] = this.gallery;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.filter != null) {
      data['filter'] = this.filter!.map((v) => v.toJson()).toList();
    }
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
