import 'package:e_commerce_case/core/usecases/base_usecase.dart';
import 'package:e_commerce_case/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_case/features/home/domain/repositories/home_repository.dart';

class GetProductListBySearch implements BaseUseCase<List<ProductEntity>, String> {
  final HomeRepository repository;

  GetProductListBySearch(this.repository);
  @override
  Future<List<ProductEntity>> call(String query) async {
    return repository.getProductsWithSearchQuery(query);
  }

}