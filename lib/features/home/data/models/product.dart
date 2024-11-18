import 'package:e_commerce_case/core/extensions/time_extension.dart';
import 'package:e_commerce_case/features/home/data/models/category.dart';
import 'package:e_commerce_case/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_case/features/home/domain/entities/proudct_detail_entity.dart';
import 'package:e_commerce_case/main.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'product.g.dart';

@JsonSerializable()
class Product with EquatableMixin {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'fullName')
  String? fullName;
  @JsonKey(name: 'sku')
  String? sku;
  @JsonKey(name: 'stockAmount')
  int? stockAmount;
  @JsonKey(name: 'price1')
  double? price1;
  @JsonKey(name: 'currency')
  Currency? currency;
  @JsonKey(name: 'discount')
  int? discount;
  @JsonKey(name: 'categories')
  List<Category>? categories;
  @JsonKey(name: 'images')
  List<Images>? images;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'shortDetails')
  String? shortDetails;

  Product({
    this.id,
    this.name,
    this.fullName,
    this.sku,
    this.stockAmount,
    this.price1,
    this.currency,
    this.discount,
    this.categories,
    this.shortDetails,
    this.images,
    this.updatedAt,
    this.createdAt,
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return  _$ProductFromJson(json);
  }


  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [
    id,
    name,
    fullName,
    sku,
    stockAmount,
    price1,
    currency,
    discount,
    categories,
    images,
    updatedAt,
    createdAt
  ];

  ProductDetailEntity toProductDetailEntity() {
    final prodDetailEntity = ProductDetailEntity(
      id: id.toString(),
      name: name ?? '',
      description: fullName ?? '',
      price: price1.toString(),
      image: images!.isNotEmpty ? images?.first.originalUrl ?? '' : '',
      sku: sku ?? '',
      stockAmount: stockAmount.toString(),
      discount: discount.toString(),
      categories: (categories != null && categories!.isNotEmpty)
          ? categories!.map((e) => e.name ?? "-").toList()
          : [],
      updatedAt: updatedAt != null ? updatedAt!.toDateTimeFromCustomFormat() : DateTime.now(),
      shortDetails: shortDetails ?? '',
    );
    return prodDetailEntity;
  }

  ProductEntity toEntity() {
    final prodEntity = ProductEntity(
      id: id.toString(),
      name: name ?? '',
      description: fullName ?? '',
      price: price1 ?? 0,
      image: images!.isNotEmpty ? images?.first.originalUrl ?? '' : '',
      currency: currency?.label ?? '',
    );

    return prodEntity;
  }

  Product copyWith({
    int? id,
    String? name,
    String? fullName,
    String? sku,
    int? stockAmount,
    double? price1,
    Currency? currency,
    int? discount,
    List<Category>? categories,
    List<Images>? images,
    String? updatedAt,
    String? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      sku: sku ?? this.sku,
      stockAmount: stockAmount ?? this.stockAmount,
      price1: price1 ?? this.price1,
      currency: currency ?? this.currency,
      discount: discount ?? this.discount,
      categories: categories ?? this.categories,
      images: images ?? this.images,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

@JsonSerializable()
class Currency with EquatableMixin {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'label')
  String? label;
  @JsonKey(name: 'abbr')
  String? abbr;

  Currency({
    this.id,
    this.label,
    this.abbr,
  });

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);

  @override
  List<Object?> get props => [id, label, abbr];

  Currency copyWith({
    int? id,
    String? label,
    String? abbr,
  }) {
    return Currency(
      id: id ?? this.id,
      label: label ?? this.label,
      abbr: abbr ?? this.abbr,
    );
  }
}


@JsonSerializable()
class Images with EquatableMixin {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'originalUrl')
  String? originalUrl;

  Images({
    this.id,
    this.originalUrl,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesToJson(this);

  @override
  List<Object?> get props => [id, originalUrl];

  Images copyWith({
    int? id,
    String? originalUrl,
  }) {
    return Images(
      id: id ?? this.id,
      originalUrl: originalUrl ?? this.originalUrl,
    );
  }
}
