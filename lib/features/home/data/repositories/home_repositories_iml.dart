import 'package:e_commerce_case/features/home/data/datasources/api_datasource/remote_datasource.dart';
import 'package:e_commerce_case/features/home/domain/entities/home_entity.dart';
import 'package:e_commerce_case/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_case/features/home/domain/repositories/home_repository.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_product_by_categories.dart';
import 'package:e_commerce_case/main.dart';

class HomeRepositoriesIml extends HomeRepository {
  final RemoteDatasource remoteDatasource;

  HomeRepositoriesIml({required this.remoteDatasource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final categories = await remoteDatasource.getCategories();
    return categories.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> getProductsWithCategoryId(
      ComplexQueryParam complexQueryParam) async {
    final products = await remoteDatasource.getProductsWithCategoryId(complexQueryParam);
    return products.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> getProductsWithSearchQuery(String query) async {
    final products = await remoteDatasource.getProductsWithSearchQuery(query);
    return products.map((e) => e.toEntity()).toList();
  }
}
