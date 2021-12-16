// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExampleProductDetail _$ExampleProductDetailFromJson(
        Map<String, dynamic> json) =>
    ExampleProductDetail(
      datamodel: json['datamodel'] == null
          ? null
          : DataModel.fromJson(json['datamodel'] as Map<String, dynamic>),
      similar: (json['similar'] as List<dynamic>?)
          ?.map((e) => Similar.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExampleProductDetailToJson(
        ExampleProductDetail instance) =>
    <String, dynamic>{
      'datamodel': instance.datamodel,
      'similar': instance.similar,
    };

Similar _$SimilarFromJson(Map<String, dynamic> json) => Similar(
      id: json['id'] as int?,
      photo: json['photo'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      responsiblePerson: json['responsiblePerson'] as String?,
      cityName: json['cityName'] as String?,
      categoryName: json['categoryName'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      address: json['address'] as String?,
      price: json['price'] as dynamic?,
      priceD: json['priceD'] as int?,
      status: json['status'] as int?,
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
      views: json['views'] as int?,
      viewPhone: json['viewPhone'] as int?,
      premium: json['premium'] as int?,
      top: json['top'] as int?,
      favorites: json['favorites'] as int?,
      date: json['date'] as String?,
      dateExpire: json['dateExpire'] as String?,
      gallery:
          (json['gallery'] as List<dynamic>?)?.map((e) => e as String).toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      filter: (json['filter'] as List<dynamic>?)
          ?.map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SimilarToJson(Similar instance) => <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'phone': instance.phone,
      'email': instance.email,
      'responsiblePerson': instance.responsiblePerson,
      'cityName': instance.cityName,
      'categoryName': instance.categoryName,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'address': instance.address,
      'price': instance.price,
      'priceD': instance.priceD,
      'status': instance.status,
      'lng': instance.lng,
      'lat': instance.lat,
      'views': instance.views,
      'viewPhone': instance.viewPhone,
      'premium': instance.premium,
      'top': instance.top,
      'favorites': instance.favorites,
      'date': instance.date,
      'dateExpire': instance.dateExpire,
      'gallery': instance.gallery,
      'user': instance.user,
      'filter': instance.filter,
    };

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
      id: json['id'] as int?,
      photo: json['photo'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      responsiblePerson: json['responsiblePerson'] as String?,
      cityName: json['cityName'] as String?,
      categoryName: json['categoryName'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      address: json['address'] as String?,
      price: json['price'] as int?,
      priceD: json['priceD'] as int?,
      status: json['status'] as int?,
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
      views: json['views'] as int?,
      viewPhone: json['viewPhone'] as int?,
      premium: json['premium'] as int?,
      top: json['top'] as int?,
      favorites: json['favorites'] as int?,
      date: json['date'] as String?,
      dateExpire: json['dateExpire'] as String?,
      gallery:
          (json['gallery'] as List<dynamic>?)?.map((e) => e as String).toList(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      filter:
          (json['filter'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
      'id': instance.id,
      'photo': instance.photo,
      'phone': instance.phone,
      'email': instance.email,
      'responsiblePerson': instance.responsiblePerson,
      'cityName': instance.cityName,
      'categoryName': instance.categoryName,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'address': instance.address,
      'price': instance.price,
      'priceD': instance.priceD,
      'status': instance.status,
      'lng': instance.lng,
      'lat': instance.lat,
      'views': instance.views,
      'viewPhone': instance.viewPhone,
      'premium': instance.premium,
      'top': instance.top,
      'favorites': instance.favorites,
      'date': instance.date,
      'dateExpire': instance.dateExpire,
      'gallery': instance.gallery,
      'user': instance.user,
      'filter': instance.filter,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      token: json['token'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      photo: json['photo'] as String?,
      date: json['date'] as String?,
      city: json['city'] as String?,
      balance: json['balance'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'token': instance.token,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'photo': instance.photo,
      'date': instance.date,
      'city': instance.city,
      'balance': instance.balance,
    };

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      filterId: json['filterId'] as int?,
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'filterId': instance.filterId,
      'name': instance.name,
      'value': instance.value,
    };
