import 'package:e_commerce_case/features/home/data/datasources/api_datasource/remote_datasource.dart';
import 'package:e_commerce_case/features/home/domain/entities/home_entity.dart';
import 'package:e_commerce_case/features/home/domain/repositories/home_repository.dart';
import 'package:e_commerce_case/main.dart';

class HomeRepositoriesIml extends HomeRepository {
  final RemoteDatasource remoteDatasource;

  HomeRepositoriesIml({required this.remoteDatasource});

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final categories = await remoteDatasource.getCategories();
    return categories.map((e) => e.toEntity()).toList();
  }
}
