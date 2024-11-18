import 'package:equatable/equatable.dart';

class ProductDetailEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String price;
  final String image;
  final String shortDetails;
  final String sku;
  final String stockAmount;
  final String discount;
  final List<String> categories;
  final DateTime updatedAt;

  const ProductDetailEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.categories,
    required this.shortDetails,
    required this.sku,
    required this.stockAmount,
    required this.discount,
    required this.updatedAt,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name,
    description,
    price,
    image,
    shortDetails,
    sku,
    stockAmount,
    discount,
    categories,
    updatedAt
  ];


}