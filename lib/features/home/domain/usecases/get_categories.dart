import 'package:e_commerce_case/core/usecases/base_usecase.dart';
import 'package:e_commerce_case/features/home/domain/entities/home_entity.dart';
import 'package:e_commerce_case/features/home/domain/repositories/home_repository.dart';

class GetCategories extends BaseUseCase<Future<List<CategoryEntity>>, void> {
  final HomeRepository repository;

  GetCategories(this.repository);

  @override
  Future<Future<List<CategoryEntity>>> call(void params) async {
    return repository.getCategories();
  }
}
