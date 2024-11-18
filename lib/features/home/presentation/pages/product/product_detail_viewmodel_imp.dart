import 'package:e_commerce_case/features/home/domain/entities/proudct_detail_entity.dart';
import 'package:e_commerce_case/features/home/domain/usecases/get_product_detail.dart';
import 'package:e_commerce_case/features/home/presentation/pages/product/product_detail_viewmodel.dart';
import 'package:e_commerce_case/injection.dart';
import 'package:e_commerce_case/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productDetailViewmodelImpControlProvider = StateNotifierProvider<
    ProductDetailViewmodelImpControlNotifier, ProductDetailEntity?>((ref) {
  return ProductDetailViewmodelImpControlNotifier(null);
});

class ProductDetailViewmodelImpControlNotifier
    extends StateNotifier<ProductDetailEntity?>
    implements ProductDetailViewModel {
  ProductDetailViewmodelImpControlNotifier(ProductDetailEntity? state)
      : super(null);

  void changState(ProductDetailEntity val) => state = val;

  @override
  Future<ProductDetailEntity?> getProductWithId(String id) async {
    try{
      final productDetail = await injector<GetProductDetail>().call(id);
      changState(productDetail);
    }catch(e){
      logger.e("ProductDetailViewmodelImpControlNotifier: $e");
    }
    return state;
  }
}
