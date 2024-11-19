import 'package:e_commerce_case/features/home/domain/entities/proudct_detail_entity.dart';

abstract class ProductDetailViewModel {
  Future<ProductDetailEntity?> getProductWithId(String id);
}