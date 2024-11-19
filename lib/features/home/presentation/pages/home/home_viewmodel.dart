import 'package:e_commerce_case/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce_case/features/home/domain/entities/product_entity.dart';

abstract class HomeViewModel {
  Future<List<CategoryEntity>> getCategories();
  Future<CategoryEntity?> addToFilterCategory(CategoryEntity category);
  Future<CategoryEntity?> removeFromFilterCategory(CategoryEntity category);
  List<CategoryEntity> getFilterCategories();
  Future<List<ProductEntity>> getProductsWithCategoryId(String? queryName);
}

