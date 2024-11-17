

import '../entities/home_entity.dart';

abstract class HomeRepository{
  Future<List<CategoryEntity>> getCategories();
}