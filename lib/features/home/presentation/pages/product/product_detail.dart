import 'package:e_commerce_case/features/home/domain/entities/proudct_detail_entity.dart';
import 'package:e_commerce_case/features/home/presentation/pages/product/components/product_details.dart';
import 'package:e_commerce_case/features/home/presentation/pages/product/components/product_discount.dart';
import 'package:e_commerce_case/features/home/presentation/pages/product/components/product_image.dart';
import 'package:e_commerce_case/features/home/presentation/pages/product/components/product_stock_info.dart';
import 'package:e_commerce_case/features/home/presentation/pages/product/product_detail_viewmodel_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/route_names.dart';

class ProductDetail extends ConsumerStatefulWidget {
  final String id;

  const ProductDetail({super.key, required this.id});

  @override
  ConsumerState createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: FutureBuilder<ProductDetailEntity?>(
          future: ref
              .read(productDetailViewmodelImpControlProvider.notifier)
              .getProductWithId(widget.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Hata oluştu"));
            } else {
              final productDetail = snapshot.data;
              return productDetail == null
                  ? const Center(child: Text("Ürün bulunamadı"))
                  : _detail(productDetail);
            }
          }),
    );
  }

  FadeTransition _detail(ProductDetailEntity productDetail) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProductImage(imageUrl: productDetail.image),
            ProductDetails(
              name: productDetail.name,
              price: double.parse(productDetail.price),
              description: productDetail.description,
              shortDetails: productDetail.shortDetails,
            ),
            ProductStockInfo(
              stockAmount: productDetail.stockAmount,
              sku: productDetail.sku,
              categories: productDetail.categories,
            ),
            if (double.parse(productDetail.discount) > 0)
              ProductDiscount(discount: double.parse(productDetail.discount)),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text("Ürün Detay"),
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.goNamed(RouteNames.home);
            }
          }),
    );
  }
}
