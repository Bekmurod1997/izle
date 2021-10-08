import 'package:json_annotation/json_annotation.dart';
part 'pdetail.g.dart';

@JsonSerializable()
class ExampleProductDetail {
  DataModel? datamodel;
  List<Similar>? similar;
  ExampleProductDetail({this.datamodel, this.similar});
  factory ExampleProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ExampleProductDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ExampleProductDetailToJson(this);
}

@JsonSerializable()
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
  factory Similar.fromJson(Map<String, dynamic> json) =>
      _$SimilarFromJson(json);
  Map<String, dynamic> toJson() => _$SimilarToJson(this);
}

@JsonSerializable()
class DataModel {
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

  DataModel(
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
  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

@JsonSerializable()
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
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Filter {
  int? filterId;
  String? name;
  String? value;

  Filter({this.filterId, this.name, this.value});
  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}
