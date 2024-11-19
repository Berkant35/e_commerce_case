import 'package:e_commerce_case/features/home/domain/entities/product_entity.dart';

abstract class SearchViewModel {
   Future<List<ProductEntity>> getProductsWithSearchQuery();
   void searchProduct(String query);
}