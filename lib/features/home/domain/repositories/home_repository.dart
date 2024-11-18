

import 'package:e_commerce_case/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_case/features/home/domain/entities/proudct_detail_entity.dart';

import '../entities/category_entity.dart';
import '../usecases/get_product_by_categories.dart';

abstract class HomeRepository{
  Future<List<CategoryEntity>> getCategories();
  Future<List<ProductEntity>> getProductsWithCategoryId(ComplexQueryParam complexQueryParam);
  Future<List<ProductEntity>> getProductsWithSearchQuery(String query);
  Future<ProductDetailEntity> getProductDetailEntity(String productId);
}