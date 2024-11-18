

import 'package:e_commerce_case/features/home/data/models/category.dart';
import 'package:e_commerce_case/features/home/data/models/product.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_product_by_categories.dart';

abstract class RemoteDatasource {
  Future<List<Category>> getCategories();
  Future<List<Product>> getProductsWithCategoryId(ComplexQueryParam complexQueryParam);
  Future<List<Product>> getProductsWithSearchQuery(String query);
}