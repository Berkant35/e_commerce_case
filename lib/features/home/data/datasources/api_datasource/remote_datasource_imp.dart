import 'package:e_commerce_case/core/api_helper/api_connector.dart';
import 'package:e_commerce_case/core/config/paths.dart';
import 'package:e_commerce_case/features/home/data/datasources/api_datasource/remote_datasource.dart';
import 'package:e_commerce_case/features/home/data/models/category.dart';
import 'package:e_commerce_case/features/home/data/models/product.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_product_by_categories.dart';

class RemoteDatasourceImp extends RemoteDatasource {
  final ApiConnector apiConnector;

  RemoteDatasourceImp({required this.apiConnector});

  @override
  Future<List<Category>> getCategories() async {
    var response = await apiConnector.get(Paths.categories);
    final categoryList = (response as List<dynamic>).map((e) {
      final category = Category.fromJson(e as Map<String, dynamic>);
      return category;
    }).toList();
    return categoryList;
  }

  @override
  Future<List<Product>> getProductsWithCategoryId(
      ComplexQueryParam complexQueryParam) async {

    var response = await apiConnector.get(Paths.filterProducts,
        queryParameters: complexQueryParam.queryParam);

    final productList = (response as List<dynamic>).map((e) {
      final product = Product.fromJson(e as Map<String, dynamic>);
      return product;
    }).toList();

    return productList;
  }

  @override
  Future<List<Product>> getProductsWithSearchQuery(String query) async {
    var response = await apiConnector.get(Paths.filterProducts,
        queryParameters: "?${FilterPaths.searchQuery}=$query");
    final productList = (response as List<dynamic>).map((e) {
      final product = Product.fromJson(e as Map<String, dynamic>);
      return product;
    }).toList();
    return productList;
  }
}
