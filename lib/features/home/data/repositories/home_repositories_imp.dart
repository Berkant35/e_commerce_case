import 'package:e_commerce_case/features/home/data/datasources/api_datasource/remote_datasource.dart';
import 'package:e_commerce_case/features/home/data/datasources/locale_datasource/locale_datasource.dart';
import 'package:e_commerce_case/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce_case/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_case/features/home/domain/entities/proudct_detail_entity.dart';
import 'package:e_commerce_case/features/home/domain/repositories/home_repository.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_product_by_categories.dart';

class HomeRepositoriesIml extends HomeRepository {
  final HomeRemoteDatasource homeRemoteDatasource;
  final LocaleDatasource localDatasourceImp;

  HomeRepositoriesIml({
    required this.localDatasourceImp,
    required this.homeRemoteDatasource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final categories = await homeRemoteDatasource.getCategories();
    return categories.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> getProductsWithCategoryId(
      ComplexQueryParam complexQueryParam) async {
    final products =
        await homeRemoteDatasource.getProductsWithCategoryId(complexQueryParam);
    // save to locale
    await localDatasourceImp.saveProductList(products);
    return products.map((e) => e.toEntity()).toList();
  }

  @override
  Future<List<ProductEntity>> getProductsWithSearchQuery(String query) async {
    final products = await homeRemoteDatasource.getProductsWithSearchQuery(query);
    return products.map((e) => e.toEntity()).toList();
  }

  @override
  Future<ProductDetailEntity> getProductDetailEntity(String productId) async {
    final localeProductEntity = await localDatasourceImp.getProduct(int.parse(productId));

    if(localeProductEntity != null){
      return localeProductEntity.toProductDetailEntity();
    }

    final productDetail =
        await homeRemoteDatasource.getProductDetailEntity(productId);
    return productDetail.toProductDetailEntity();
  }
}
