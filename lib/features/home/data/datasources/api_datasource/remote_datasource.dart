

import 'package:e_commerce_case/features/home/data/models/category.dart';

abstract class RemoteDatasource {
  Future<List<Category>> getCategories();
}