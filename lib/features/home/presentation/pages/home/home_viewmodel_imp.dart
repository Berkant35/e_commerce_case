import 'package:e_commerce_case/features/home/domain/entities/category_entity.dart';
import 'package:e_commerce_case/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_categories.dart';
import 'package:e_commerce_case/features/home/presentation/pages/home/home_viewmodel.dart';
import 'package:e_commerce_case/injection.dart';
import 'package:e_commerce_case/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/get_product_by_categories.dart';

final categoriesAndProductControlProvider =
    StateNotifierProvider<CategoriesControlNotifier, List<CategoryEntity>>(
        (ref) {
  return CategoriesControlNotifier([]);
});

class CategoriesControlNotifier extends StateNotifier<List<CategoryEntity>>
    implements HomeViewModel {
  CategoriesControlNotifier(List<CategoryEntity> state) : super([]);

  List<CategoryEntity> filterCategories = [];

  void changState(List<CategoryEntity> val) => state = val;

  @override
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final res = await injector<GetCategories>().call(null);
      res.then((list) {
        changState(list);
      });
      return res;
    } on Exception catch (e) {
      logger.e(e);
      return [];
    }
  }

  @override
  Future<CategoryEntity?> addToFilterCategory(CategoryEntity category) async {
    try {
      if (filterCategories.contains(category)) {
        return filterCategories.last;
      }
      filterCategories.add(category);
      return filterCategories.last;
    } on Exception catch (e) {
      logger.e(e);
      return filterCategories.last;
    }
  }

  @override
  Future<CategoryEntity?> removeFromFilterCategory(
      CategoryEntity category) async {
    try {
      filterCategories.remove(category);
      return category;
    } on Exception catch (e) {
      logger.e(e);
      return category;
    }
  }

  @override
  List<CategoryEntity> getFilterCategories() => filterCategories;

  @override
  Future<List<ProductEntity>> getProductsWithCategoryId(
      String? queryName) async {
    try {
      final complexQueryParam = ComplexQueryParam(
          filterCategories.map((e) => e.id).toList(), queryName);

      logger.i(complexQueryParam.queryParam);
      final res = await injector<GetProductList>().call(complexQueryParam);
      return res;
    } on Exception catch (e) {
      logger.e(e);
      return Future.value([]);
    }
  }
}
