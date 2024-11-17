import 'package:e_commerce_case/features/home/domain/entities/home_entity.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_categories.dart';
import 'package:e_commerce_case/features/home/presentation/pages/home/home_viewmodel.dart';
import 'package:e_commerce_case/injection.dart';
import 'package:e_commerce_case/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesControlProvider =
    StateNotifierProvider<CategoriesControlNotifier, List<CategoryEntity>>(
        (ref) {
  return CategoriesControlNotifier([]);
});

class CategoriesControlNotifier extends StateNotifier<List<CategoryEntity>>
    implements HomeViewModel {
  CategoriesControlNotifier(List<CategoryEntity> state) : super([]);

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
}
