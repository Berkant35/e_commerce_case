import 'package:e_commerce_case/core/usecases/base_usecase.dart';
import 'package:e_commerce_case/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_case/features/home/domain/repositories/home_repository.dart';
import '../../../../core/config/paths.dart';

class ComplexQueryParam {
  final List<String> categories;
  final String? query;

  ComplexQueryParam(this.categories, this.query);

  //create complex query
  String get queryParam {
    return categories.isNotEmpty
        ? "?${FilterPaths.categoryIds}=${categories.join(
        ",")}${(query != null && query!.isNotEmpty) ? "&${FilterPaths
        .searchQuery}=$query" : ""}"
    : "" ;
  }
}

class GetProductList
    implements BaseUseCase<List<ProductEntity>, ComplexQueryParam> {
  final HomeRepository repository;

  GetProductList(this.repository);

  @override
  Future<List<ProductEntity>> call(ComplexQueryParam params) async {
    return repository.getProductsWithCategoryId(params);
  }
}