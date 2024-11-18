import 'package:e_commerce_case/features/home/data/models/product.dart';
import 'package:e_commerce_case/main.dart';

import '../../../../../core/locale_helper/hive_connector.dart';
import 'locale_datasource.dart';

class LocaleDatasourceImp implements LocaleDatasource {
  final HiveConnector hiveConnector;

  LocaleDatasourceImp({required this.hiveConnector});

  @override
  Future<bool> saveProductList(List<Product> productList) async {
    try {
      List<Map<String, dynamic>> products =
          productList.map((e) => e.toJson()).toList();
      await hiveConnector.put('productList', products);
      return true;
    } catch (e) {
      logger.e("Error saving product list: $e");
      return false;
    }
  }

  @override
  Future<Product?> getProduct(int productId) async {
    List<Product> productList = await getProductList();
    Product? product =
        productList.firstWhere((element) => element.id == productId);
    return product;
  }

  @override
  Future<List<Product>> getProductList() async {
    List<Map<String, dynamic>> productList =
        await hiveConnector.get('productList', defaultValue: []);
    List<Product> products =
        productList.map((e) => Product.fromJson(e)).toList();
    return products;
  }
}
