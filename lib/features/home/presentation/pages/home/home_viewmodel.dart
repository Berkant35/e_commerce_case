

import 'package:e_commerce_case/features/home/domain/entities/home_entity.dart';

abstract class HomeViewModel {
  Future<List<CategoryEntity>> getCategories();
  Future<CategoryEntity?> chooseCategory(CategoryEntity category);
}