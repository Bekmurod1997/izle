import 'package:json_annotation/json_annotation.dart';
part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductDetailModel {
  final Ad data;
  final List<Similar> similar;

  ProductDetailModel({
    required this.data,
    required this.similar,
  });

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailModelFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Ad {
  final int id;
  final String? typeAd;
  final String? photo;
  final String? phone;
  final String? email;
  final String? responsiblePerson;
  final String? cityName;
  final int? categoryId;
  final String? categoryName;
  final int? type;
  final String? title;
  final String? description;
  final String? content;
  final String? address;
  final num? price;
  final int? priceD;
  final int? status;
  final String? lng;
  final String? lat;
  final int? views;
  final int? viewPhone;
  final int? premium;
  final int? top;
  final int? favorites;
  final String? date;

  final String? dateExpire;
  final List<String> gallery;
  final User user;
  final List<Filter> filter;

  Ad({
    required this.id,
    required this.typeAd,
    required this.photo,
    required this.phone,
    required this.email,
    required this.responsiblePerson,
    required this.cityName,
    required this.categoryId,
    required this.categoryName,
    required this.type,
    required this.title,
    required this.description,
    required this.content,
    required this.address,
    required this.price,
    required this.priceD,
    required this.status,
    required this.lng,
    required this.lat,
    required this.views,
    required this.viewPhone,
    required this.premium,
    required this.top,
    required this.favorites,
    required this.date,
    required this.dateExpire,
    required this.gallery,
    required this.user,
    required this.filter,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Similar {
  final int id;
  final String? typeAd;
  final String? photo;
  final String? phone;
  final String? email;
  final String? responsiblePerson;
  final String? cityName;
  final String? categoryName;
  final int? categoryId;
  final int? type;
  final String? title;
  final String? description;
  final String? content;
  final String? address;
  final dynamic? price;
  final int? priceD;
  final int? status;
  final String? lng;
  final String? lat;
  final int? views;
  final int? viewPhone;
  final int? premium;
  final int? top;
  final int? favorites;
  final String? date;
  final String? dateExpire;
  final List<String> gallery;
  final User user;
  final List<Filter> filter;
  Similar({
    required this.id,
    required this.typeAd,
    required this.photo,
    required this.phone,
    required this.email,
    required this.responsiblePerson,
    required this.cityName,
    required this.categoryName,
    required this.categoryId,
    required this.type,
    required this.title,
    required this.description,
    required this.content,
    required this.top,
    required this.address,
    required this.price,
    required this.priceD,
    required this.status,
    required this.lng,
    required this.lat,
    required this.views,
    required this.viewPhone,
    required this.premium,
    required this.favorites,
    required this.date,
    required this.dateExpire,
    required this.gallery,
    required this.user,
    required this.filter,
  });

  factory Similar.fromJson(Map<String, dynamic> json) =>
      _$SimilarFromJson(json);
}

@JsonSerializable()
class User {
  final int id;
  final String? token;
  final String? name;
  final String? phone;
  final String? email;
  final String? photo;
  final String? date;
  final String? city;
  final int? balance;

  User({
    required this.id,
    required this.token,
    required this.name,
    required this.phone,
    required this.email,
    required this.photo,
    required this.date,
    required this.city,
    required this.balance,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Filter {
  final int? filterId;
  final String? name;
  final String? value;

  Filter({
    required this.filterId,
    required this.name,
    required this.value,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}
