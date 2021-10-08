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

@JsonSerializable()
class Ad {
  final int id;
  final String? photo;
  final String? phone;
  final String? email;
  @JsonKey(name: 'responsible_person')
  final String? responsiblePerson;
  @JsonKey(name: 'city_name')
  final String? cityName;
  @JsonKey(name: 'category_name')
  final String categoryName;
  final String? type;
  final String? title;
  final String? description;
  final String? content;
  final String? address;
  final int? price;
  @JsonKey(name: 'price_d')
  final int? priceD;
  final int? status;
  final String? lng;
  final String? lat;
  final int? views;
  @JsonKey(name: 'views_phone')
  final int? viewPhone;
  final int? premium;
  final int? favorites;
  final String? date;
  @JsonKey(name: 'date_expire')
  final String? dateExpire;
  final List<String> gallery;
  final User user;
  final List<Filter> filter;

  Ad({
    required this.id,
    required this.photo,
    required this.phone,
    required this.email,
    required this.responsiblePerson,
    required this.cityName,
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
    required this.favorites,
    required this.date,
    required this.dateExpire,
    required this.gallery,
    required this.user,
    required this.filter,
  });

  factory Ad.fromJson(Map<String, dynamic> json) => _$AdFromJson(json);
}

@JsonSerializable()
class Similar {
  final int id;
  final String? photo;
  final String? phone;
  final String? email;
  @JsonKey(name: 'responsible_person')
  final String? responsiblePerson;
  @JsonKey(name: 'city_name')
  final String? cityName;
  @JsonKey(name: 'category_name')
  final String? categoryName;
  final String? type;
  final String? title;
  final String? description;
  final String? content;
  final String? address;
  final int? price;
  @JsonKey(name: 'price_d')
  final int? priceD;
  final int? status;
  final String? lng;
  final String? lat;
  final int? views;
  @JsonKey(name: 'views_phone')
  final int? viewPhone;
  final int? premium;
  final int? favorites;
  final String? date;
  @JsonKey(name: 'data_expire')
  final String? dateExpire;
  final List<String> gallery;
  final User user;
  final List<Filter> filter;
  Similar({
    required this.id,
    required this.photo,
    required this.phone,
    required this.email,
    required this.responsiblePerson,
    required this.cityName,
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

@JsonSerializable()
class Filter {
  @JsonKey(name: 'filter_id')
  final int filterId;
  final String name;
  final String value;

  Filter({
    required this.filterId,
    required this.name,
    required this.value,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
}
