import 'package:e_commerce_case/core/usecases/base_usecase.dart';
import 'package:e_commerce_case/features/home/domain/entities/proudct_detail_entity.dart';

import '../repositories/home_repository.dart';

class GetProductDetail implements BaseUseCase<ProductDetailEntity,String>{
  final HomeRepository repository;

  GetProductDetail(this.repository);
  @override
  Future<ProductDetailEntity> call(String id) async {
    return repository.getProductDetailEntity(id);
  }
}