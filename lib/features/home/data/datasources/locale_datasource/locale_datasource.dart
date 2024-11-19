import '../../models/product.dart';

abstract class LocaleDatasource{
  Future<bool> saveProductList(List<Product> productList);
  Future<List<Product>> getProductList();
  Future<Product?> getProduct(int productId);
}