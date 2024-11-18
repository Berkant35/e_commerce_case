// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      fullName: json['fullName'] as String?,
      sku: json['sku'] as String?,
      stockAmount: (json['stockAmount'] as num?)?.toInt(),
      price1: (json['price1'] as num?)?.toDouble(),
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      discount: (json['discount'] as num?)?.toInt(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      shortDetails: json['shortDetails'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fullName': instance.fullName,
      'sku': instance.sku,
      'stockAmount': instance.stockAmount,
      'price1': instance.price1,
      'currency': instance.currency?.toJson(),
      'discount': instance.discount,
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
      'images': instance.images?.map((e) => e.toJson()).toList(),
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'shortDetails': instance.shortDetails,
    };

Currency _$CurrencyFromJson(Map<String, dynamic> json) => Currency(
      id: (json['id'] as num?)?.toInt(),
      label: json['label'] as String?,
      abbr: json['abbr'] as String?,
    );

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'abbr': instance.abbr,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      id: (json['id'] as num?)?.toInt(),
      originalUrl: json['originalUrl'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'id': instance.id,
      'originalUrl': instance.originalUrl,
    };
