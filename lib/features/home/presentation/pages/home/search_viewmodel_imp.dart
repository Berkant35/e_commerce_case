import 'package:e_commerce_case/features/home/domain/entities/product_entity.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_product_by_search.dart';
import 'package:e_commerce_case/features/home/presentation/pages/home/search_viewmodel.dart';
import 'package:e_commerce_case/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryControlProvider =
    StateNotifierProvider<SearchQueryControlNotifier, String?>((ref) {
  return SearchQueryControlNotifier(null);
});

class SearchQueryControlNotifier extends StateNotifier<String?>
    implements SearchViewModel {
  SearchQueryControlNotifier(String? state) : super(null);

  void changState(String? val) => state = val;

  @override
  Future<List<ProductEntity>> getProductsWithSearchQuery() async {
    try {

      if (state == null) {
        return [];
      }

      final res = await injector<GetProductListBySearch>().call(state ?? "");
      return res;
    } on Exception catch (e) {
      return [];
    }
  }

  @override
  void searchProduct(String query) => changState(query);
}
