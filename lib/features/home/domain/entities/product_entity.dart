//Proudct Entitty
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final String currency;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.currency
  });

  @override
  List<Object?> get props => [id, name, description, price, image, currency];
}