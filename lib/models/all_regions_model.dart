class AllRegionsModel {
  List<Data>? data;

  AllRegionsModel({this.data});

  AllRegionsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data =  <Data>[];
      json['data'].forEach((v) {
        data?.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? nameRu;
  String? nameUz;
  String? nameEn;
  String? descriptionRu;
  String? descriptionUz;
  String? descriptionEn;
  String? photoId;
  String? photo;
  int? main;
  List<Childs>? childs;

  Data(
      {this.id,
        this.nameRu,
        this.nameUz,
        this.nameEn,
        this.descriptionRu,
        this.descriptionUz,
        this.descriptionEn,
        this.photoId,
        this.photo,
        this.main,
        this.childs});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameRu = json['name_ru'];
    nameUz = json['name_uz'];
    nameEn = json['name_en'];
    descriptionRu = json['description_ru'];
    descriptionUz = json['description_uz'];
    descriptionEn = json['description_en'];
    photoId = json['photo_id'];
    photo = json['photo'];
    main = json['main'];
    if (json['childs'] != null) {
      childs = <Childs>[];
      json['childs'].forEach((v) {
        childs?.add(new Childs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ru'] = this.nameRu;
    data['name_uz'] = this.nameUz;
    data['name_en'] = this.nameEn;
    data['description_ru'] = this.descriptionRu;
    data['description_uz'] = this.descriptionUz;
    data['description_en'] = this.descriptionEn;
    data['photo_id'] = this.photoId;
    data['photo'] = this.photo;
    data['main'] = this.main;
    if (this.childs != null) {
      data['childs'] = this.childs?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Childs {
  int? id;
  String? nameRu;
  String? nameUz;
  String? nameEn;
  String? descriptionRu;
  String? descriptionUz;
  String? descriptionEn;
  String? photoId;
  String? photo;
  int? main;

  Childs(
      {this.id,
        this.nameRu,
        this.nameUz,
        this.nameEn,
        this.descriptionRu,
        this.descriptionUz,
        this.descriptionEn,
        this.photoId,
        this.photo,
        this.main});

  Childs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameRu = json['name_ru'];
    nameUz = json['name_uz'];
    nameEn = json['name_en'];
    descriptionRu = json['description_ru'];
    descriptionUz = json['description_uz'];
    descriptionEn = json['description_en'];
    photoId = json['photo_id'];
    photo = json['photo'];
    main = json['main'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_ru'] = this.nameRu;
    data['name_uz'] = this.nameUz;
    data['name_en'] = this.nameEn;
    data['description_ru'] = this.descriptionRu;
    data['description_uz'] = this.descriptionUz;
    data['description_en'] = this.descriptionEn;
    data['photo_id'] = this.photoId;
    data['photo'] = this.photo;
    data['main'] = this.main;
    return data;
  }
}
