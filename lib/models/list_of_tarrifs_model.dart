class ListOfTarrifsModel {
  List<Data>? data;
  Links? lLinks;
  Meta? mMeta;

  ListOfTarrifsModel({this.data, this.lLinks, this.mMeta});

  ListOfTarrifsModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? nameEn;
  String? nameUz;
  String? price;
  int? top;
  int? up;
  int? vip;
  int? topLimit;
  int? upLimit;
  int? vipLimit;
  String? note;
  String? noteEn;
  String? noteUz;

  Data(
      {this.id,
      this.name,
      this.nameEn,
      this.nameUz,
      this.price,
      this.top,
      this.up,
      this.vip,
      this.topLimit,
      this.upLimit,
      this.vipLimit,
      this.note,
      this.noteEn,
      this.noteUz});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    nameUz = json['name_uz'];
    price = json['price'];
    top = json['top'];
    up = json['up'];
    vip = json['vip'];
    topLimit = json['top_limit'];
    upLimit = json['up_limit'];
    vipLimit = json['vip_limit'];
    note = json['note'];
    noteEn = json['note_en'];
    noteUz = json['note_uz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_en'] = this.nameEn;
    data['name_uz'] = this.nameUz;
    data['price'] = this.price;
    data['top'] = this.top;
    data['up'] = this.up;
    data['vip'] = this.vip;
    data['top_limit'] = this.topLimit;
    data['up_limit'] = this.upLimit;
    data['vip_limit'] = this.vipLimit;
    data['note'] = this.note;
    data['note_en'] = this.noteEn;
    data['note_uz'] = this.noteUz;
    return data;
  }
}

class Links {
  Self? self;
  Self? first;
  Self? last;

  Links({this.self, this.first, this.last});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    first = json['first'] != null ? new Self.fromJson(json['first']) : null;
    last = json['last'] != null ? new Self.fromJson(json['last']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self?.toJson();
    }
    if (this.first != null) {
      data['first'] = this.first?.toJson();
    }
    if (this.last != null) {
      data['last'] = this.last?.toJson();
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
