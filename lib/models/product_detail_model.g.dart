// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unused_element

part of 'product_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailModel _$ProductDetailModelFromJson(Map<String, dynamic> json) =>
    ProductDetailModel(
      data: Ad.fromJson(json['data'] as Map<String, dynamic>),
      similar: (json['similar'] as List<dynamic>)
          .map((e) => Similar.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductDetailModelToJson(ProductDetailModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'similar': instance.similar,
    };

Ad _$AdFromJson(Map<String, dynamic> json) => Ad(
      id: json['id'] as int,
      typeAd: json['type_ad'] as String?,
      photo: json['photo'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      responsiblePerson: json['responsible_person'] as String?,
      cityName: json['city_name'] as String?,
      categoryId: json['category_id'] as int?,
      categoryName: json['category_name'] as String,
      type: json['type'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      address: json['address'] as String?,
      price: json['price'] as num?,
      priceD: json['price_d'] as int?,
      status: json['status'] as int?,
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
      views: json['views'] as int?,
      viewPhone: json['view_phone'] as int?,
      premium: json['premium'] as int?,
      top: json['top'] as int?,
      favorites: json['favorites'] as int?,
      date: json['date'] as String?,
      dateExpire: json['date_expire'] as String?,
      gallery:
          (json['gallery'] as List<dynamic>).map((e) => e as String).toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      filter: (json['filter'] as List<dynamic>)
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdToJson(Ad instance) => <String, dynamic>{
      'id': instance.id,
      'type_ad': instance.typeAd,
      'photo': instance.photo,
      'phone': instance.phone,
      'email': instance.email,
      'responsible_person': instance.responsiblePerson,
      'city_name': instance.cityName,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'address': instance.address,
      'price': instance.price,
      'price_d': instance.priceD,
      'status': instance.status,
      'lng': instance.lng,
      'lat': instance.lat,
      'views': instance.views,
      'view_phone': instance.viewPhone,
      'premium': instance.premium,
      'top': instance.top,
      'favorites': instance.favorites,
      'date': instance.date,
      'date_expire': instance.dateExpire,
      'gallery': instance.gallery,
      'user': instance.user,
      'filter': instance.filter,
    };

Similar _$SimilarFromJson(Map<String, dynamic> json) => Similar(
      id: json['id'] as int,
      photo: json['photo'] as String?,
      typeAd: json['type_ad'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      categoryId: json['category_id'] as int?,
      responsiblePerson: json['responsible_person'] as String?,
      cityName: json['city_name'] as String?,
      categoryName: json['category_name'] as String?,
      type: json['type'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      content: json['content'] as String?,
      address: json['address'] as String?,
      price: json['price'] as dynamic?,
      priceD: json['price_d'] as int?,
      status: json['status'] as int?,
      lng: json['lng'] as String?,
      lat: json['lat'] as String?,
      views: json['views'] as int?,
      viewPhone: json['view_phone'] as int?,
      premium: json['premium'] as int?,
      top: json['top'] as int?,
      favorites: json['favorites'] as int?,
      date: json['date'] as String?,
      dateExpire: json['date_expire'] as String?,
      gallery:
          (json['gallery'] as List<dynamic>).map((e) => e as String).toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      filter: (json['filter'] as List<dynamic>)
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SimilarToJson(Similar instance) => <String, dynamic>{
      'id': instance.id,
      'type_ad': instance.typeAd,
      'photo': instance.photo,
      'phone': instance.phone,
      'email': instance.email,
      'responsible_person': instance.responsiblePerson,
      'city_name': instance.cityName,
      'category_id': instance.categoryId,
      'category_name': instance.categoryName,
      'type': instance.type,
      'title': instance.title,
      'description': instance.description,
      'content': instance.content,
      'address': instance.address,
      'price': instance.price,
      'price_d': instance.priceD,
      'status': instance.status,
      'lng': instance.lng,
      'lat': instance.lat,
      'views': instance.views,
      'view_phone': instance.viewPhone,
      'premium': instance.premium,
      'top': instance.top,
      'favorites': instance.favorites,
      'date': instance.date,
      'date_expire': instance.dateExpire,
      'gallery': instance.gallery,
      'user': instance.user,
      'filter': instance.filter,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
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
      filterId: json['filter_id'] as int?,
      name: json['name'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'filter_id': instance.filterId,
      'name': instance.name,
      'value': instance.value,
    };
